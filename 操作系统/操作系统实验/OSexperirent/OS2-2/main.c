#include <stdio.h>
#include <stdlib.h>

#define getJch(type) (type*)malloc(sizeof(type))

struct jcb { /* 定义进程控制块JCB */
    char name[10]; //作业名字
    char state; //作业状态
    int arriveTime; //作业到达时间
    int beginTime; //作业开始运行的时刻
    int needTime; //作业需要的运行时间
    int runTime; //作业已经运行的时间
    int finishTime; //作业结束运行的时间
    int memory; //作业需要的内存大小
    int disk; //作业需要的磁带机数量
    struct jcb *next; //指向队列中下一个作业的指针
}*ready= NULL, *run= NULL, *finish= NULL, *p, *q = NULL;

typedef struct jcb JCB;

int totalMemory = 100, totalDisk = 5;

void FCFS();//先来先服务调度函数
void SJF();//短作业优先调度函数
void input();//输入作业信息函数
void output();//输出函数
void Running(JCB* s);//运行函数
void print(JCB* t);//打印函数
void Finish(JCB* s);//结束函数
JCB* findHead(JCB* s);//找头结点函数
JCB* findFCFS(int time, JCB* s);//先来先服务调度算法中寻找合适的作业函数
JCB* findSJF(int time, JCB* s);//短作业优先调度算法中寻找合适的作业函数

int main(){
    int choice;
    input();//输入作业信息
    printf("\n1.FCFS调度算法\t2.SJF调度算法\t3.结束程序\n");
    printf("**请选择调度算法或结束程序: ");
    scanf("%d", &choice);
    switch(choice){
        case 1: {
            FCFS();//选择先来先服务算法
            break;
        }
        case 2: {
            SJF();//选择短作业优先算法
            break;
        }
        default: {
            printf("\n程序结束\n");
            break;
        }
    }
    system("PAUSE");
    return 0;
}

void print(JCB* t){ /*输出单个作业的信息*/
    printf("    %s\t",t->name);
    switch(t->state){
        case 'W': {
            printf("等待中\t\t");
            break;
        }
        case 'R': {
            printf("运行中\t\t");
            break;
        }
        case 'F': {
            printf("已完成\t\t");
            break;
        }
    }
    printf("%d\t\t", t->arriveTime);
    printf("%d\t\t", t->needTime);
    printf("%d\t\t", t->memory);
    printf("%d\t\t", t->disk);
    printf("\n");
}

void output(){ /*打印作业表*/
    JCB *t;
    printf("完成队列为：\n");
    printf("************************************************************************************\n");
    printf(" 作业名称\t 状态\t    到达时间\t     需要时间\t     需要内存\t     磁带机\n");
    for(t=finish;t!=NULL;t=t->next){
        print(t);
    }
    if(finish!=NULL){
        printf("\n");
    }
    t=run;
    printf("************************************************************************************\n");
    printf("\n");
    printf("运行队列为：\n");
    printf("************************************************************************************\n");
    printf(" 作业名称\t 状态\t    到达时间\t     需要时间\t     需要内存\t     磁带机\n");
    if(run!=NULL){
        if(run->next == run){
            print(run);
        }
        else {
            print(run);
            print(run->next);
        }
        printf("\n");
    }
    printf("************************************************************************************\n");
    printf("\n");
    printf("就绪队列为：\n");
    printf("************************************************************************************\n");
    printf(" 作业名称\t 状态\t    到达时间\t     需要时间\t     需要内存\t     磁带机\n");
    for(t=ready;t!=NULL;t=t->next){
        print(t);
    }
    printf("************************************************************************************\n");
    printf("\n");
}

JCB* findHead(JCB* s){ /*寻找指定结点的父亲结点*/
    JCB *t=ready;
    if(t==s)return NULL;
    while((t->next != s)){
        t=t->next;
    }
    return t;
}

void Running(JCB* s){ /*将正在运行的作业存放到运行队列*/
    JCB *t=findHead(s);
    if(t==NULL){
        ready=s->next;
    }
    else{
        t->next=s->next;
    }
    if(run==NULL){
        run=s;
        run->next=run;
    }
    else{
        run->next=s;
    }
    s->next=run;
}

void Finish(JCB* s){ /*将已完成的作业另存至完成队列*/
    JCB *t;
    if(run->next != run){
        run=s->next;
        run->next=run;
    }
    else run=NULL;
    t=finish;
    if(t == NULL)finish=s;
    else {
        while(t->next != NULL){
            t=t->next;
        }
        t->next=s;
    }
    s->next=NULL;
}

JCB* findFCFS(int time, JCB* s){ /*找到下一个未完成且资源足够的作业*/
    JCB *t = ready;
    while(t != NULL){
        if((time >= t->arriveTime) && (t->state != 'F') && (totalMemory - s->memory >= t->memory)
           && (totalDisk - s->disk >= t->disk)){
            return t;
        }
        else t=t->next;
    }
    return t;
}

