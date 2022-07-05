#include <stdio.h>
#include <stdlib.h>

typedef struct pcb   /*进程节点信息*/
{
    char name[20];   /*进程的名字*/
    int pcbTimeslice;    /*分配CPU的时间片*/
    int cputime;   /*CPU执行时间*/
    int needtime;   /*进程执行所需要的时间*/
    char state;    /*进程的状态，W——就绪态，R——执行态，F——完成态*/
    int count;    /*记录执行的次数*/
    struct pcb *next;  /*链表指针*/
}PCB;

typedef struct Queue  /*多级就绪队列节点信息*/
{
    PCB *LinkPCB;   /*就绪队列中的进程队列指针*/
    int queueTimeslice;    /*本就绪队列所分配的时间片*/
    struct Queue *next;  /*指向下一个就绪队列的链表指针*/
}ReadyQueue;

PCB *run=NULL,*finish=NULL; /*定义三个队列，就绪队列，执行队列和完成队列*/
ReadyQueue *Head = NULL; /*定义第一个就绪队列*/

int num;     /*进程个数*/
int ReadyNum;    /*就绪队列个数*/

void Output();          /*进程信息输出函数*/
void InsertFinish(PCB *in);       /*将进程插入到完成队列尾部*/
void SortQueue(ReadyQueue *in);     /*创建就绪队列，规定优先数越小，优先级越低*/
void QueueCreate();         /*创建就绪队列输入函数*/
void GetFirst(ReadyQueue *queue);     /*取得某一个就绪队列中的队头进程*/
void InsertLast(PCB *in,ReadyQueue *queue);   /*将进程插入到就绪队列尾部*/
void ProcessCreate();        /*进程创建函数*/
void RoundRun(ReadyQueue *timechip);    /*时间片轮转调度算法*/
void Algorithm();        /*多级调度算法，每次执行一个时间片*/

int main()
{
    QueueCreate(); /*创建就绪队列*/
    ProcessCreate();/*创建就绪进程队列*/
    Algorithm();/*算法开始*/
    Output();  /*输出最终的调度序列*/
    printf("\n所有进程已完成\n");
    system("PAUSE");
    return 0;
}
void Output()  /*进程信息输出函数*/
{
    ReadyQueue *print = Head;
    PCB *p;
    while(print){
        if(print->LinkPCB != NULL){
            p=print->LinkPCB;
            if(p->pcbTimeslice==1){
                printf("\n当前为第1时间片，时间片长度为1");
            }
            else if(p->pcbTimeslice==2){
                printf("\n当前为第2时间片，时间片长度为2");
            }
            else if(p->pcbTimeslice==4){
                printf("\n当前为第3时间片，时间片长度为3");
            }
            else if(p->pcbTimeslice==8){
                printf("\n当前为第4时间片，时间片长度为8");
            }
            printf("\n***************就绪进程队列为***************\n");
            printf("进程名\t进程运行时间\t进程需要时间\t进程状态\n");
            while(p){
                printf("  %s\t\t%d\t\t%d\t  %c\n",p->name,p->cputime,p->needtime,p->state);
                p=p->next;
            }
        }
        print = print->next;
    }
    p = finish;
    printf("\n***************已完成进程队列为***************\n");
    printf("进程名\t进程运行时间\t进程需要时间\t进程状态\n");
    while(p!=NULL)
    {
        printf("  %s\t\t%d\t\t%d\t  %c\n",p->name,p->cputime,p->needtime,p->state);
        p = p->next;
    }
    p = run;
    printf("\n***************正在运行进程队列为***************\n");
    printf("进程名\t进程运行时间\t进程需要时间\t进程状态\n");
    while(p!=NULL)
    {
        printf("  %s\t\t%d\t\t%d\t  %c\n",p->name,p->cputime,p->needtime,p->state);
        p = p->next;
    }
}

void InsertFinish(PCB *process)  /*将进程插入到完成队列尾部*/
{
    PCB *FinishProcess;
    FinishProcess = finish;
    if(finish == NULL){//该进程是第一个进入完成队列的
        process->next = finish;
        finish = process;
    }
    else{//将该完成的进程插入到完成队列的尾部
        while(FinishProcess->next != NULL){
            FinishProcess = FinishProcess->next;
        }
        process->next = FinishProcess->next;
        FinishProcess->next = process;
    }
}

void SortQueue(ReadyQueue *in)  /*创建就绪队列，规定优先数越小，优先级越低*/
{
    ReadyQueue *q;
    q = Head;
    if(Head == NULL){    /*如果没有队列，则为第一个元素*/
        in->next = Head;
        Head = in;
    }
    else{
        while(q->next != NULL){
            q = q->next;
        }
        if(q->next == NULL){
            in->next = q->next;
            q->next = in;
        }
    }
}

