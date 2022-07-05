#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include<Windows.h>

#define OK 1

typedef int Status;//定义Status为整形

typedef struct CustomNode//定义客户结点结构体
{
    int process_time;//处理客户时间变量
    int money;//处理客户交易金额变量（正为存款/还款，负为取款/借款）
    int No;//定义客户序号
}ElemType;

typedef struct event
{
    int event_type;//事件类型，1为到达，0为离开
    int time;//事件发生时间
    int No;//事件触发的客户序号
    int event_index;//事件操作类型，1为存款/还款，0为取款/借款
    int custom_money;//客户在该事件中的交易金额
}event;

typedef struct//定义事件表结点
{
    event data;
    struct LNode *next;
}LNode, *Link;

typedef struct//定义事件表为链表的数据结构
{
    Link head, tail;
    int length;
}*LinkList;

LinkList InitLink()
{
    LinkList L=(LinkList*)malloc(sizeof(LNode));
    if (L==NULL)return NULL;
    L->head=NULL;
    L->tail=NULL;
    L->length=0;
    return L;
}

Status ClearLink(LinkList L)
{
    if(L==NULL)return ERROR;
    Link p=L->head;
    Link k=L->head->next;
    while (p!=L->tail)
    {
        free(p);
        p=k;
        if(k!=L->tail)k=k->next;
    }
    free(p);
    L->head=NULL;
    L->tail=NULL;
    L->length=0;
    return OK;
}

Status DestroyLink(LinkList L)
{
    if(L==NULL)return ERROR;
    ClearLink(L);
    free(L);
    return OK;
}

Status InsertLink(LinkList L, event e)
{
    if(L==NULL)return ERROR;
    Link p=(Link)malloc(sizeof(LNode));
    if(p==NULL)return ERROR;
    p->data=e;
    p->next=NULL;
    if (L->head==NULL)
    {
        L->head=p;
        L->tail=p;
        L->length=1;
    }
    else
    {
        L->tail->next=p;
        L->tail=p;
        L->length++;
    }
    return OK;
}

Status LinkTraverse(LinkList L)
{
    if (L==NULL)  return ERROR;
    Link p=L->head;
    printf("\n时间表一览：\n");
    printf("------------------------------------------------------------------------------------");
    printf("\n|  客户序号：  |  事件类型：  |  事件触发时间：   |  事件任务：  |  事件处理金额：  |");
    printf("\n------------------------------------------------------------------------------------");
    while (p!=NULL)
    {
        printf("\n|     %d       |",p->data.No);
        if (p->data.event_type==1)
        {
            printf("      到达     |       %d         |",p->data.time);
            if(p->data.event_index==1)printf("     存款/还款   |     %d     |",p->data.custom_money);
            else printf("     取款/借款   |     %d     |",p->data.custom_money);
            printf("\n------------------------------------------------------------------------------------");
        }
        else
        {
            if (p->data.event_type==0)
            {
                printf("      离开     |       %d         |",p->data.time);
                if(p->data.event_index==1)printf("     存款/还款   |     %d     |",p->data.custom_money);
                else printf("     取款/借款   |     %d     |",p->data.custom_money);
                printf("\n------------------------------------------------------------------------------------");
            }
        }
        p=p->next;
    }
    printf("\n");
    return OK;
}

typedef struct LQNode
{
    ElemType data;
    struct LQNode *next;
}LQNode, *QueuePtr;


typedef struct
{
    QueuePtr front;
    QueuePtr rear;
    int length;
}LQueue;

LQueue* InitQueue()
{
    LQueue *Q=(LQueue *)malloc(sizeof(LQueue));
    if(Q==NULL)return ERROR;
    Q->front=NULL;
    Q->rear=NULL;
    Q->length=0;
    return Q;
}

Status EnQueue(LQueue *Q, ElemType e)
{
    LQNode *p;
    p=(LQNode*)malloc(sizeof(LQNode));
    if(p==NULL)return ERROR;
    p->data=e;
    p->next=NULL;
    if(NULL==Q->front)
    {
        Q->front=p;
        Q->rear=p;
        Q->length=1;
    }
    else
    {
        Q->rear->next=p;
        Q->rear=p;
        Q->length++;
    }
    return OK;
}

Status DeQueue(LQueue *Q, ElemType *e)
{
    LQNode *p;
    if(NULL==Q->front)return ERROR;
    p=Q->front;
    *e=p->data;
    Q->front=p->next;
    if (Q->rear==p)Q->rear=NULL;
    free(p);
    Q->length--;
    return OK;
}

