#include<stdio.h>
#include<stdlib.h>

#define SIZE 600            // 内存初始大小
#define MINSIZE 5           // 碎片最小值

enum STATE {
    Free, Busy
};

struct subAreaNode {
    // 起始地址
    int addr;
    // 分区大小
    int size;
    // 作业号
    int taskId;
    // 分区状态
    STATE state;
    // 分区前向指针
    subAreaNode *prior;
    // 分区后向指针
    subAreaNode *next;
} subHead;

// 初始化空闲分区链
void intSubArea() {
    // 分配初始分区内存
    subAreaNode *fir = (subAreaNode *) malloc(sizeof(subAreaNode));
    // 给首个分区赋值
    fir->addr = 0;
    fir->size = SIZE;
    fir->state = Free;
    fir->taskId = -1;
    fir->prior = &subHead;
    fir->next = NULL;
    // 初始化分区头部信息
    subHead.prior = NULL;
    subHead.next = fir;
}

// 首次适应算法
int firstFit(int taskId, int size) {
    subAreaNode *p = subHead.next;
    while (p != NULL) {
        if (p->state == Free && p->size >= size) {
            // 找到要分配的空闲分区
            if (p->size - size <= MINSIZE) {
                // 整块分配
                p->state = Busy;
                p->taskId = taskId;
            } else {
                // 分配大小为size的区间
                subAreaNode *node = (subAreaNode *) malloc(sizeof(subAreaNode));
                node->addr = p->addr + size;
                node->size = p->size - size;
                node->state = Free;
                node->taskId = -1;
                // 修改分区链节点指针
                node->prior = p;
                node->next = p->next;
                if (p->next != NULL) {
                    p->next->prior = node;
                }
                p->next = node;
                // 分配空闲区间
                p->size = size;
                p->state = Busy;
                p->taskId = taskId;
            }
            printf("内存分配成功！\n");
            return 1;
        }
        p = p->next;
    }
    printf("找不到合适的内存分区，分配失败...\n");
    return 0;
}
//循环首次适应算法
int cycleFirstFit(int taskId, int size){
    subAreaNode *p = subHead.next;
    subAreaNode *q;
    while (p != NULL) {
        if (p->state == Free && p->size >= size) {
            // 找到要分配的空闲分区
            if (p->size - size <= MINSIZE) {
                // 整块分配
                p->state = Busy;
                p->taskId = taskId;
            } else {
                // 分配大小为size的区间
                subAreaNode *node = (subAreaNode *) malloc(sizeof(subAreaNode));
                node->addr = p->addr + size;
                node->size = p->size - size;
                node->state = Free;
                node->taskId = -1;
                // 修改分区链节点指针
                node->prior = p;
                node->next = p->next;
                if (p->next != NULL) {
                    p->next->prior = node;
                }
                p->next = node;
                // 分配空闲区间
                p->size = size;
                p->state = Busy;
                p->taskId = taskId;
            }
            printf("内存分配成功！\n");
            return 1;
        }
        p = p->next;
    }
    p=subHead.next;
    while (p != NULL){
        q=p->next;
        if(q==NULL){
            if (p->state == Free && p->size >= size) {
                // 找到要分配的空闲分区
                if (p->size - size <= MINSIZE) {
                    // 整块分配
                    p->state = Busy;
                    p->taskId = taskId;
                } else {
                    // 分配大小为size的区间
                    subAreaNode *node = (subAreaNode *) malloc(sizeof(subAreaNode));
                    node->addr = p->addr + size;
                    node->size = p->size - size;
                    node->state = Free;
                    node->taskId = -1;
                    // 修改分区链节点指针
                    node->prior = p;
                    node->next = p->next;
                    if (p->next != NULL) {
                        p->next->prior = node;
                    }
                    p->next = node;
                    // 分配空闲区间
                    p->size = size;
                    p->state = Busy;
                    p->taskId = taskId;
                }
                printf("内存分配成功！\n");
                return 1;
            }
        }
        p=p->next;
    }
    printf("找不到合适的内存分区，分配失败...\n");
    return 0;
}
// 最佳适应算法
int bestFit(int taskId, int size) {
    subAreaNode *tar = NULL;
    int tarSize=SIZE + 1;//tarSize为最小空间碎片+1
    subAreaNode *p = subHead.next;
    while(p!=NULL){// 寻找最佳空闲区间
        if(p->state==Free && p->size >=size && p->size<tarSize){
            tar = p;
            tarSize = p->size;
        }
        p = p->next;
    }
    if(tar!= NULL){// 找到要分配的空闲分区
        if(tar->size - size <= MINSIZE){// 整块分配
            tar->state = Busy;
            tar->taskId = taskId;
        }
        else{// 分配大小为size的区间
            subAreaNode *node = (subAreaNode *) malloc(sizeof(subAreaNode));
            node->addr = tar->addr + size;
            node->size = tar->size - size;
            node->state = Free;
            node->taskId = -1;
            // 修改分区链节点指针
            node->prior = tar;
            node->next = tar->next;
            if(tar->next != NULL){
                tar->next->prior = node;
            }
            tar->next = node;
            // 分配空闲区间
            tar->size = size;
            tar->state = Busy;
            tar->taskId = taskId;
        }
        printf("内存分配成功！\n");
        return 1;
    } else {
        // 找不到合适的空闲分区
        printf("找不到合适的内存分区，分配失败...\n");
        return 0;
    }
}


