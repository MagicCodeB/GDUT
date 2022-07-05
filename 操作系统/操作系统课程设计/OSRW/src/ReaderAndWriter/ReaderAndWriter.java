package ReaderAndWriter;

import java.util.Scanner;

public class ReaderAndWriter {
    public static int number;//定义读者或写者的编号
    public static String type;//定义读者类型或写者类型
    public static double arriveTime;//定义到达时间
    public static double operateTime;//定义运行时间
    public static void main(String[] args) {
        Semaphore read=new Semaphore(1);//读信号量，实现写者到来后阻塞读者
        Semaphore readCountSignal=new Semaphore(1);//读计数器信号量，互斥访问读计数器
        Semaphore writeCountSignal=new Semaphore(1);//写计数器信号量，互斥访问写计数器
        Semaphore fileSrc=new Semaphore(1);//公共资源区信号量
        Semaphore keySignal=new Semaphore(1);//读者和写者公平竞争信号量
        Semaphore OneSignal=new Semaphore(1);//读者和写者互斥访问keySignal的信号量
        int amount,i,choice;
        Scanner sc=new Scanner(System.in);
        //菜单，使用switch case语句进行选择
        System.out.println("***欢迎进入读者与写者模拟程序***");
        System.out.println("|  作者:19级软工(1)班魏耀辉  |");
        System.out.println("|        1.读者优先        |");
        System.out.println("|        2.写者优先        |");
        System.out.println("|        3.公平竞争        |");
        System.out.println("**************************");
        System.out.print("请输入选项:");
        choice= sc.nextInt();
        switch (choice){
            case 1:{
                System.out.print("请输入读者与写者总人数:");
                amount= sc.nextInt();
                People []people=new People[amount];
                for(i=0;i<amount;i++){
                    inputInfo();
                    People people1=new People(number,type,arriveTime,operateTime);
                    people[i]=people1;

                }
                for(i=0;i<amount;i++){
                    if(people[i].type.equals("R")){
                        new Thread(new ReaderRF(readCountSignal,fileSrc,people[i])).start();
                    }
                    else {
                        new Thread(new WriterRF(fileSrc,people[i])).start();
                    }
                }
                break;
            }
            case 2:{
                System.out.print("请输入读者与写者总人数:");
                amount= sc.nextInt();
                People []people=new People[amount];
                for(i=0;i<amount;i++){
                    inputInfo();
                    People people1=new People(number,type,arriveTime,operateTime);
                    people[i]=people1;

                }
                for(i=0;i<amount;i++){
                    if(people[i].type.equals("R")){
                        new Thread(new ReaderWF(read,readCountSignal,fileSrc,people[i])).start();
                    }
                    else {
                        new Thread(new WriterWF(read,writeCountSignal,fileSrc,people[i])).start();
                    }
                }
                break;
            }
            case 3:{
                System.out.print("请输入读者与写者总人数:");
                amount= sc.nextInt();
                People []people=new People[amount];
                for(i=0;i<amount;i++){
                    inputInfo();
                    People people1=new People(number,type,arriveTime,operateTime);
                    people[i]=people1;

                }
                for(i=0;i<amount;i++){
                    if(people[i].type.equals("R")){
                        new Thread(new ReaderFair(readCountSignal,fileSrc,keySignal,OneSignal,people[i])).start();
                    }
                    else {
                        new Thread(new WriterFair(keySignal,OneSignal,fileSrc,people[i])).start();
                    }
                }
                break;
            }
        }
    }
    public static void inputInfo(){//信息输入方法
        Scanner sc=new Scanner(System.in);
        System.out.print("请输入用户类型(R/W):");
        type= sc.next();
        System.out.print("请输入读者或写者的编号:");
        number=sc.nextInt();
        System.out.print("请输入读者或写者到达时间(从0时刻开始,单位为秒):");
        arriveTime= sc.nextDouble();
        System.out.print("请输入读者或写者操作时间(从0时刻开始,单位为秒):");
        operateTime=sc.nextDouble();
    }
}
class People{//定义人的类，包含编号、类型、到达时间和运行时间
    double arriveTime;//到达时间
    double operateTime;//运行时间
    int number;//编号
    String type;//类型
    public People(int number,String type,double arriveTime,double operateTime){//有参构造器
        this.number=number;
        this.type=type;
        this.arriveTime=arriveTime;
        this.operateTime=operateTime;
    }
}
class ReaderWF implements Runnable{//通过实现Runnable接口来模拟写者优先的读者线程
    private Semaphore read,readCountSignal,fileSrc;
    static int readCount=0;//初始化静态的读者数量
    People people;//People类的people对象
    public ReaderWF(Semaphore read,Semaphore readCountSignal,Semaphore fileSrc,People people){//写者优先模式下，读者线程的构造器
        this.read=read;
        this.readCountSignal=readCountSignal;
        this.fileSrc=fileSrc;
        this.people=people;
    }
    @Override
    public void run() {//重写run方法
        try{
            Thread.sleep((int)(1000* people.arriveTime));//线程睡眠，模拟到达时间
        }
        catch (InterruptedException e){
            e.printStackTrace();
        }
        System.out.println("读者"+people.number+": 申请读操作");
        read.p();//read信号量的p操作（没有写者阻塞）
        readCountSignal.p();//readCountSignal信号量的p操作
        if(readCount==0){
            fileSrc.p();//fileSrc信号量的p操作
        }
        readCount++;//读者数量+1
        readCountSignal.v();//readCountSignal信号量的v操作
        read.v();//read信号量的v操作
        //临界区代码块
        System.out.println("读者"+people.number+": 开始读操作");
        try{
            Thread.sleep((int)(1000*people.operateTime));//线程睡眠，模拟运行时间
        }
        catch (InterruptedException e){
            e.printStackTrace();
        }
        System.out.println("读者"+people.number+": 结束读操作");
        readCountSignal.p();//readCountSignal信号量的p操作
        readCount--;//读者读完离开，读者数量-1
        if(readCount==0){
            fileSrc.v();//fileSrc信号量的v操作
        }
        readCountSignal.v();//readCountSignal信号量的v操作
    }
}
class ReaderRF implements Runnable{
    Semaphore readCountSignal,fileSrc;
    static int readCount=0;
    People people;
    public ReaderRF(Semaphore readCountSignal,Semaphore fileSrc,People people){
        this.readCountSignal=readCountSignal;
        this.fileSrc=fileSrc;
        this.people=people;
    }
    @Override
    public void run() {
        try{
            Thread.sleep((int)(1000* people.arriveTime));
        }
        catch (InterruptedException e){
            e.printStackTrace();
        }
        System.out.println("读者"+people.number+": 申请读操作");
        readCountSignal.p();
        if(readCount==0){
            fileSrc.p();
        }
        readCount++;
        readCountSignal.v();
        System.out.println("读者"+people.number+": 开始读操作");
        try{
            Thread.sleep((int)(1000* people.operateTime));
        }
        catch (InterruptedException e){
            e.printStackTrace();
        }
        System.out.println("读者"+people.number+": 结束读操作");
        readCountSignal.p();
        readCount--;
        if(readCount==0){
            fileSrc.v();
        }
        readCountSignal.v();
    }
}
class ReaderFair implements Runnable{
    Semaphore keySignal,OneSignal,readCountSignal,fileSrc;
    static int readCount=0;
    People people;
    public ReaderFair(Semaphore readCountSignal,Semaphore fileSrc,Semaphore keySignal,Semaphore Onesignal,People people){
        this.readCountSignal=readCountSignal;
        this.fileSrc=fileSrc;
        this.keySignal=keySignal;
        this.OneSignal=Onesignal;
        this.people=people;
    }
    @Override
    public void run() {
        try{
            Thread.sleep((int)(1000* people.arriveTime));
        }
        catch (InterruptedException e){
            e.printStackTrace();
        }
        System.out.println("读者"+people.number+": 申请读操作");
        keySignal.p();//keySignal信号量的p操作,申请访问令牌
        readCountSignal.p();
        if(readCount==0){
            fileSrc.p();
        }
        readCount++;
        readCountSignal.v();
        keySignal.v();//keySignal信号量的v操作,释放令牌
        System.out.println("读者"+people.number+": 开始读操作");
        try{
            Thread.sleep((int)(1000* people.operateTime));
        }
        catch (InterruptedException e){
            e.printStackTrace();
        }
        System.out.println("读者"+people.number+": 结束读操作");
        readCountSignal.p();
        readCount--;
        if(readCount==0){
            fileSrc.v();
        }
        readCountSignal.v();
    }
}
class WriterWF implements Runnable{//通过实现Runnable接口来模拟写者优先的写者线程
    Semaphore writeCountSignal,fileSrc,read;
    static int writeCount=0;//初始化静态写者数量为0
    People people;//People类的people对象
    public WriterWF(Semaphore read,Semaphore writeCountSignal,Semaphore fileSrc,People people){//写者优先模式下，写者线程的构造器
        this.read=read;
        this.writeCountSignal=writeCountSignal;
        this.fileSrc=fileSrc;
        this.people=people;
    }
    @Override
    public void run() {
        try{
            Thread.sleep((int)(1000* people.arriveTime));//线程睡眠,模拟到达时间
        }
        catch (InterruptedException e){
            e.printStackTrace();
        }
        System.out.println("写者"+people.number+": 申请写操作");
        writeCountSignal.p();//信号量writeCountSignal的p操作
        if(writeCount==0){
            read.p();//信号量read的p操作
        }
        writeCount++;//写者数量+1
        writeCountSignal.v();//信号量writeCountSignal的v操作
        fileSrc.p();//信号量fileSrc的p操作
        System.out.println("写者"+people.number+": 开始写操作");
        try{
            Thread.sleep((int)(1000* people.operateTime));//线程睡眠,模拟运行时间
        }
        catch (InterruptedException e){
            e.printStackTrace();
        }
        System.out.println("写者"+people.number+": 结束写操作");
        fileSrc.v();//信号量fileSrc的v操作
        writeCountSignal.p();//信号量writeCountSignal的p操作
        writeCount--;//写者数量-1
        if(writeCount==0){
            read.v();//信号量read的v操作
        }
        writeCountSignal.v();//信号量writeCountSignal的v操作
    }
}
class WriterRF implements Runnable{
    Semaphore fileSrc;
    People people;
    public WriterRF(Semaphore fileSrc,People people){
        this.fileSrc=fileSrc;
        this.people=people;
    }
    @Override
    public void run() {
        try{
            Thread.sleep((int)(1000* people.arriveTime));
        }
        catch (InterruptedException e){
            e.printStackTrace();
        }
        System.out.println("写者"+people.number+": 申请写操作");
        fileSrc.p();
        System.out.println("写者"+people.number+": 开始写操作");
        try{
            Thread.sleep((int)(1000* people.operateTime));
        }
        catch (InterruptedException e){
            e.printStackTrace();
        }
        System.out.println("写者"+people.number+": 结束写操作");
        fileSrc.v();
    }
}
class WriterFair implements Runnable{
    Semaphore keySignal,OneSignal,fileSrc;
    People people;
    public WriterFair(Semaphore keySignal,Semaphore Onesignal,Semaphore fileSrc,People people){
        this.keySignal=keySignal;
        this.OneSignal=Onesignal;
        this.fileSrc=fileSrc;
        this.people=people;
    }
    @Override
    public void run() {
        try{
            Thread.sleep((int)(1000* people.arriveTime));
        }
        catch (InterruptedException e){
            e.printStackTrace();
        }
        System.out.println("写者"+people.number+": 申请写操作");
        OneSignal.p();
        keySignal.p();
        fileSrc.p();
        System.out.println("写者"+people.number+": 开始写操作");
        try{
            Thread.sleep((int)(1000* people.operateTime));
        }
        catch (InterruptedException e){
            e.printStackTrace();
        }
        System.out.println("写者"+people.number+": 结束写操作");
        fileSrc.v();
        keySignal.v();
        OneSignal.v();
    }
}