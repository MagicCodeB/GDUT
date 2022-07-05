#include "stdio.h"
#include <stdlib.h>

#define getPch(type) (type*)malloc(sizeof(type))

struct workTime{
    float beginTime;//��ҵ����ʱ��
    float finishTime;//��ҵ���ʱ��
    float roundTime;//��תʱ��
    float wRoundTime;//��Ȩ��תʱ��
};

struct jcb {/*������ҵ���ƿ�JCB */
    char name[10];//��ҵ��
    float subTime;//��ҵ�ύʱ��
    float runtime;//��ҵ���������ʱ��
    float Rp;//����ҵ��Ӧ��
    struct workTime wT;//ʱ��ṹ��
    struct jcb* link;//��ָ��
}*ready=NULL,*j;

typedef struct jcb JCB;

float totalTime=0;

void sort();
void SJF();
void HRN();
void input();
void display(JCB* jr,int select);
void destroy();
void check(int select);
void running(JCB* jr);
int space();

int main() /*������*/
{
    int select=0,len,h=0;
    float sumTi=0,sumWi=0;
    input();
    len=space();
    printf("\n1.FCFS 2.SJF 3.HRN\n��ѡ����ҵ�����㷨:");
    scanf("%d",&select);
    while((len!=0)&&(ready!=NULL)){
        h++;
        printf("����ִ�е�%d����ҵ \n",h);
        j=ready;
        ready=j->link;
        j->link=NULL;
        running(j);
        sumTi+=j->wT.roundTime;
        sumWi+=j->wT.wRoundTime;
        check(select);
        if (select==2&&h<len-1) SJF();
        if (select==3&&h<len-1) HRN();
    }
    printf("\nȫ����ҵ�Ѿ����.\n");
    printf("\t������ҵ��ƽ����תʱ�䣺%.2f\n",sumTi/h);
    printf("\t������ҵ�Ĵ�Ȩƽ����תʱ�䣺%.2f\n",sumWi/h);
    system("PAUSE");
    return 0;
}

void sort() /* ��������ҵ�����ύʱ�����к���*/
{
    JCB *first, *second;
    int insert=0;
    if((ready==NULL)||((j->subTime)<(ready->subTime))){/*��ҵ�ύʱ����̵�,�������(�������״̬����ҵΪ�ջ���)*/
        j->link=ready;
        ready=j;
        totalTime=j->subTime;
        j->Rp=1;
    }
    else /* ��ҵ�Ƚ��ύʱ��,�����ʵ���λ����*/
    {
        first=ready;
        second=first->link;
        while(second!=NULL){
            if((j->subTime)<(second->subTime)){ /*��������ҵ�ȵ�ǰ��ҵ�ύʱ���,*/
             /*���뵽��ǰ��ҵǰ��*/
                j->link=second;
                first->link=j;
                second=NULL;
                insert=1;
            }
            else{ /* ������ҵ���������,����뵽��β*/
                first=first->link;
                second=second->link;
            }
        }
        if (insert==0) first->link=j;
    }
}

void SJF()/* ��ȡ�����е������ҵ */
{
    JCB *front,*minTime,*rear;
    int flag=0;
    minTime=ready;
    rear=minTime->link;
    if ((rear!=NULL)&&(totalTime>=rear->subTime)&&(minTime->runtime)>(rear->runtime)){//Ѱ�������ҵ
        front=minTime;
        minTime=rear;
        rear=rear->link;
        flag=1;
    }
    else{
        rear=rear->link;
    }
    if (flag==1){
        front->link=minTime->link;
        minTime->link=ready;
    }
    ready=minTime;
}

void HRN()/* ��ȡ�����е������Ӧ��ҵ */
{
    JCB *front,*minRp,*rear;
    int flag=0;
    minRp=ready;
    rear=minRp->link;
    if ((rear!=NULL)&&(totalTime>=rear->subTime)&&(minRp->Rp)<(rear->Rp)){//Ѱ�������Ӧ����ҵ
        front=minRp;
        minRp=rear;
        rear=rear->link;
        flag=1;
    }
    else{
        rear=rear->link;
    }
    if (flag==1){
        front->link=minRp->link;
        minRp->link=ready;
    }
    ready=minRp;
}

void input() /* ������ҵ���ƿ麯��*/
{
    int i,num;
    printf("��������ҵ��:");
    scanf("%d",&num);
    for(i=0;i<num;i++){
        printf("��ҵ��No.%d:\n",i+1);
        j=getPch(JCB);
        printf("������ҵ��:");
        scanf("%s",j->name);
        printf("������ҵ�ύʱ��:");
        scanf("%f",&j->subTime);
        printf("������ҵ����ʱ��:");
        scanf("%f",&j->runtime);
        printf("\n");
        j->link=NULL;
        sort(); /* ����sort����*/
    }
}

int space()
{
    int l=0; JCB* jr=ready;
    while(jr!=NULL){
        l++;
        jr=jr->link;
    }
    return(l);
}

void display(JCB* jr,int select) /*������ҵ��ʾ����,������ʾ��ǰ��ҵ*/
{
    if (select==3) printf("\n��ҵ   ����ʱ��   ��Ӧ��   ����ʱ��   ���ʱ��   ��תʱ��   ��Ȩ��תʱ�� \n");
    else printf("\n��ҵ   ����ʱ��   ����ʱ��   ���ʱ��   ��תʱ��   ��Ȩ��תʱ�� \n");
    printf("  %s\t",jr->name);
    printf("  %.2f\t ",jr->runtime);
    if (select==3) printf("  %.2f    ",jr->Rp);
    if (j==jr){
        printf("  %.2f\t",jr->wT.beginTime);
        printf("%.2f   ",jr->wT.finishTime);
        printf("  %.2f \t",jr->wT.roundTime);
        printf("   %.2f",jr->wT.wRoundTime);
    }
    printf("\n");
}

void destroy() /*������ҵ��������(��ҵ���н���,������ҵ)*/
{
    printf("\n\n��ҵ[%s]�����.\n",j->name);
    free(j);
}

void check(int select) /* ������ҵ�鿴���� */
{
    JCB* jr;
    printf("\n ****��ǰ�������е���ҵ��:%s",j->name); /*��ʾ��ǰ������ҵ*/
    display(j,select);
    jr=ready;
    printf("\n ****��ǰ��������״̬Ϊ:\n"); /*��ʾ��������״̬*/
    while(jr!=NULL){
        jr->Rp=(totalTime-jr->subTime)/jr->runtime;
        display(jr,select);
        jr=jr->link;
    }
    destroy();
}

void running(JCB* jr) /* ������ҵ��������(��ҵ����ʱ�䵽,�þ���״̬*/
{
    if (totalTime>=jr->subTime){
        jr->wT.beginTime=totalTime;
    }
    else {
        jr->wT.beginTime=jr->subTime;
    }
    jr->wT.finishTime=jr->wT.beginTime+jr->runtime;
    jr->wT.roundTime=jr->wT.finishTime-jr->subTime;
    jr->wT.wRoundTime=jr->wT.roundTime/jr->runtime;
    totalTime=jr->wT.finishTime;
}
