package com.MagicB.www;

public class lamp implements Runnable {
    public light opposite, now;//�໥ƥ��������ƣ���Ϊֱ��ƥ�����תƥ��
    public int greenTime;//�̵�����ʱ��
    public int name;//���飬�����̵߳���
    public boolean status;//״̬�����Ƿ�����
    public static final Object lock = new Object();//�������ڽ��̵Ļ�������
    //����Ĺ�����
    public lamp(light light1, light light2,int greenTime, boolean status, int name) {
        now=light1;
        opposite=light2;
        this.status=status;
        this.greenTime = greenTime;
        this.name = name;
        setLampStatues();
    }
    //����״̬�仯���������ڸı�״̬
    public void changeStatus() {
        this.status=!(this.status);
        setLampStatues();
    }
    //���õ����̵�ʱ�䷽��
    public void setGreenTime(int time) {
        this.greenTime=time;
    }
    //��ȡ�����̵�ʱ�䷽��
    public int getGreenTime() {
        return this.greenTime;
    }
    //���õ����������Ƶ�״̬����
    public void setLampStatues() {
        opposite.setLightStatus(status);
        now.setLightStatus(status);
    }
    //�̵߳��ȵ�run����
    @Override
    public void run() {
        while (true) {
            synchronized (lock) {//ʹ��synchronizedʵ�ֽ��̼�Ļ���
                if (name == MainClass.panel.lightFlag) {//ʹ�ñ�־����ʵ�ֽ��̰�˳��ѭ��
                    changeStatus();
                    switch (this.name){
                        case 0:{
                            System.out.println("\n��ǰΪ�ϱ�ֱ��ͨ�У����ⷽ����תͨ��\n");
                            break;
                        }
                        case 1:{
                            System.out.println("\n��ǰΪ�ϱ���תͨ�У����ⷽ����תͨ��\n");
                            break;
                        }
                        case 2:{
                            System.out.println("\n��ǰΪ����ֱ��ͨ�У����ⷽ����תͨ��\n");
                            break;
                        }
                        case 3:{
                            System.out.println("\n��ǰΪ������תͨ�У����ⷽ����תͨ��\n");
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
                    lock.notifyAll();//���������������
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
                        lock.wait();//�������
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                }
            }
        }
    }
}
