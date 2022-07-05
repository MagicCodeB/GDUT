#include <stdio.h>
#include <stdlib.h>

typedef struct pcb   /*���̽ڵ���Ϣ*/
{
    char name[20];   /*���̵�����*/
    int pcbTimeslice;    /*����CPU��ʱ��Ƭ*/
    int cputime;   /*CPUִ��ʱ��*/
    int needtime;   /*����ִ������Ҫ��ʱ��*/
    char state;    /*���̵�״̬��W��������̬��R����ִ��̬��F�������̬*/
    int count;    /*��¼ִ�еĴ���*/
    struct pcb *next;  /*����ָ��*/
}PCB;

typedef struct Queue  /*�༶�������нڵ���Ϣ*/
{
    PCB *LinkPCB;   /*���������еĽ��̶���ָ��*/
    int queueTimeslice;    /*�����������������ʱ��Ƭ*/
    struct Queue *next;  /*ָ����һ���������е�����ָ��*/
}ReadyQueue;

PCB *run=NULL,*finish=NULL; /*�����������У��������У�ִ�ж��к���ɶ���*/
ReadyQueue *Head = NULL; /*�����һ����������*/

int num;     /*���̸���*/
int ReadyNum;    /*�������и���*/

void Output();          /*������Ϣ�������*/
void InsertFinish(PCB *in);       /*�����̲��뵽��ɶ���β��*/
void SortQueue(ReadyQueue *in);     /*�����������У��涨������ԽС�����ȼ�Խ��*/
void QueueCreate();         /*���������������뺯��*/
void GetFirst(ReadyQueue *queue);     /*ȡ��ĳһ�����������еĶ�ͷ����*/
void InsertLast(PCB *in,ReadyQueue *queue);   /*�����̲��뵽��������β��*/
void ProcessCreate();        /*���̴�������*/
void RoundRun(ReadyQueue *timechip);    /*ʱ��Ƭ��ת�����㷨*/
void Algorithm();        /*�༶�����㷨��ÿ��ִ��һ��ʱ��Ƭ*/

int main()
{
    QueueCreate(); /*������������*/
    ProcessCreate();/*�����������̶���*/
    Algorithm();/*�㷨��ʼ*/
    Output();  /*������յĵ�������*/
    printf("\n���н��������\n");
    system("PAUSE");
    return 0;
}
void Output()  /*������Ϣ�������*/
{
    ReadyQueue *print = Head;
    PCB *p;
    while(print){
        if(print->LinkPCB != NULL){
            p=print->LinkPCB;
            if(p->pcbTimeslice==1){
                printf("\n��ǰΪ��1ʱ��Ƭ��ʱ��Ƭ����Ϊ1");
            }
            else if(p->pcbTimeslice==2){
                printf("\n��ǰΪ��2ʱ��Ƭ��ʱ��Ƭ����Ϊ2");
            }
            else if(p->pcbTimeslice==4){
                printf("\n��ǰΪ��3ʱ��Ƭ��ʱ��Ƭ����Ϊ3");
            }
            else if(p->pcbTimeslice==8){
                printf("\n��ǰΪ��4ʱ��Ƭ��ʱ��Ƭ����Ϊ8");
            }
            printf("\n***************�������̶���Ϊ***************\n");
            printf("������\t��������ʱ��\t������Ҫʱ��\t����״̬\n");
            while(p){
                printf("  %s\t\t%d\t\t%d\t  %c\n",p->name,p->cputime,p->needtime,p->state);
                p=p->next;
            }
        }
        print = print->next;
    }
    p = finish;
    printf("\n***************����ɽ��̶���Ϊ***************\n");
    printf("������\t��������ʱ��\t������Ҫʱ��\t����״̬\n");
    while(p!=NULL)
    {
        printf("  %s\t\t%d\t\t%d\t  %c\n",p->name,p->cputime,p->needtime,p->state);
        p = p->next;
    }
    p = run;
    printf("\n***************�������н��̶���Ϊ***************\n");
    printf("������\t��������ʱ��\t������Ҫʱ��\t����״̬\n");
    while(p!=NULL)
    {
        printf("  %s\t\t%d\t\t%d\t  %c\n",p->name,p->cputime,p->needtime,p->state);
        p = p->next;
    }
}

void InsertFinish(PCB *process)  /*�����̲��뵽��ɶ���β��*/
{
    PCB *FinishProcess;
    FinishProcess = finish;
    if(finish == NULL){//�ý����ǵ�һ��������ɶ��е�
        process->next = finish;
        finish = process;
    }
    else{//������ɵĽ��̲��뵽��ɶ��е�β��
        while(FinishProcess->next != NULL){
            FinishProcess = FinishProcess->next;
        }
        process->next = FinishProcess->next;
        FinishProcess->next = process;
    }
}

