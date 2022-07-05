#include<stdio.h>
#include<stdlib.h>

#define SIZE 600            // �ڴ��ʼ��С
#define MINSIZE 5           // ��Ƭ��Сֵ

enum STATE {
    Free, Busy
};

struct subAreaNode {
    // ��ʼ��ַ
    int addr;
    // ������С
    int size;
    // ��ҵ��
    int taskId;
    // ����״̬
    STATE state;
    // ����ǰ��ָ��
    subAreaNode *prior;
    // ��������ָ��
    subAreaNode *next;
} subHead;

// ��ʼ�����з�����
void intSubArea() {
    // �����ʼ�����ڴ�
    subAreaNode *fir = (subAreaNode *) malloc(sizeof(subAreaNode));
    // ���׸�������ֵ
    fir->addr = 0;
    fir->size = SIZE;
    fir->state = Free;
    fir->taskId = -1;
    fir->prior = &subHead;
    fir->next = NULL;
    // ��ʼ������ͷ����Ϣ
    subHead.prior = NULL;
    subHead.next = fir;
}

// �״���Ӧ�㷨
int firstFit(int taskId, int size) {
    subAreaNode *p = subHead.next;
    while (p != NULL) {
        if (p->state == Free && p->size >= size) {
            // �ҵ�Ҫ����Ŀ��з���
            if (p->size - size <= MINSIZE) {
                // �������
                p->state = Busy;
                p->taskId = taskId;
            } else {
                // �����СΪsize������
                subAreaNode *node = (subAreaNode *) malloc(sizeof(subAreaNode));
                node->addr = p->addr + size;
                node->size = p->size - size;
                node->state = Free;
                node->taskId = -1;
                // �޸ķ������ڵ�ָ��
                node->prior = p;
                node->next = p->next;
                if (p->next != NULL) {
                    p->next->prior = node;
                }
                p->next = node;
                // �����������
                p->size = size;
                p->state = Busy;
                p->taskId = taskId;
            }
            printf("�ڴ����ɹ���\n");
            return 1;
        }
        p = p->next;
    }
    printf("�Ҳ������ʵ��ڴ����������ʧ��...\n");
    return 0;
}
//ѭ���״���Ӧ�㷨
int cycleFirstFit(int taskId, int size){
    subAreaNode *p = subHead.next;
    subAreaNode *q;
    while (p != NULL) {
        if (p->state == Free && p->size >= size) {
            // �ҵ�Ҫ����Ŀ��з���
            if (p->size - size <= MINSIZE) {
                // �������
                p->state = Busy;
                p->taskId = taskId;
            } else {
                // �����СΪsize������
                subAreaNode *node = (subAreaNode *) malloc(sizeof(subAreaNode));
                node->addr = p->addr + size;
                node->size = p->size - size;
                node->state = Free;
                node->taskId = -1;
                // �޸ķ������ڵ�ָ��
                node->prior = p;
                node->next = p->next;
                if (p->next != NULL) {
                    p->next->prior = node;
                }
                p->next = node;
                // �����������
                p->size = size;
                p->state = Busy;
                p->taskId = taskId;
            }
            printf("�ڴ����ɹ���\n");
            return 1;
        }
        p = p->next;
    }
    p=subHead.next;
    while (p != NULL){
        q=p->next;
        if(q==NULL){
            if (p->state == Free && p->size >= size) {
                // �ҵ�Ҫ����Ŀ��з���
                if (p->size - size <= MINSIZE) {
                    // �������
                    p->state = Busy;
                    p->taskId = taskId;
                } else {
                    // �����СΪsize������
                    subAreaNode *node = (subAreaNode *) malloc(sizeof(subAreaNode));
                    node->addr = p->addr + size;
                    node->size = p->size - size;
                    node->state = Free;
                    node->taskId = -1;
                    // �޸ķ������ڵ�ָ��
                    node->prior = p;
                    node->next = p->next;
                    if (p->next != NULL) {
                        p->next->prior = node;
                    }
                    p->next = node;
                    // �����������
                    p->size = size;
                    p->state = Busy;
                    p->taskId = taskId;
                }
                printf("�ڴ����ɹ���\n");
                return 1;
            }
        }
        p=p->next;
    }
    printf("�Ҳ������ʵ��ڴ����������ʧ��...\n");
    return 0;
}
// �����Ӧ�㷨
int bestFit(int taskId, int size) {
    subAreaNode *tar = NULL;
    int tarSize=SIZE + 1;//tarSizeΪ��С�ռ���Ƭ+1
    subAreaNode *p = subHead.next;
    while(p!=NULL){// Ѱ����ѿ�������
        if(p->state==Free && p->size >=size && p->size<tarSize){
            tar = p;
            tarSize = p->size;
        }
        p = p->next;
    }
    if(tar!= NULL){// �ҵ�Ҫ����Ŀ��з���
        if(tar->size - size <= MINSIZE){// �������
            tar->state = Busy;
            tar->taskId = taskId;
        }
        else{// �����СΪsize������
            subAreaNode *node = (subAreaNode *) malloc(sizeof(subAreaNode));
            node->addr = tar->addr + size;
            node->size = tar->size - size;
            node->state = Free;
            node->taskId = -1;
            // �޸ķ������ڵ�ָ��
            node->prior = tar;
            node->next = tar->next;
            if(tar->next != NULL){
                tar->next->prior = node;
            }
            tar->next = node;
            // �����������
            tar->size = size;
            tar->state = Busy;
            tar->taskId = taskId;
        }
        printf("�ڴ����ɹ���\n");
        return 1;
    } else {
        // �Ҳ������ʵĿ��з���
        printf("�Ҳ������ʵ��ڴ����������ʧ��...\n");
        return 0;
    }
}


