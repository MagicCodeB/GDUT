#include <stdio.h>
#include <math.h>
#include <stdlib.h>

int a[10];
double averageMove[4];
int n,standard,num;

void FCFS(int c[], int m){//先来先服务算法
    int i, s=0, sum=0, temp = 0;//定义变量，计算寻道距离和寻道时间
    int b[num];
    for(i=0;i<num;i++){
        b[i] = a[i];//输入顺序即为服务顺序
    }
    printf("\nFCFS调度算法结果为:\n");
    for(i=0;i<num;i++){
        printf("%d->", b[i]);
        temp=abs(s-b[i]);
        sum+=temp;//计算总移动磁道数
        s=b[i];
    }
    averageMove[0]=sum*1.0/num;//计算平均移动磁道数并记录在数组中
    printf("\n");
}
//最短寻道时间优先
void SSTF(int c[], int m) {
    int i,j,s,p,sum=0,temp=0;
    standard=100;
    printf("初始磁道号为:%d",standard);
    int b[num];
    for (i = 0; i <num; i++)
        b[i] = a[i];
    printf("\nSSTF调度结果:\n");
    for(i=num-1;i>=0;i--){//循环嵌套，查找寻道路径最短的磁道号
        s=b[0];
        p=0;
        for(j=0;j<=i;j++){
            if (abs(b[j]-standard) < abs(s-standard)){
                s=b[j];
                p=j;
            }
        }
        b[p]=b[i];
        printf("%d->",s);
        temp=abs(s-standard);
        sum+=temp;//计算总移动磁道数
        standard=s;//将起始标准该为当前的磁道号
    }
    averageMove[1]=sum*1.0/num;//计算平均移动磁道数
    printf("\n");
}

// 扫描算法
void SCAN(int c[], int m) {
    int i,j,s,p,flag,sum=0,temp=0;
    standard=100;
    int b[num];
    for (i = 0; i < num; i++){
        b[i] = a[i];
    }
    printf("\nSCAN调度算法结果为:\n");
    for(i=num-1;i>=0;i--){
        flag = 0;
        for(j=0;j<=i;j++){
            if (b[j]-standard > 0){//求出比起始磁道号大的磁道号
                flag = 1;
                p=j;
                break;
            }
        }
        if(flag == 1){
            s=b[p];
            for(j=0;j<=i;j++){
                if (b[j] > standard && b[j]-standard < s-standard) {//排序
                    s = b[j];
                    p = j;
                }
            }
            b[p] = b[i];
            printf("%d->",s);
            temp=s-standard;
            sum+=temp;
            standard=s;
        }
        else{
            s=b[0];
            for (j = 0; j <= i; j++){
                if (standard - b[j] <= standard-s) {
                    s = b[j];
                    p = j;
                }
            }
            b[p] = b[i];
            printf("%d->",s);
            temp=abs(standard-s);
            sum+=temp;//计算总移动磁道数
            standard=s;//将起始标准该为当前的磁道号
        }
    }
    averageMove[2]=sum*1.0/num;//计算平均移动磁道数
    printf("\n");
}

// 循环扫描算法
void CSCAN(int c[], int m) {
    int i,j,r,temp,k=1,sum=0;
    standard=100;
    int b[num];
    for(i=0;i<num;i++){
        b[i] = a[i];
    }
    for(i=0;i<num;i++){
        for(j=i+1;j<num;j++){
            if (b[i] > b[j]){
                temp=b[i];
                b[i]=b[j];
                b[j]=temp;
            }
        }
    }
    printf("\nCSCAN调度算法结果为:\n");
    if(b[num-1] <= standard){// 判断整个数组里的数是否都小于当前磁道号
        for(i=0;i<num;i++){
            printf("%d->", b[i]);
        }
        sum=standard-b[0]+b[n - 1];// 计算移动距离
    }
    else if (b[0] >= standard){// 判断整个数组里的数是否都大于当前磁道号
        for (i = 0; i < num; i++) {
            printf("%3d  ", b[i]);
        }
        sum=b[num-1]-standard;// 计算移动距离
    }
    else {
        while (b[k] < standard){
            k++;
        }
        r=k;
        for(j=r;j<num;j++){
            printf("%d->", b[j]);
        }
        for(j=0;j<r;j++) {
            printf("%d->", b[j]);
        }
        sum=2*(b[num-1]-b[0])+b[r-1]-standard;
        averageMove[3]=sum*1.0/num;
    }
    printf("\n");
}

void InitArray() {
    int i;
    printf("请输入磁道号总数:");
    scanf("%d",&num);
    //srand((unsigned int) (time(NULL)));
    for(i=0;i<num;i++){
        printf("输入第%d个磁道号:",i+1);
        //a[i] = (rand() % 150) + 28;
        scanf("%d",&a[i]);
    }
    printf("产生的一个磁道访问序列为：\n");
    for(i=0;i<num;i++){
        printf("%3d  ", a[i]);
    }
    printf("\n");
}


int main() {
    InitArray();
    FCFS(a,num);
    SSTF(a,num);
    SCAN(a,num);
    CSCAN(a,num);
    printf("\n平均移动磁道数对比统计: \n");
    printf("----------------------------------------------\n");
    printf("|     算法      |          平均移动磁道数        |\n");
    printf("----------------------------------------------\n");
    printf("|   FCFS       |           %.1f               |\n", averageMove[0]);
    printf("|   SSTF       |           %.1f               |\n", averageMove[1]);
    printf("|   SCAN       |           %.1f               |\n", averageMove[2]);
    printf("|   CSCAN      |           %.1f               |\n", averageMove[3]);
    printf("----------------------------------------------\n");
    system("PAUSE");
    return 0;
}