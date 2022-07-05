#include <stdio.h>
#include <stdlib.h>

#define getJch(type) (type*)malloc(sizeof(type))

struct jcb { /* ������̿��ƿ�JCB */
    char name[10]; //��ҵ����
    char state; //��ҵ״̬
    int arriveTime; //��ҵ����ʱ��
    int beginTime; //��ҵ��ʼ���е�ʱ��
    int needTime; //��ҵ��Ҫ������ʱ��
    int runTime; //��ҵ�Ѿ����е�ʱ��
    int finishTime; //��ҵ�������е�ʱ��
    int memory; //��ҵ��Ҫ���ڴ��С
    int disk; //��ҵ��Ҫ�ĴŴ�������
    struct jcb *next; //ָ���������һ����ҵ��ָ��
}*ready= NULL, *run= NULL, *finish= NULL, *p, *q = NULL;

typedef struct jcb JCB;

int totalMemory = 100, totalDisk = 5;

void FCFS();//�����ȷ�����Ⱥ���
void SJF();//����ҵ���ȵ��Ⱥ���
void input();//������ҵ��Ϣ����
void output();//�������
void Running(JCB* s);//���к���
void print(JCB* t);//��ӡ����
void Finish(JCB* s);//��������
JCB* findHead(JCB* s);//��ͷ��㺯��
JCB* findFCFS(int time, JCB* s);//�����ȷ�������㷨��Ѱ�Һ��ʵ���ҵ����
JCB* findSJF(int time, JCB* s);//����ҵ���ȵ����㷨��Ѱ�Һ��ʵ���ҵ����

int main(){
    int choice;
    input();//������ҵ��Ϣ
    printf("\n1.FCFS�����㷨\t2.SJF�����㷨\t3.��������\n");
    printf("**��ѡ������㷨���������: ");
    scanf("%d", &choice);
    switch(choice){
        case 1: {
            FCFS();//ѡ�������ȷ����㷨
            break;
        }
        case 2: {
            SJF();//ѡ�����ҵ�����㷨
            break;
        }
        default: {
            printf("\n�������\n");
            break;
        }
    }
    system("PAUSE");
    return 0;
}

void print(JCB* t){ /*���������ҵ����Ϣ*/
    printf("    %s\t",t->name);
    switch(t->state){
        case 'W': {
            printf("�ȴ���\t\t");
            break;
        }
        case 'R': {
            printf("������\t\t");
            break;
        }
        case 'F': {
            printf("�����\t\t");
            break;
        }
    }
    printf("%d\t\t", t->arriveTime);
    printf("%d\t\t", t->needTime);
    printf("%d\t\t", t->memory);
    printf("%d\t\t", t->disk);
    printf("\n");
}

void output(){ /*��ӡ��ҵ��*/
    JCB *t;
    printf("��ɶ���Ϊ��\n");
    printf("************************************************************************************\n");
    printf(" ��ҵ����\t ״̬\t    ����ʱ��\t     ��Ҫʱ��\t     ��Ҫ�ڴ�\t     �Ŵ���\n");
    for(t=finish;t!=NULL;t=t->next){
        print(t);
    }
    if(finish!=NULL){
        printf("\n");
    }
    t=run;
    printf("************************************************************************************\n");
    printf("\n");
    printf("���ж���Ϊ��\n");
    printf("************************************************************************************\n");
    printf(" ��ҵ����\t ״̬\t    ����ʱ��\t     ��Ҫʱ��\t     ��Ҫ�ڴ�\t     �Ŵ���\n");
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
    printf("��������Ϊ��\n");
    printf("************************************************************************************\n");
    printf(" ��ҵ����\t ״̬\t    ����ʱ��\t     ��Ҫʱ��\t     ��Ҫ�ڴ�\t     �Ŵ���\n");
    for(t=ready;t!=NULL;t=t->next){
        print(t);
    }
    printf("************************************************************************************\n");
    printf("\n");
}

JCB* findHead(JCB* s){ /*Ѱ��ָ�����ĸ��׽��*/
    JCB *t=ready;
    if(t==s)return NULL;
    while((t->next != s)){
        t=t->next;
    }
    return t;
}