int freeSubArea(int taskId){//回收内存函数
    int flag=0;
    subAreaNode *p = subHead.next, *pp;
    while(p!=NULL){
        if(p->state == Busy && p->taskId == taskId){
            flag = 1;
            if((p->prior!=&subHead && p->prior->state==Free)&&(p->next!=NULL && p->next->state==Free)){// 情况1：合并上下两个分区
                // 先合并上区间
                pp = p;
                p = p->prior;
                p->size += pp->size;
                p->next = pp->next;
                pp->next->prior = p;
                free(pp);
                // 后合并下区间
                pp = p->next;
                p->size += pp->size;
                p->next = pp->next;
                if(pp->next != NULL){
                    pp->next->prior = p;
                }
                free(pp);
            }
            else if((p->prior == &subHead || p->prior->state == Busy)&& (p->next!= NULL && p->next->state == Free)){// 情况2：只合并下面的分区
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
            else if((p->prior != &subHead && p->prior->state == Free)&& (p->next == NULL || p->next->state == Busy)){// 情况3：只合并上面的分区
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
                // 情况4：上下分区均不用合并
                p->state = Free;
                p->taskId = -1;
            }
        }
        p=p->next;
    }
    if(flag==1){
        // 回收成功
        printf("内存分区回收成功...\n");
        return 1;
    }
    else{
        // 找不到目标作业，回收失败
        printf("找不到目标作业，内存分区回收失败...\n");
        return 0;
    }
}

void showSubArea(){// 显示空闲分区链函数
    printf("\n");
    printf("当前的内存分配情况如下：        \n");
    printf("_____________________________________________\n");
    printf(" 起始地址 | 空间大小 | 工作状态 | 作业号 \n");
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
        intSubArea(); // 初始化空闲分区链
        printf("请选择要模拟的分配算法：1.首次适应算法,2.最佳适应算法,3.循环首次适应算法,4.退出\n");
        printf("请输入:");
        scanf("%d", &option);
        if(option == 1){
            printf("首次适应算法：\n");
            m=1;
        }
        else if(option == 2){
            printf("最佳适应算法：\n");
            m=1;
        }
        else if(option == 3){
            printf("循环首次适应算法：\n");
            m=1;
        }
        else if(option == 4){
            break;
        }
        else {
            printf("输入错误，请重新输入\n\n");
            m = 0;
        }
        // 模拟动态分区分配算法
        while(m) {
            printf("    1. 分配内存    2.回收内存    3.退出  \n");
            printf("*************************************************\n");
            printf("请输入:");
            scanf("%d", &choice);
            if(choice==1){
                // 模拟分配内存
                printf("请输入作业号： ");
                scanf("%d", &taskId);
                printf("请输入需要分配的内存大小(KB)： ");
                scanf("%d", &size);
                if(size <= 0){
                    printf("错误,分配内存大小必须>=0\n");
                    continue;
                }
                if(option == 1){//调用首次适应算法
                    firstFit(taskId, size);
                }
                else if(option == 2){//调用最佳适应算法
                    bestFit(taskId, size);
                }
                else{//调用循环首次适应算法
                    cycleFirstFit(taskId, size);
                }
                showSubArea();// 显示空闲分区链情况
            }
            else if(choice==2){
                printf("请输入要回收的作业号： ");
                scanf("%d", &taskId);
                freeSubArea(taskId);//调用回收函数
                showSubArea();
            }
            else if(choice==3){
                break;
            }
            else{
                printf("输入错误,请重新输入\n");
            }
        }
    }
    printf("模拟完成\n");
    system("PAUSE");
    return 0;
}