int freeSubArea(int taskId){//�����ڴ溯��
    int flag=0;
    subAreaNode *p = subHead.next, *pp;
    while(p!=NULL){
        if(p->state == Busy && p->taskId == taskId){
            flag = 1;
            if((p->prior!=&subHead && p->prior->state==Free)&&(p->next!=NULL && p->next->state==Free)){// ���1���ϲ�������������
                // �Ⱥϲ�������
                pp = p;
                p = p->prior;
                p->size += pp->size;
                p->next = pp->next;
                pp->next->prior = p;
                free(pp);
                // ��ϲ�������
                pp = p->next;
                p->size += pp->size;
                p->next = pp->next;
                if(pp->next != NULL){
                    pp->next->prior = p;
                }
                free(pp);
            }
            else if((p->prior == &subHead || p->prior->state == Busy)&& (p->next!= NULL && p->next->state == Free)){// ���2��ֻ�ϲ�����ķ���
                pp = p->next;
                p->size += pp->size;
                p->state = Free;
                p->taskId = -1;
                p->next = pp->next;
                if (pp->next != NULL) {
                    pp->next->prior = p;
                }
                free(pp);
            }
            else if((p->prior != &subHead && p->prior->state == Free)&& (p->next == NULL || p->next->state == Busy)){// ���3��ֻ�ϲ�����ķ���
                pp = p;
                p = p->prior;
                p->size += pp->size;
                p->next = pp->next;
                if(pp->next!= NULL){
                    pp->next->prior = p;
                }
                free(pp);
            }
            else{
                // ���4�����·��������úϲ�
                p->state = Free;
                p->taskId = -1;
            }
        }
        p=p->next;
    }
    if(flag==1){
        // ���ճɹ�
        printf("�ڴ�������ճɹ�...\n");
        return 1;
    }
    else{
        // �Ҳ���Ŀ����ҵ������ʧ��
        printf("�Ҳ���Ŀ����ҵ���ڴ��������ʧ��...\n");
        return 0;
    }
}

void showSubArea(){// ��ʾ���з���������
    printf("\n");
    printf("��ǰ���ڴ����������£�        \n");
    printf("_____________________________________________\n");
    printf(" ��ʼ��ַ | �ռ��С | ����״̬ | ��ҵ�� \n");
    subAreaNode *p = subHead.next;
    while(p!=NULL){
        printf("---------------------------------------------\n");
        printf("");
        printf("   %3d  k |", p->addr);
        printf("   %3d  k |", p->size);
        printf("   %s   |", p->state == Free ? "Free" : "Busy");
        if(p->taskId > 0){
            printf("   %d   ", p->taskId);
        }
        else{
            printf("        ");
        }
        printf("\n");
        p = p->next;
    }
    printf("_____________________________________________\n");
    printf("\n");
}

int main() {
    int option, choice, m = 1, taskId, size;
    while (1) {
        intSubArea(); // ��ʼ�����з�����
        printf("��ѡ��Ҫģ��ķ����㷨��1.�״���Ӧ�㷨,2.�����Ӧ�㷨,3.ѭ���״���Ӧ�㷨,4.�˳�\n");
        printf("������:");
        scanf("%d", &option);
        if(option == 1){
            printf("�״���Ӧ�㷨��\n");
            m=1;
        }
        else if(option == 2){
            printf("�����Ӧ�㷨��\n");
            m=1;
        }
        else if(option == 3){
            printf("ѭ���״���Ӧ�㷨��\n");
            m=1;
        }
        else if(option == 4){
            break;
        }
        else {
            printf("�����������������\n\n");
            m = 0;
        }
        // ģ�⶯̬���������㷨
        while(m) {
            printf("    1. �����ڴ�    2.�����ڴ�    3.�˳�  \n");
            printf("*************************************************\n");
            printf("������:");
            scanf("%d", &choice);
            if(choice==1){
                // ģ������ڴ�
                printf("��������ҵ�ţ� ");
                scanf("%d", &taskId);
                printf("��������Ҫ������ڴ��С(KB)�� ");
                scanf("%d", &size);
                if(size <= 0){
                    printf("����,�����ڴ��С����>=0\n");
                    continue;
                }
                if(option == 1){//�����״���Ӧ�㷨
                    firstFit(taskId, size);
                }
                else if(option == 2){//���������Ӧ�㷨
                    bestFit(taskId, size);
                }
                else{//����ѭ���״���Ӧ�㷨
                    cycleFirstFit(taskId, size);
                }
                showSubArea();// ��ʾ���з��������
            }
            else if(choice==2){
                printf("������Ҫ���յ���ҵ�ţ� ");
                scanf("%d", &taskId);
                freeSubArea(taskId);//���û��պ���
                showSubArea();
            }
            else if(choice==3){
                break;
            }
            else{
                printf("�������,����������\n");
            }
        }
    }
    printf("ģ�����\n");
    system("PAUSE");
    return 0;
}
