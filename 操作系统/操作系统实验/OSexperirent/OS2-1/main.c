#include "stdio.h"
#include <stdlib.h>

#define getPch(type) (type*)malloc(sizeof(type))

struct workTime{
    float beginTime;//作业运行时刻
    float finishTime;//作业完成时刻
    float roundTime;//周转时间
    float wRoundTime;//带权周转时间
};

struct jcb {/*定义作业控制块JCB */
    char name[10];//作业名
    float subTime;//作业提交时间
    float runtime;//作业所需的运行时间
    float Rp;//后备作业响应比
    struct workTime wT;//时间结构体
    struct jcb* link;//链指针
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

int main() /*主函数*/
{
    int select=0,len,h=0;
    float sumTi=0,sumWi=0;
    input();
    len=space();
    printf("\n1.FCFS 2.SJF 3.HRN\n请选择作业调度算法:");
    scanf("%d",&select);
    while((len!=0)&&(ready!=NULL)){
        h++;
        printf("正在执行第%d个作业 \n",h);
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
    printf("\n全部作业已经完成.\n");
    printf("\t此组作业的平均周转时间：%.2f\n",sumTi/h);
    printf("\t此组作业的带权平均周转时间：%.2f\n",sumWi/h);
    system("PAUSE");
    return 0;
}

void sort() /* 建立对作业进行提交时间排列函数*/
{
    JCB *first, *second;
    int insert=0;
    if((ready==NULL)||((j->subTime)<(ready->subTime))){/*作业提交时间最短的,插入队首(如果就绪状态的作业为空或者)*/
        j->link=ready;
        ready=j;
        totalTime=j->subTime;
        j->Rp=1;
    }
    else /* 作业比较提交时间,插入适当的位置中*/
    {
        first=ready;
        second=first->link;
        while(second!=NULL){
            if((j->subTime)<(second->subTime)){ /*若插入作业比当前作业提交时间短,*/
             /*插入到当前作业前面*/
                j->link=second;
                first->link=j;
                second=NULL;
                insert=1;
            }
            else{ /* 插入作业优先数最低,则插入到队尾*/
                first=first->link;
                second=second->link;
            }
        }
        if (insert==0) first->link=j;
    }
}

void SJF()/* 获取队列中的最短作业 */
{
    JCB *front,*minTime,*rear;
    int flag=0;
    minTime=ready;
    rear=minTime->link;
    if ((rear!=NULL)&&(totalTime>=rear->subTime)&&(minTime->runtime)>(rear->runtime)){//寻找最短作业
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

void HRN()/* 获取队列中的最高响应作业 */
{
    JCB *front,*minRp,*rear;
    int flag=0;
    minRp=ready;
    rear=minRp->link;
    if ((rear!=NULL)&&(totalTime>=rear->subTime)&&(minRp->Rp)<(rear->Rp)){//寻找最高相应比作业
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

void input() /* 建立作业控制块函数*/
{
    int i,num;
    printf("请输入作业数:");
    scanf("%d",&num);
    for(i=0;i<num;i++){
        printf("作业号No.%d:\n",i+1);
        j=getPch(JCB);
        printf("输入作业名:");
        scanf("%s",j->name);
        printf("输入作业提交时刻:");
        scanf("%f",&j->subTime);
        printf("输入作业运行时间:");
        scanf("%f",&j->runtime);
        printf("\n");
        j->link=NULL;
        sort(); /* 调用sort函数*/
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

void display(JCB* jr,int select) /*建立作业显示函数,用于显示当前作业*/
{
    if (select==3) printf("\n作业   服务时间   响应比   运行时刻   完成时刻   周转时间   带权周转时间 \n");
    else printf("\n作业   服务时间   运行时刻   完成时刻   周转时间   带权周转时间 \n");
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

void destroy() /*建立作业撤消函数(作业运行结束,撤消作业)*/
{
    printf("\n\n作业[%s]已完成.\n",j->name);
    free(j);
}

void check(int select) /* 建立作业查看函数 */
{
    JCB* jr;
    printf("\n ****当前正在运行的作业是:%s",j->name); /*显示当前运行作业*/
    display(j,select);
    jr=ready;
    printf("\n ****当前就绪队列状态为:\n"); /*显示就绪队列状态*/
    while(jr!=NULL){
        jr->Rp=(totalTime-jr->subTime)/jr->runtime;
        display(jr,select);
        jr=jr->link;
    }
    destroy();
}

void running(JCB* jr) /* 建立作业就绪函数(作业运行时间到,置就绪状态*/
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