Status myFree(ElemType *e)
{
    if(e==NULL)return ERROR;
    free(e);
    return OK;
}

Status DestroyQueue(LQueue *Q)
{
    if(Q==NULL)return ERROR;
    QueuePtr p=NULL,q=NULL;
    p=Q->front;
    while(p!=Q->rear)
    {
        q=p->next;
        myFree(p);
        p=q;
    }
    free(Q->rear);
    return OK;
}

Status InsertQueue(LQueue *Q,LQueue *E)
{
    if(E==NULL||E->front==NULL)return ERROR;
    if(Q==NULL||Q->front==NULL||Q->rear==NULL)
    {
        Q->front=E->front;
        Q->rear=E->rear;
    }
    else
    {
        E->rear->next=Q->front;
        Q->front=E->front;
    }
    return OK;
}

int total;//银行余额
int max_money;//最大交易金额
LQueue *process_Custom=NULL;//第一个为客户处理队列
LQueue *wait_queue=NULL;//第二个为客户等待队列
LinkList event_link=NULL;//一个事件表（包含到达和离开）
int nextTime=0;//定义为下一个事件的发生事件
int NextSolveTime=0;//定义为下一个事件的处理时间
int CustomNumber=1;//客户的服务序号
ElemType *leave_Custom=NULL;//准备离开的客户变量
ElemType *waitProcess_Custom=NULL;//待处理的客户变量

ElemType* myMalloc(int MaxTradeTime,int MinTradeTime)
{
    ElemType *e;
    e=(ElemType*)malloc(sizeof(ElemType));
    if(e==NULL)return NULL;
    e->process_time=(rand()%(MaxTradeTime-MinTradeTime)+MinTradeTime);//处理用户事件事件在最小交易时间和最大交易时间之间的随机数
    e->money=(rand()%(2*max_money)-max_money);//用户交易金额的随机数
    e->No=CustomNumber;//用户序号
    CustomNumber++;
    return e;
}

ElemType* arrival_event(int i,int MaxTimeGap,int MinTimeGap,int MaxTradeTime,int MinTradeTime)
{
    if (nextTime==i)//如果当前时间等于下次客户到达时间
    {
        printf("***************************************************************************\n");
        printf("当前时间是:%d\n",i);
        nextTime=nextTime+(rand()%(MaxTimeGap-MinTimeGap)+MinTimeGap);//下个用户到达时间为当前时间加上时间间隔范围的随机数
        ElemType *p=NULL;
        p=myMalloc(MaxTradeTime,MinTradeTime);
        event *e=(event*)malloc(sizeof(event));
        e->event_type=1;
        e->No=p->No;
        e->time=i;
        e->custom_money=p->money;
        if(p->money<0)e->event_index=0;//如果随机交易金额为负，则定义为取款/借款
        else e->event_index=1;//反之则定义为存款/还款
        InsertLink(event_link,*e);//将到达事件插入到事件表的尾部
        if(NextSolveTime<i)
        {
            if(-(p->money)<=total)//当事件为存款/（取款/借款）金额小于银行余额
            {
                NextSolveTime=p->process_time+i;//下一事件的处理时间为该用户交易时间的随机数+当前时间
                total=total+p->money;
                EnQueue(process_Custom,*p);//将p入队
            }
            else EnQueue(wait_queue,*p);
        }
        else
        {
            if(NextSolveTime==0)
            {
                if (-(p->money)<=total)
                {
                    NextSolveTime=p->process_time+i;
                    total=total+p->money;
                    EnQueue(process_Custom,*p);
                }
                else EnQueue(wait_queue,*p);
            }
            else EnQueue(process_Custom,*p);
        }
        printf("客户序号：%d 客户交易需要时间：%d  客户需要处理的钱：%d  银行余额：%d\n", p->No, p->process_time, p->money, total);
        return p;
    }
}

Status leave_event(ElemType *e ,int i)
{
    event *p =(event*)malloc(sizeof(event));
    p->event_type=0;
    p->No=e->No;
    p->time=i;
    p->custom_money=e->money;
    if(e->money<0)p->event_index=0;
    else p->event_index=1;
    InsertLink(event_link,*p);
    return OK;
}