void Running(JCB* s){ /*���������е���ҵ��ŵ����ж���*/
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

void Finish(JCB* s){ /*������ɵ���ҵ�������ɶ���*/
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

JCB* findFCFS(int time, JCB* s){ /*�ҵ���һ��δ�������Դ�㹻����ҵ*/
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

void FCFS(){ /*�����ȷ�������㷨*/
    int time;
    JCB *c;
    p=ready;
    printf("\n�����ȷ�������㷨: \n");
    for(time=0;p!=NULL;time++){
        if(time >= p->arriveTime){ //��ҵ�ѵ���
            if(p->runTime == 0){ //����ʱ��Ϊ0����ʼ����
                p->beginTime=time;
                p->state='R';
                Running(p);
                printf("\n��ҵ[%s]��ʼ����. . . \n", p->name);
                output();
                system("PAUSE");
            }
            if((p->state=='R') && (p->needTime>p->runTime)){ //��ҵ����������δ�������
                p->runTime++;
            }
            if(p->needTime == p->runTime){
                p->state='F';//��ҵ״̬��ΪF
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
    printf("\n**������ҵ�����\n");
    output();
}

JCB* findSJF(int time, JCB* s){ /*�ҵ�δ��ɵ���ҵ����̵�����Դ�㹻����ҵ*/
    JCB *min =ready;
    JCB *t =ready;
    while(t != NULL){
        if((time >= t->arriveTime) && (t->state != 'F') && (t->needTime < min->needTime) && (totalMemory - s->memory >= t->memory) && (totalDisk - s->disk >= t->disk)){ //�ѵ�����δ��ɵ���ҵ�����������Դ�㹻����ҵ
            min = t;
        }
        t = t->next;
    }
    if((min != NULL) && ((totalMemory - s->memory < min->memory) || (totalDisk - s->disk < min->disk))){ //�ȴ�����δ������Դ����
        t=ready;
        while(t != NULL){
            if((time >= t->arriveTime) && (t->state != 'F') && (t->needTime < min->needTime)){ //�ѵ�����δ��ɵ���ҵ������̵���ҵ
                min = t;
            }
            t = t->next;
        }
    }
    return min;
}

void SJF(){ /*�����ҵ���ȵ����㷨*/
    int time;
    p=ready;
    printf("\n�����ҵ���ȵ���(SJF)�㷨: \n");
    for(time = 0; p != NULL; time++){
        if(time >= p->arriveTime){ //��ҵ�ѵ���
            if(p->runTime == 0){ //����ʱ��Ϊ0����ʼ����
                p->beginTime = time;
                p->state = 'R';
                Running(p);
                printf("\n**��ҵ[%s]��ʼ����. . . \n", p->name);
                output();
                system("PAUSE");
            }
            if((p->state == 'R') && (p->needTime > p->runTime)){ //��ҵ����������δ�������
                p->runTime++;
            }
            if(p->needTime == p->runTime){
                p->state = 'F';
                p->finishTime = time + 1;
                Finish(p);
                p = findSJF(time, p);//�ҵ���һ��δ��ɵ���̵���ҵ
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
            p = p->next;//���ʵ��Ϊ�ֻ�����
        }
    }
    printf("\n**������ҵ�����\n");
    output();
}

void insert(){ /*��������ҵ��㰴FCFS˳����뵽�ȴ�����*/
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

void input(){ /*������ҵ��Ϣ*/
    int n, i;
    printf("��������ҵ����:");
    scanf("%d", &n);
    printf("\n");
    for(i=0;i<n;i++){
        p=getJch(JCB);
        printf("��ҵ%d: \n",i+1);
        printf("��ҵ����: ");
        scanf("%s", p->name);
        printf("����ʱ��: ");
        scanf("%d", &p->arriveTime);
        printf("��������ʱ��: ");
        scanf("%d", &p->needTime);
        printf("�����ڴ��С: ");
        scanf("%d", &p->memory);
        printf("����Ŵ�������: ");
        scanf("%d", &p->disk);
        insert();
    }
    for(p=ready;p!=NULL;p=p->next){ //��ʼ����ҵ���Ե�ֵ
        p->state='W';
        p->beginTime=p->runTime=p->finishTime=0;
    }
}