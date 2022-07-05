#include <stdio.h>
#include<stdlib.h>

int Seg,Page,Offset,memorySize;
int table [5][5];
int blockNum[5];

void print(){
    printf("�ҵ��κ�%d,��ҳ����ϢΪ:\n",Seg);
    int k=0,address=0,block;
    printf("ҳ��\t�ڴ���\n");
    for(k=0;k<5;k++){
        printf("%d\t%d\n",k,blockNum[k]);
        if(Page==k) block=blockNum[k];
    }
    address=block*memorySize+Offset;
    printf("�������Ϊ:�κ�%d->ҳ��%d->�ڴ���%d\n",Seg,Page,block);
    printf("�ڴ���С%d,Ƭƫ����%d\n",memorySize,Offset);
    printf("�����ַΪ:%d\n",address);
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
    printf("������κ�(0-4):");
    scanf("%d",&Seg);
    printf("������ҳ��(0-4):");
    scanf("%d",&Page);
    printf("������ҳ��ƫ����:");
    scanf("%d",&Offset);
    printf("�������ڴ���С:");
    scanf("%d",&memorySize);
}

void check(){
    while(1){
        if(Seg>=5){
            printf("��Խ��,���������룡\n");
            system("PAUSE");
            system("CLS");
            input();
        }
        else if(Page>=5){
            printf("ҳԽ��,���������룡\n");
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