void SortQueue(ReadyQueue *in)  /*�����������У��涨������ԽС�����ȼ�Խ��*/
{
    ReadyQueue *q;
    q = Head;
    if(Head == NULL){    /*���û�ж��У���Ϊ��һ��Ԫ��*/
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

void QueueCreate() /*���������������뺯��*/
{
    ReadyQueue *q;//�½���������
    int i;
    printf("����������еĸ�����");
    scanf("%d",&ReadyNum);
    printf("���С��������ÿ�����е�ʱ��Ƭ����\n");
    for(i = 0;i < ReadyNum; i++){
        q = (ReadyQueue *)malloc(sizeof(ReadyQueue));
        printf("����%d�����ʱ��ƬΪ��",i+1);
        scanf("%d",&(q->queueTimeslice));  /*����˾��������и�ÿ�������������CPUʱ��Ƭ*/
        q->LinkPCB = NULL;    /*��ʼ�������ӵĽ��̶���Ϊ��*/
        q->next = NULL;
        SortQueue(q);     /*�������ȼ��Ӹߵ��ͣ����������������*/
    }
}

void GetFirst(ReadyQueue *queue)     /*ȡ��ĳһ�����������еĶ�ͷ����*/
{
    run = queue->LinkPCB;//�����������еĶ�ͷԪ�ط���ִ�ж�����
    if(queue->LinkPCB != NULL){
        run->state = 'R';//�޸Ľ���״̬ΪR
        queue->LinkPCB = queue->LinkPCB->next;
        run->next = NULL;
    }
}

void InsertLast(PCB *in,ReadyQueue *queue)  /*�����̲��뵽��������β��*/
{
    PCB *process;
    process = queue->LinkPCB;
    if( queue->LinkPCB == NULL){//����ý����ǵ�һ������������е�
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

void ProcessCreate() /*���̴�������*/
{
    PCB *p;
    int i;
    printf("������̵ĸ�����");
    scanf("%d",&num);
    for(i = 0;i < num; i++){//����num������
        p = (PCB *)malloc(sizeof(PCB));
        printf("����������֣�");
        scanf("%s",p->name);
        getchar();        /*���ջس�����*/
        printf("��������������ʱ�䣺");
        scanf("%d",&(p->needtime));
        p->cputime=0;
        p->state ='W';
        p->pcbTimeslice = Head ->queueTimeslice;
        p->count = 0;
        InsertLast(p,Head); //���뵽��һ���������еĶ�β
    }
}

void RoundRun(ReadyQueue *timeSlice)    /*ʱ��Ƭ��ת�����㷨*/
{
    int flag=1;//���ý������б�ʶ��
    GetFirst(timeSlice);
    while(run!= NULL){
        while(flag){
            run->count++;//�������м�����+1
            run->cputime++;//����������ʱ��+1
            run->needtime--;//��������ʱ��-1
            if(run->needtime == 0){ /*����ִ�����*/
                run ->state = 'F';
                InsertFinish(run);
                flag = 0;
            }
            else if(run->count == timeSlice->queueTimeslice)/*ʱ��Ƭ����*/{
                run->state = 'W';//�ý���״̬����Ϊ�ȴ�
                run->count = 0;   /*���������㣬Ϊ�´���׼��*/
                InsertLast(run,timeSlice);
                flag = 0;
            }
        }
        flag = 1;
        GetFirst(timeSlice);
    }
}

void Algorithm()   /*�༶�����㷨��ÿ��ִ��һ��ʱ��Ƭ*/
{
    int flag = 1;
    ReadyQueue *p;
    p = Head;
    GetFirst(p);//ȡ�������еĵ�һ��Ԫ��
    while(run != NULL){
        Output();
        if(Head->LinkPCB!=NULL)
            p = Head;
        while(flag){
            run->count++;
            run->cputime++;
            run->needtime--;
            if(run->needtime == 0){ /*����ִ�����*/
                run->state = 'F';
                InsertFinish(run);
                flag = 0;
            }
            else if(run->count == run->pcbTimeslice){/*ʱ��Ƭ����*/
                run->state = 'W';
                run->count = 0;   /*���������㣬Ϊ�´���׼��*/
                if(p->next!=NULL){
                    run->pcbTimeslice=p->next ->queueTimeslice;/*������ʱ��Ƭ����һ���������е�ʱ��Ƭ*/
                    InsertLast(run,p->next);  /*�����̲��뵽��һ������������*/
                    flag = 0;
                }
                else{
                    RoundRun(p);   /*Ϊ���һ���������е���ʱ��Ƭ��ת�㷨*/
                    break;
                }
            }
        }
        flag = 1;
        if(p->LinkPCB == NULL)/*��������ָ������*/
            p=p->next;
        if(p->next ==NULL){
            RoundRun(p);
            break;
        }
        GetFirst(p);
    }
}
