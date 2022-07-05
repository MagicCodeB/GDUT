#include "stdio.h"
#include <stdlib.h>
#define getpch(type) (type*)malloc(sizeof(type))

int timeslice=0;
int nowtime=0;

struct pcb { /* ������̿��ƿ�PCB */
    char name[10];
    char state;
    int super;
    int ntime;
    int rtime;
    struct pcb* link;
}*ready=NULL,*p;

typedef struct pcb PCB;

void sort() /* �����Խ��̽������ȼ����к���*/
{
    PCB *first, *second;
    if((ready==NULL))
    {
        p->link=ready;
        ready=p;
    }
    else /* ���̱Ƚ����ȼ�,�����ʵ���λ����*/
    {
        first=ready;
        second=first->link;
        while(second!=NULL)
        {
            first=first->link;
            second=second->link;
        }
        first->link=p;
    }
}
void input() /* �������̿��ƿ麯��*/
{
    printf("������תʱ��Ƭ����:");
    scanf("%d",&timeslice);
    int i,num;
    printf("�����������:");
    scanf("%d",&num);
    for(i=0;i<num;i++)
    {
        printf("\n���̺�No.%d:\n",i+1);
        p=getpch(PCB);
        printf("���������:");
        scanf("%s",p->name);
        printf("�����������ʱ��:");
        scanf("%d",&p->ntime);
        p->rtime=0;p->state='w';
        p->link=NULL;
        sort(); /* ����sort����*/
    }
}
int space()
{
    int l=0; PCB* pr=ready;
    while(pr!=NULL)
    {
        l++;
        pr=pr->link;
    }
    return(l);
}
void disp(PCB * pr) /*����������ʾ����,������ʾ��ǰ����*/
{
    printf("\n ������  ״̬     ����ʱ��  ����ʱ��\n");
    printf("|%s\t",pr->name);
    printf("|%c\t",pr->state);
    printf("  |%d\t",pr->ntime);
    printf("   |%d\t",pr->rtime);
    printf("\n");
}
void check() /* �������̲鿴���� */
{
    PCB* pr;
    printf("****��ǰ�������еĽ�����:%s",p->name); /*��ʾ��ǰ���н���*/
    disp(p);
    pr=ready;
    printf("****��ǰ��������״̬Ϊ:\n"); /*��ʾ��������״̬*/
    while(pr!=NULL)
    {
        disp(pr);
        pr=pr->link;
    }
}
void destroy() /*�������̳�������(�������н���,��������)*/
{
    printf("����[%s]�����.\n",p->name);
    free(p);
}
void running() /* �������̾�������(��������ʱ�䵽,�þ���״̬*/
{
    int pretime;
    pretime=p->ntime-p->rtime;
    (p->rtime)+=timeslice;
    if(p->rtime>=p->ntime)
    {
        nowtime+=pretime;
        destroy(); /* ����destroy����*/
    }
    else
    {
        nowtime+=timeslice;
        (p->super)--;
        p->state='w';
        sort(); /*����sort����*/
    }
}
int main() /*������*/
{
    int len,h=0;
    input();
    len=space();
    while((len!=0)&&(ready!=NULL))
    {
        h++;
        printf("CPU���е�%d��\n",h);
        p=ready;
        ready=p->link;
        p->link=NULL;
        p->state='R';
        check();
        running();
        printf("��ǰʱ����:%d\n",nowtime);
    }
    printf("\n�����Ѿ����.\n");
    system("PAUSE");
}