Status process_event(int i)
{
    if (NextSolveTime==i)//当前时间等于交易完成的时间
    {
        DeQueue(process_Custom,leave_Custom);//将该客户移出处理队列
        int last_money=total-leave_Custom->money;//last_money为用户移出后的银行余额
        leave_event(leave_Custom,i);//将移出的客户和时间信息放进事件表
        if (((leave_Custom->money)>0)&&wait_queue->front!=NULL)//准备离开用户是存钱的
        {
            int index=0;
            LQueue *e=InitQueue();
            int TempMoney=total;
            while(TempMoney>last_money&&wait_queue->front!=NULL)
            {
                DeQueue(wait_queue, waitProcess_Custom);//尝试将准备解决的用户移出等待队列
                if(-(waitProcess_Custom->money)<=TempMoney)
                {
                    EnQueue(e,*waitProcess_Custom);//将准备解决的用户入队列e
                    TempMoney=TempMoney+waitProcess_Custom->money;//计算暂时的银行余额
                }
                else EnQueue(wait_queue,*waitProcess_Custom);//如果失败就将该用户重新移入等待队列的尾部
                index++;
                if(index>=wait_queue->length)break;
            }
            InsertQueue(process_Custom,e);//将队列e顺序接在处理队列的尾部
            if(process_Custom->front!=NULL)
            {
                while(process_Custom->front!=NULL&&-(process_Custom->front->data.money)>total)//无法处理
                {
                    DeQueue(process_Custom,leave_Custom);//从处理队列移出
                    EnQueue(wait_queue,*leave_Custom);//加入等待队列
                }
                if(process_Custom->front!=NULL)
                {
                    NextSolveTime=process_Custom->front->data.process_time+NextSolveTime;//更新下个用户处理时间
                    total=total+process_Custom->front->data.money;//更新银行余额
                }
            }
        }
        else//为取款/借款类型，其余同上
        {
            if (process_Custom->front!=NULL)
            {
                while (process_Custom->front!=NULL&&-(process_Custom->front->data.money)>total)
                {
                    DeQueue(process_Custom, leave_Custom);
                    EnQueue(wait_queue, *leave_Custom);
                }
                if (process_Custom->front!=NULL)
                {
                    NextSolveTime = process_Custom->front->data.process_time+NextSolveTime;
                    total = total + process_Custom->front->data.money;
                }
            }
        }
    }
}

void average_StayTime(LinkList e,double final)
{
    double sum=0,a,b;//sum为总等待时间，a为到达时间，b为离开时间
    int total_Custom=0;//总到达人数
    int index_success=0,index_deposit=0,index_withdrawal=0,deposit_amount=0,withdrawal_amount=0;//设置index来作为标记，为交易失败人数
    LNode *p=e->head;
    for(int i=1;i<=e->length;i++)
    {
        while(p!=NULL)
        {
            if(p->data.No==i)
            {
                if(p->data.event_type==1)
                {
                    a=p->data.time;
                    index_success+=1;
                    total_Custom=total_Custom+1;
                    if(p->data.event_index==1)
                    {
                        deposit_amount+=1;
                        index_deposit+=1;
                    }
                    if(p->data.event_index==0)
                    {
                        withdrawal_amount+=1;
                        index_withdrawal+=1;
                    }
                }
                if (p->data.event_type==0)
                {
                    b = p->data.time;
                    index_success-=1;
                    if(p->data.event_index==1)index_deposit-=1;
                    if(p->data.event_index==0)index_withdrawal-=1;
                }
            }
            p=p->next;
        }
        p=e->head;
        if(b==-1.0)b=final;
        sum=sum+b-a;
        b=-1.0;
    }
    printf("\n\n");
    printf("*********************************************\n");
    printf("*           时间表信息：                    *\n");
    printf("*********************************************\n");
    printf("*        全部用户数: %d 人                  *\n",total_Custom);
    printf("*********************************************\n");
    printf("*        总共消耗时间: %f 分钟     *\n",sum);
    printf("*********************************************\n");
    printf("*        成功人数: %d 人                    *\n",total_Custom-index_success);
    printf("*********************************************\n");
    printf("*        取款/借款成功人数: %d 人           *\n",withdrawal_amount-index_withdrawal);
    printf("*********************************************\n");
    printf("*        存款/还款成功人数: %d 人           *\n",deposit_amount-index_deposit);
    printf("*********************************************\n");
    printf("*        客户平均逗留时间： %f 分钟  *\n",sum/total_Custom);
    printf("*********************************************\n");
}

void print()
{
    printf("****************************************************************\n");
    printf("*                      欢迎进入银行模拟系统                    *\n");
    printf("****************************************************************\n");
    printf("*                       1.进行模拟                             *\n");
    printf("*                       2.退出程序                             *\n");
    printf("****************************************************************\n");
    printf("*      3119005028       19级软件工程（1）班         魏耀辉     *\n");
    printf("****************************************************************\n");
    printf("                        请输入选项：");
}

