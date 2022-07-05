#include <stdio.h>
#include<stdlib.h>

int Seg,Page,Offset,memorySize;
int table [5][5];
int blockNum[5];

void print(){
    printf("找到段号%d,其页表信息为:\n",Seg);
    int k=0,address=0,block;
    printf("页号\t内存块号\n");
    for(k=0;k<5;k++){
        printf("%d\t%d\n",k,blockNum[k]);
        if(Page==k) block=blockNum[k];
    }
    address=block*memorySize+Offset;
    printf("计算过程为:段号%d->页号%d->内存块号%d\n",Seg,Page,block);
    printf("内存块大小%d,片偏移量%d\n",memorySize,Offset);
    printf("物理地址为:%d\n",address);
}

void transform(){
    int i,j;
    for(i=0;i<5;i++){
        for(j=0;j<5;j++){
            if(Seg==i){
                blockNum[j]=table[i][j];
            }
        }
    }
    print();
}

void input(){
    printf("请输入段号(0-4):");
    scanf("%d",&Seg);
    printf("请输入页号(0-4):");
    scanf("%d",&Page);
    printf("请输入页内偏移量:");
    scanf("%d",&Offset);
    printf("请输入内存块大小:");
    scanf("%d",&memorySize);
}

void check(){
    while(1){
        if(Seg>=5){
            printf("段越界,请重新输入！\n");
            system("PAUSE");
            system("CLS");
            input();
        }
        else if(Page>=5){
            printf("页越界,请重新输入！\n");
            system("PAUSE");
            system("CLS");
            input();
        }
        else{
            transform();
            break;
        }
    }
}

void Init(){
    int i,j,block=0;
    for(i=0;i<5;i++){
        for(j=0;j<5;j++){
            block++;
            table[i][j]=block;
        }
    }
}

int main() {
    Init();
    input();
    check();
    system("PAUSE");
    return 0;
}