void QueueCreate() /*创建就绪队列输入函数*/
{
    ReadyQueue *q;//新建就绪队列
    int i;
    printf("输入就绪队列的个数：");
    scanf("%d",&ReadyNum);
    printf("请从小到大输入每个队列的时间片长度\n");
    for(i = 0;i < ReadyNum; i++){
        q = (ReadyQueue *)malloc(sizeof(ReadyQueue));
        printf("队列%d分配的时间片为：",i+1);
        scanf("%d",&(q->queueTimeslice));  /*输入此就绪队列中给每个进程所分配的CPU时间片*/
        q->LinkPCB = NULL;    /*初始化其连接的进程队列为空*/
        q->next = NULL;
        SortQueue(q);     /*按照优先级从高到低，建立多个就绪队列*/
    }
}

void GetFirst(ReadyQueue *queue)     /*取得某一个就绪队列中的队头进程*/
{
    run = queue->LinkPCB;//将就绪队列中的队头元素放入执行队列中
    if(queue->LinkPCB != NULL){
        run->state = 'R';//修改进程状态为R
        queue->LinkPCB = queue->LinkPCB->next;
        run->next = NULL;
    }
}

void InsertLast(PCB *in,ReadyQueue *queue)  /*将进程插入到就绪队列尾部*/
{
    PCB *process;
    process = queue->LinkPCB;
    if( queue->LinkPCB == NULL){//如果该进程是第一个进入就绪队列的
        in->next =  queue->LinkPCB;
        queue->LinkPCB = in;
    }
    else{
        while(process->next != NULL){
            process = process->next;
        }
        in->next = process->next;
        process->next = in;
    }
}

void ProcessCreate() /*进程创建函数*/
{
    PCB *p;
    int i;
    printf("输入进程的个数：");
    scanf("%d",&num);
    for(i = 0;i < num; i++){//创建num个进程
        p = (PCB *)malloc(sizeof(PCB));
        printf("输入进程名字：");
        scanf("%s",p->name);
        getchar();        /*吸收回车符号*/
        printf("输入进程完成所需时间：");
        scanf("%d",&(p->needtime));
        p->cputime=0;
        p->state ='W';
        p->pcbTimeslice = Head ->queueTimeslice;
        p->count = 0;
        InsertLast(p,Head); //插入到第一个就绪队列的队尾
    }
}

void RoundRun(ReadyQueue *timeSlice)    /*时间片轮转调度算法*/
{
    int flag=1;//设置进程运行标识符
    GetFirst(timeSlice);
    while(run!= NULL){
        while(flag){
            run->count++;//进程运行计数器+1
            run->cputime++;//进程总运行时间+1
            run->needtime--;//进程需求时间-1
            if(run->needtime == 0){ /*进程执行完毕*/
                run ->state = 'F';
                InsertFinish(run);
                flag = 0;
            }
            else if(run->count == timeSlice->queueTimeslice)/*时间片用完*/{
                run->state = 'W';//该进程状态设置为等待
                run->count = 0;   /*计数器清零，为下次做准备*/
                InsertLast(run,timeSlice);
                flag = 0;
            }
        }
        flag = 1;
        GetFirst(timeSlice);
    }
}

void Algorithm()   /*多级调度算法，每次执行一个时间片*/
{
    int flag = 1;
    ReadyQueue *p;
    p = Head;
    GetFirst(p);//取就绪队列的第一个元素
    while(run != NULL){
        Output();
        if(Head->LinkPCB!=NULL)
            p = Head;
        while(flag){
            run->count++;
            run->cputime++;
            run->needtime--;
            if(run->needtime == 0){ /*进程执行完毕*/
                run->state = 'F';
                InsertFinish(run);
                flag = 0;
            }
            else if(run->count == run->pcbTimeslice){/*时间片用完*/
                run->state = 'W';
                run->count = 0;   /*计数器清零，为下次做准备*/
                if(p->next!=NULL){
                    run->pcbTimeslice=p->next ->queueTimeslice;/*设置其时间片是下一个就绪队列的时间片*/
                    InsertLast(run,p->next);  /*将进程插入到下一个就绪队列中*/
                    flag = 0;
                }
                else{
                    RoundRun(p);   /*为最后一个就绪队列调用时间片轮转算法*/
                    break;
                }
            }
        }
        flag = 1;
        if(p->LinkPCB == NULL)/*就绪队列指针下移*/
            p=p->next;
        if(p->next ==NULL){
            RoundRun(p);
            break;
        }
        GetFirst(p);
    }
}
