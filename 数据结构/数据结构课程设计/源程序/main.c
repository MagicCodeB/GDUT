#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include<Windows.h>

#define OK 1

typedef int Status;//����StatusΪ����

typedef struct CustomNode//����ͻ����ṹ��
{
    int process_time;//����ͻ�ʱ�����
    int money;//����ͻ����׽���������Ϊ���/�����Ϊȡ��/��
    int No;//����ͻ����
}ElemType;

typedef struct event
{
    int event_type;//�¼����ͣ�1Ϊ���0Ϊ�뿪
    int time;//�¼�����ʱ��
    int No;//�¼������Ŀͻ����
    int event_index;//�¼��������ͣ�1Ϊ���/���0Ϊȡ��/���
    int custom_money;//�ͻ��ڸ��¼��еĽ��׽��
}event;

typedef struct//�����¼�����
{
    event data;
    struct LNode *next;
}LNode, *Link;

typedef struct//�����¼���Ϊ��������ݽṹ
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
    printf("\nʱ���һ����\n");
    printf("------------------------------------------------------------------------------------");
    printf("\n|  �ͻ���ţ�  |  �¼����ͣ�  |  �¼�����ʱ�䣺   |  �¼�����  |  �¼������  |");
    printf("\n------------------------------------------------------------------------------------");
    while (p!=NULL)
    {
        printf("\n|     %d       |",p->data.No);
        if (p->data.event_type==1)
        {
            printf("      ����     |       %d         |",p->data.time);
            if(p->data.event_index==1)printf("     ���/����   |     %d     |",p->data.custom_money);
            else printf("     ȡ��/���   |     %d     |",p->data.custom_money);
            printf("\n------------------------------------------------------------------------------------");
        }
        else
        {
            if (p->data.event_type==0)
            {
                printf("      �뿪     |       %d         |",p->data.time);
                if(p->data.event_index==1)printf("     ���/����   |     %d     |",p->data.custom_money);
                else printf("     ȡ��/���   |     %d     |",p->data.custom_money);
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

int total;//�������
int max_money;//����׽��
LQueue *process_Custom=NULL;//��һ��Ϊ�ͻ��������
LQueue *wait_queue=NULL;//�ڶ���Ϊ�ͻ��ȴ�����
LinkList event_link=NULL;//һ���¼�������������뿪��
int nextTime=0;//����Ϊ��һ���¼��ķ����¼�
int NextSolveTime=0;//����Ϊ��һ���¼��Ĵ���ʱ��
int CustomNumber=1;//�ͻ��ķ������
ElemType *leave_Custom=NULL;//׼���뿪�Ŀͻ�����
ElemType *waitProcess_Custom=NULL;//������Ŀͻ�����

ElemType* myMalloc(int MaxTradeTime,int MinTradeTime)
{
    ElemType *e;
    e=(ElemType*)malloc(sizeof(ElemType));
    if(e==NULL)return NULL;
    e->process_time=(rand()%(MaxTradeTime-MinTradeTime)+MinTradeTime);//�����û��¼��¼�����С����ʱ��������ʱ��֮��������
    e->money=(rand()%(2*max_money)-max_money);//�û����׽��������
    e->No=CustomNumber;//�û����
    CustomNumber++;
    return e;
}

ElemType* arrival_event(int i,int MaxTimeGap,int MinTimeGap,int MaxTradeTime,int MinTradeTime)
{
    if (nextTime==i)//�����ǰʱ������´οͻ�����ʱ��
    {
        printf("***************************************************************************\n");
        printf("��ǰʱ����:%d\n",i);
        nextTime=nextTime+(rand()%(MaxTimeGap-MinTimeGap)+MinTimeGap);//�¸��û�����ʱ��Ϊ��ǰʱ�����ʱ������Χ�������
        ElemType *p=NULL;
        p=myMalloc(MaxTradeTime,MinTradeTime);
        event *e=(event*)malloc(sizeof(event));
        e->event_type=1;
        e->No=p->No;
        e->time=i;
        e->custom_money=p->money;
        if(p->money<0)e->event_index=0;//���������׽��Ϊ��������Ϊȡ��/���
        else e->event_index=1;//��֮����Ϊ���/����
        InsertLink(event_link,*e);//�������¼����뵽�¼����β��
        if(NextSolveTime<i)
        {
            if(-(p->money)<=total)//���¼�Ϊ���/��ȡ��/�����С���������
            {
                NextSolveTime=p->process_time+i;//��һ�¼��Ĵ���ʱ��Ϊ���û�����ʱ��������+��ǰʱ��
                total=total+p->money;
                EnQueue(process_Custom,*p);//��p���
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
        printf("�ͻ���ţ�%d �ͻ�������Ҫʱ�䣺%d  �ͻ���Ҫ�����Ǯ��%d  ������%d\n", p->No, p->process_time, p->money, total);
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
    if (NextSolveTime==i)//��ǰʱ����ڽ�����ɵ�ʱ��
    {
        DeQueue(process_Custom,leave_Custom);//���ÿͻ��Ƴ��������
        int last_money=total-leave_Custom->money;//last_moneyΪ�û��Ƴ�����������
        leave_event(leave_Custom,i);//���Ƴ��Ŀͻ���ʱ����Ϣ�Ž��¼���
        if (((leave_Custom->money)>0)&&wait_queue->front!=NULL)//׼���뿪�û��Ǵ�Ǯ��
        {
            int index=0;
            LQueue *e=InitQueue();
            int TempMoney=total;
            while(TempMoney>last_money&&wait_queue->front!=NULL)
            {
                DeQueue(wait_queue, waitProcess_Custom);//���Խ�׼��������û��Ƴ��ȴ�����
                if(-(waitProcess_Custom->money)<=TempMoney)
                {
                    EnQueue(e,*waitProcess_Custom);//��׼��������û������e
                    TempMoney=TempMoney+waitProcess_Custom->money;//������ʱ���������
                }
                else EnQueue(wait_queue,*waitProcess_Custom);//���ʧ�ܾͽ����û���������ȴ����е�β��
                index++;
                if(index>=wait_queue->length)break;
            }
            InsertQueue(process_Custom,e);//������e˳����ڴ�����е�β��
            if(process_Custom->front!=NULL)
            {
                while(process_Custom->front!=NULL&&-(process_Custom->front->data.money)>total)//�޷�����
                {
                    DeQueue(process_Custom,leave_Custom);//�Ӵ�������Ƴ�
                    EnQueue(wait_queue,*leave_Custom);//����ȴ�����
                }
                if(process_Custom->front!=NULL)
                {
                    NextSolveTime=process_Custom->front->data.process_time+NextSolveTime;//�����¸��û�����ʱ��
                    total=total+process_Custom->front->data.money;//�����������
                }
            }
        }
        else//Ϊȡ��/������ͣ�����ͬ��
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
    double sum=0,a,b;//sumΪ�ܵȴ�ʱ�䣬aΪ����ʱ�䣬bΪ�뿪ʱ��
    int total_Custom=0;//�ܵ�������
    int index_success=0,index_deposit=0,index_withdrawal=0,deposit_amount=0,withdrawal_amount=0;//����index����Ϊ��ǣ�Ϊ����ʧ������
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
    printf("*           ʱ�����Ϣ��                    *\n");
    printf("*********************************************\n");
    printf("*        ȫ���û���: %d ��                  *\n",total_Custom);
    printf("*********************************************\n");
    printf("*        �ܹ�����ʱ��: %f ����     *\n",sum);
    printf("*********************************************\n");
    printf("*        �ɹ�����: %d ��                    *\n",total_Custom-index_success);
    printf("*********************************************\n");
    printf("*        ȡ��/���ɹ�����: %d ��           *\n",withdrawal_amount-index_withdrawal);
    printf("*********************************************\n");
    printf("*        ���/����ɹ�����: %d ��           *\n",deposit_amount-index_deposit);
    printf("*********************************************\n");
    printf("*        �ͻ�ƽ������ʱ�䣺 %f ����  *\n",sum/total_Custom);
    printf("*********************************************\n");
}

void print()
{
    printf("****************************************************************\n");
    printf("*                      ��ӭ��������ģ��ϵͳ                    *\n");
    printf("****************************************************************\n");
    printf("*                       1.����ģ��                             *\n");
    printf("*                       2.�˳�����                             *\n");
    printf("****************************************************************\n");
    printf("*      3119005028       19��������̣�1����         κҫ��     *\n");
    printf("****************************************************************\n");
    printf("                        ������ѡ�");
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
                    srand((unsigned int)time(NULL));//������������ʱ��仯,ȷ�����������һ��
                    int Runtime,MaxTimeGap,MinTimeGap, MaxTradeTime,MinTradeTime,i;
                    printf("���������е���Ӫʱ�䣨���ӣ���");
                    scanf("%d", &Runtime);
                    while(Runtime<=0)
                    {
                        printf("��Ӫʱ��������0\n");
                        printf("���������е���Ӫʱ�䣨���ӣ���");
                        scanf("%d", &Runtime);
                    }
                    printf("���������е���Ӫ��Ԫ����");
                    scanf("%d", &total);
                    while(total<=0)
                    {
                        printf("��ʼ��Ӫ���������0\n");
                        printf("���������е���Ӫ��Ԫ����");
                        scanf("%d", &total);
                    }
                    printf("������ͻ�����׽�Ԫ����");
                    scanf("%d", &max_money);
                    while(max_money>total||max_money<=0)
                    {
                        printf("�ͻ�����׽�����С�����г�ʼ��Ӫ����Ҵ���0\n");
                        printf("������ͻ�����׽�Ԫ����");
                        scanf("%d", &max_money);
                    }
                    printf("������ͻ���󵽴�ʱ���������ӣ���");
                    scanf("%d", &MaxTimeGap);
                    while(MaxTimeGap<=0||MaxTimeGap>Runtime)
                    {
                        printf("�ͻ���󵽴�ʱ�����������0��С����Ӫʱ��\n");
                        printf("������ͻ���󵽴�ʱ���������ӣ���");
                        scanf("%d", &MaxTimeGap);
                    }
                    printf("������ͻ���Сʱ���������ӣ���");
                    scanf("%d", &MinTimeGap);
                    while(MinTimeGap<=0||MinTimeGap>MaxTimeGap||MinTimeGap>Runtime)
                    {
                        printf("�ͻ���С����ʱ�����������0��С����󵽴�ʱ������С����Ӫʱ��\n");
                        printf("������ͻ���Сʱ���������ӣ���");
                        scanf("%d", &MinTimeGap);
                    }
                    printf("������ͻ������ʱ�䣨���ӣ���");
                    scanf("%d", &MaxTradeTime);
                    while(MaxTradeTime<=0||MaxTradeTime>Runtime)
                    {
                        printf("�ͻ������ʱ��������0��С����Ӫʱ��\n");
                        printf("������ͻ������ʱ�䣨���ӣ���");
                        scanf("%d", &MaxTradeTime);
                    }
                    printf("������ͻ���С����ʱ�䣨���ӣ���");
                    scanf("%d", &MinTradeTime);
                    while(MinTradeTime<=0||MinTradeTime>MaxTradeTime||MinTradeTime>Runtime)
                    {
                        printf("�ͻ���С����ʱ��������0��С�������ʱ����С����Ӫʱ��\n");
                        printf("������ͻ���С����ʱ�䣨���ӣ���");
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
