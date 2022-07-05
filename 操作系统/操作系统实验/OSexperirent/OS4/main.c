#include <stdio.h>
#include <math.h>
#include <stdlib.h>

int a[10];
double averageMove[4];
int n,standard,num;

void FCFS(int c[], int m){//�����ȷ����㷨
    int i, s=0, sum=0, temp = 0;//�������������Ѱ�������Ѱ��ʱ��
    int b[num];
    for(i=0;i<num;i++){
        b[i] = a[i];//����˳��Ϊ����˳��
    }
    printf("\nFCFS�����㷨���Ϊ:\n");
    for(i=0;i<num;i++){
        printf("%d->", b[i]);
        temp=abs(s-b[i]);
        sum+=temp;//�������ƶ��ŵ���
        s=b[i];
    }
    averageMove[0]=sum*1.0/num;//����ƽ���ƶ��ŵ�������¼��������
    printf("\n");
}
//���Ѱ��ʱ������
void SSTF(int c[], int m) {
    int i,j,s,p,sum=0,temp=0;
    standard=100;
    printf("��ʼ�ŵ���Ϊ:%d",standard);
    int b[num];
    for (i = 0; i <num; i++)
        b[i] = a[i];
    printf("\nSSTF���Ƚ��:\n");
    for(i=num-1;i>=0;i--){//ѭ��Ƕ�ף�����Ѱ��·����̵Ĵŵ���
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
        sum+=temp;//�������ƶ��ŵ���
        standard=s;//����ʼ��׼��Ϊ��ǰ�Ĵŵ���
    }
    averageMove[1]=sum*1.0/num;//����ƽ���ƶ��ŵ���
    printf("\n");
}

// ɨ���㷨
void SCAN(int c[], int m) {
    int i,j,s,p,flag,sum=0,temp=0;
    standard=100;
    int b[num];
    for (i = 0; i < num; i++){
        b[i] = a[i];
    }
    printf("\nSCAN�����㷨���Ϊ:\n");
    for(i=num-1;i>=0;i--){
        flag = 0;
        for(j=0;j<=i;j++){
            if (b[j]-standard > 0){//�������ʼ�ŵ��Ŵ�Ĵŵ���
                flag = 1;
                p=j;
                break;
            }
        }
        if(flag == 1){
            s=b[p];
            for(j=0;j<=i;j++){
                if (b[j] > standard && b[j]-standard < s-standard) {//����
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
            sum+=temp;//�������ƶ��ŵ���
            standard=s;//����ʼ��׼��Ϊ��ǰ�Ĵŵ���
        }
    }
    averageMove[2]=sum*1.0/num;//����ƽ���ƶ��ŵ���
    printf("\n");
}

// ѭ��ɨ���㷨
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
    printf("\nCSCAN�����㷨���Ϊ:\n");
    if(b[num-1] <= standard){// �ж���������������Ƿ�С�ڵ�ǰ�ŵ���
        for(i=0;i<num;i++){
            printf("%d->", b[i]);
        }
        sum=standard-b[0]+b[n - 1];// �����ƶ�����
    }
    else if (b[0] >= standard){// �ж���������������Ƿ񶼴��ڵ�ǰ�ŵ���
        for (i = 0; i < num; i++) {
            printf("%3d  ", b[i]);
        }
        sum=b[num-1]-standard;// �����ƶ�����
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
    printf("������ŵ�������:");
    scanf("%d",&num);
    //srand((unsigned int) (time(NULL)));
    for(i=0;i<num;i++){
        printf("�����%d���ŵ���:",i+1);
        //a[i] = (rand() % 150) + 28;
        scanf("%d",&a[i]);
    }
    printf("������һ���ŵ���������Ϊ��\n");
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
    printf("\nƽ���ƶ��ŵ����Ա�ͳ��: \n");
    printf("----------------------------------------------\n");
    printf("|     �㷨      |          ƽ���ƶ��ŵ���        |\n");
    printf("----------------------------------------------\n");
    printf("|   FCFS       |           %.1f               |\n", averageMove[0]);
    printf("|   SSTF       |           %.1f               |\n", averageMove[1]);
    printf("|   SCAN       |           %.1f               |\n", averageMove[2]);
    printf("|   CSCAN      |           %.1f               |\n", averageMove[3]);
    printf("----------------------------------------------\n");
    system("PAUSE");
    return 0;
}