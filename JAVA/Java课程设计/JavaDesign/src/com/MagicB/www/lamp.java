package com.MagicB.www;

public class lamp implements Runnable {
    public light opposite, now;//相互匹配的两个灯，分为直行匹配和左转匹配
    public int greenTime;//绿灯亮的时间
    public int name;//编组，用于线程调度
    public boolean status;//状态决定是否亮灯
    public static final Object lock = new Object();//锁，用于进程的互斥运行
    //灯组的构造器
    public lamp(light light1, light light2,int greenTime, boolean status, int name) {
        now=light1;
        opposite=light2;
        this.status=status;
        this.greenTime = greenTime;
        this.name = name;
        setLampStatues();
    }
    //灯组状态变化方法，用于改变状态
    public void changeStatus() {
        this.status=!(this.status);
        setLampStatues();
    }
    //设置灯组绿灯时间方法
    public void setGreenTime(int time) {
        this.greenTime=time;
    }
    //获取灯组绿灯时间方法
    public int getGreenTime() {
        return this.greenTime;
    }
    //设置灯组内两个灯的状态方法
    public void setLampStatues() {
        opposite.setLightStatus(status);
        now.setLightStatus(status);
    }
    //线程调度的run方法
    @Override
    public void run() {
        while (true) {
            synchronized (lock) {//使用synchronized实现进程间的互斥
                if (name == MainClass.panel.lightFlag) {//使用标志变量实现进程按顺序循环
                    changeStatus();
                    switch (this.name){
                        case 0:{
                            System.out.println("\n当前为南北直线通行，任意方向右转通行\n");
                            break;
                        }
                        case 1:{
                            System.out.println("\n当前为南北左转通行，任意方向右转通行\n");
                            break;
                        }
                        case 2:{
                            System.out.println("\n当前为东西直线通行，任意方向右转通行\n");
                            break;
                        }
                        case 3:{
                            System.out.println("\n当前为东西左转通行，任意方向右转通行\n");
                            break;
                        }
                    }
                    MainClass.panel.repaint();
                    try {
                        Thread.sleep(greenTime);
                    }
                    catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                    lock.notifyAll();//唤醒其他灯组进程
                    changeStatus();
                    MainClass.panel.LampChange();
                    MainClass.panel.repaint();
                    try {
                        lock.wait();
                    }
                    catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                }
                else {
                    try {
                        lock.wait();//挂起进程
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                }
            }
        }
    }
}