void initial()
{
    process_Custom=NULL;
    wait_queue=NULL;
    event_link=NULL;
    nextTime=0;
    NextSolveTime=0;
    CustomNumber=1;
    leave_Custom=NULL;
    waitProcess_Custom=NULL;
}
int main(void)
{
    int choice;
    while(1)
    {
        system("CLS");
        print();
        scanf("%d",&choice);
        if(choice>=1&&choice<=2)
        {
            switch (choice)
            {
                case 1:
                {
                    leave_Custom=(ElemType*)malloc(sizeof(ElemType));
                    waitProcess_Custom=(ElemType*)malloc(sizeof(ElemType));
                    process_Custom=InitQueue();
                    wait_queue=InitQueue();
                    event_link=InitLink();
                    srand((unsigned int)time(NULL));//随机函数随电脑时间变化,确保不会随机数一样
                    int Runtime,MaxTimeGap,MinTimeGap, MaxTradeTime,MinTradeTime,i;
                    printf("请输入银行的运营时间（分钟）：");
                    scanf("%d", &Runtime);
                    while(Runtime<=0)
                    {
                        printf("运营时间必须大于0\n");
                        printf("请输入银行的运营时间（分钟）：");
                        scanf("%d", &Runtime);
                    }
                    printf("请输入银行的运营金额（元）：");
                    scanf("%d", &total);
                    while(total<=0)
                    {
                        printf("初始运营金额必须大于0\n");
                        printf("请输入银行的运营金额（元）：");
                        scanf("%d", &total);
                    }
                    printf("请输入客户最大交易金额（元）：");
                    scanf("%d", &max_money);
                    while(max_money>total||max_money<=0)
                    {
                        printf("客户最大交易金额必须小于银行初始运营金额且大于0\n");
                        printf("请输入客户最大交易金额（元）：");
                        scanf("%d", &max_money);
                    }
                    printf("请输入客户最大到达时间间隔（分钟）：");
                    scanf("%d", &MaxTimeGap);
                    while(MaxTimeGap<=0||MaxTimeGap>Runtime)
                    {
                        printf("客户最大到达时间间隔必须大于0且小于运营时间\n");
                        printf("请输入客户最大到达时间间隔（分钟）：");
                        scanf("%d", &MaxTimeGap);
                    }
                    printf("请输入客户最小时间间隔（分钟）：");
                    scanf("%d", &MinTimeGap);
                    while(MinTimeGap<=0||MinTimeGap>MaxTimeGap||MinTimeGap>Runtime)
                    {
                        printf("客户最小到达时间间隔必须大于0且小于最大到达时间间隔且小于运营时间\n");
                        printf("请输入客户最小时间间隔（分钟）：");
                        scanf("%d", &MinTimeGap);
                    }
                    printf("请输入客户最大交易时间（分钟）：");
                    scanf("%d", &MaxTradeTime);
                    while(MaxTradeTime<=0||MaxTradeTime>Runtime)
                    {
                        printf("客户最大交易时间必须大于0且小于运营时间\n");
                        printf("请输入客户最大交易时间（分钟）：");
                        scanf("%d", &MaxTradeTime);
                    }
                    printf("请输入客户最小交易时间（分钟）：");
                    scanf("%d", &MinTradeTime);
                    while(MinTradeTime<=0||MinTradeTime>MaxTradeTime||MinTradeTime>Runtime)
                    {
                        printf("客户最小交易时间必须大于0且小于最大交易时间且小于运营时间\n");
                        printf("请输入客户最小交易时间（分钟）：");
                        scanf("%d", &MinTradeTime);
                    }
                    for(i=0;i<Runtime;i++)
                    {
                        arrival_event(i,MaxTimeGap,MinTimeGap,MaxTradeTime,MinTradeTime);
                        process_event(i);
                    }
                    printf("\n");
                    average_StayTime(event_link,Runtime-1);
                    while(process_Custom->front!=NULL)
                    {
                        DeQueue(process_Custom,leave_Custom);
                        leave_event(leave_Custom,i);
                    }
                    while(wait_queue->front!=NULL)
                    {
                        DeQueue(wait_queue,leave_Custom);
                        leave_event(leave_Custom,i);
                    }
                    LinkTraverse(event_link);
                    DestroyQueue(process_Custom);
                    DestroyQueue(wait_queue);
                    DestroyLink(event_link);
                    system("pause");
                    break;
                }
                case 2:
                {
                    printf("ByeBye~\n");
                    system("PAUSE");
                    goto end;
                }
            }
        }
        initial();
    }
    end:
    return 0;
}