void FCFS(){ /*先来先服务调度算法*/
    int time;
    JCB *c;
    p=ready;
    printf("\n先来先服务调度算法: \n");
    for(time=0;p!=NULL;time++){
        if(time >= p->arriveTime){ //作业已到达
            if(p->runTime == 0){ //运行时间为0，则开始运行
                p->beginTime=time;
                p->state='R';
                Running(p);
                printf("\n作业[%s]开始运行. . . \n", p->name);
                output();
                system("PAUSE");
            }
            if((p->state=='R') && (p->needTime>p->runTime)){ //作业正在运行且未运行完毕
                p->runTime++;
            }
            if(p->needTime == p->runTime){
                p->state='F';//作业状态设为F
                p->finishTime=time+1;
                Finish(p);
                if(run != NULL)p=run;
                else p=findFCFS(time, p);
                if(p == NULL){
                    if(ready!= NULL)p=ready;
                    else break;
                }
                continue;
            }
            if(run->next == run)q=findFCFS(time, p);
            if(q != NULL){
                p=q;
                q=NULL;
                continue;
            }
            p = p->next;
        }
    }
    printf("\n**所有作业已完成\n");
    output();
}

JCB* findSJF(int time, JCB* s){ /*找到未完成的作业中最短的且资源足够的作业*/
    JCB *min =ready;
    JCB *t =ready;
    while(t != NULL){
        if((time >= t->arriveTime) && (t->state != 'F') && (t->needTime < min->needTime) && (totalMemory - s->memory >= t->memory) && (totalDisk - s->disk >= t->disk)){ //已到达且未完成的作业中找最短且资源足够的作业
            min = t;
        }
        t = t->next;
    }
    if((min != NULL) && ((totalMemory - s->memory < min->memory) || (totalDisk - s->disk < min->disk))){ //等待队列未空且资源不足
        t=ready;
        while(t != NULL){
            if((time >= t->arriveTime) && (t->state != 'F') && (t->needTime < min->needTime)){ //已到达且未完成的作业中找最短的作业
                min = t;
            }
            t = t->next;
        }
    }
    return min;
}

void SJF(){ /*最短作业优先调度算法*/
    int time;
    p=ready;
    printf("\n最短作业优先调度(SJF)算法: \n");
    for(time = 0; p != NULL; time++){
        if(time >= p->arriveTime){ //作业已到达
            if(p->runTime == 0){ //运行时间为0，则开始运行
                p->beginTime = time;
                p->state = 'R';
                Running(p);
                printf("\n**作业[%s]开始运行. . . \n", p->name);
                output();
                system("PAUSE");
            }
            if((p->state == 'R') && (p->needTime > p->runTime)){ //作业正在运行且未运行完毕
                p->runTime++;
            }
            if(p->needTime == p->runTime){
                p->state = 'F';
                p->finishTime = time + 1;
                Finish(p);
                p = findSJF(time, p);//找到下一个未完成的最短的作业
                if(run != NULL)p = run;
                else p = findSJF(time, p);
                if(p == NULL)break;
                continue;
            }
            if(run->next == run)q=findFCFS(time, p);
            if(q!=NULL){
                p=q;
                q=NULL;
                continue;
            }
            p = p->next;//多道实质为轮换运行
        }
    }
    printf("\n**所有作业已完成\n");
    output();
}

void insert(){ /*将输入作业结点按FCFS顺序插入到等待队列*/
    JCB *s, *t;
    if(ready== NULL){
        ready= p;
        ready->next = NULL;
    }
    else {
        s=t=ready;
        while((t != NULL) && (p->arriveTime >= t->arriveTime)){
            t = t->next;
        }
        if(t == ready){
            p->next=ready;
            ready=p;
        }
        else {
            while(s->next != t){
                s = s->next;
            }
            p->next = t;
            s->next = p;
        }
    }
}

void input(){ /*输入作业信息*/
    int n, i;
    printf("请输入作业个数:");
    scanf("%d", &n);
    printf("\n");
    for(i=0;i<n;i++){
        p=getJch(JCB);
        printf("作业%d: \n",i+1);
        printf("作业名称: ");
        scanf("%s", p->name);
        printf("到达时间: ");
        scanf("%d", &p->arriveTime);
        printf("所需运行时间: ");
        scanf("%d", &p->needTime);
        printf("所需内存大小: ");
        scanf("%d", &p->memory);
        printf("所需磁带机数量: ");
        scanf("%d", &p->disk);
        insert();
    }
    for(p=ready;p!=NULL;p=p->next){ //初始化作业属性的值
        p->state='W';
        p->beginTime=p->runTime=p->finishTime=0;
    }
}