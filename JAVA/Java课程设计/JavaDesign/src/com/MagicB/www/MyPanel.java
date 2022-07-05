package com.MagicB.www;

import java.awt.Color;
import java.awt.Graphics;
import java.util.ArrayList;

import javax.swing.JPanel;

public class MyPanel extends JPanel {
    public light S2W,S2N,S2E,E2N,E2W,E2S,N2W,N2S,N2E,W2N,W2E,W2S;//ʮ������
    public lamp lamp1,lamp2,lamp3,lamp4;//�����źŵ�(������ת����İ˸�������һ��)
    public static int lightFlag;//ʵ�ֽ���ѭ���ı�־����
    public static  ArrayList<light> lightList= new ArrayList<light>();//ʹ��lightList�������ÿ����
    public MyPanel() {
        lightFlag = 0 ;//���ñ�־����Ϊ0
        //����ʹ��addList����������12����ͨ�ƵĶ���
        S2W=addList(S2W, 204, 304, false,"S2W");
        S2N=addList(S2N, 234, 304, false,"S2N");
        S2E=addList(S2E, 264, 304, true,"S2E");
        E2N=addList(E2N, 304, 110, true,"E2N");
        E2W=addList(E2W, 304, 140, false,"E2W");
        E2S=addList(E2S, 304, 170, false,"E2S");
        N2W=addList(N2W,110 , 70, true,"N2W");
        N2S=addList(N2S, 140, 70, false,"N2S");
        N2E=addList(N2E, 170, 70, false,"N2E");
        W2N=addList(W2N, 70, 204, false,"W2N");
        W2E=addList(W2E, 70, 234, false,"W2E");
        W2S=addList(W2S, 70, 264, true,"W2S");
        lamp1=new lamp(N2S,S2N,2000,false,0);
        lamp2=new lamp(N2E,S2W,2000,false,1);
        lamp3=new lamp(W2E,E2W,2000,false,2);
        lamp4=new lamp(W2N,E2S,2000,false,3);
        //�����������Ƶ��߳�
        Thread t1=new Thread(lamp1);
        Thread t2=new Thread(lamp2);
        Thread t3=new Thread(lamp3);
        Thread t4=new Thread(lamp4);
        t1.start();
        t2.start();
        t3.start();
        t4.start();
    }
    //addList���������ڹ��콻ͨ�ƶ��󣬲����뵽�������
    public light addList(light a,int x,int y,boolean sta,String name) {
        a=new light(x,y,sta,name);
        lightList.add(a);
        return a;
    }
    //�ı��־lightFlag����
    public void LampChange() {
        lightFlag=(lightFlag+1)%4;//ѭ�������̵߳ı�־����
    }
    //JFrame���е�paint���������ڻ���ͼ�λ�����
    public void paint(Graphics g) {
        super.paint(g);
        //��·��Ե��
        g.setColor(Color.darkGray);
        g.fillRect(0, 94, 416, 6);
        g.fillRect(0, 294, 416, 6);
        g.fillRect(94, 0, 6, 400);
        g.fillRect(294, 0, 6, 400);
        //·��
        g.setColor(Color.gray);
        g.fillRect(0,100,416,194);
        g.fillRect(100, 0, 194, 416);
        //·�����ʵ��
        g.setColor(Color.darkGray);
        g.fillRect(0, 194, 60, 6);
        g.fillRect(334, 194, 100, 6);
        g.fillRect(194,0,6,60);
        g.fillRect(194,334,6,60);
        g.setColor(Color.white);
        //��ɫ������
        g.fillRect(0,142,50,10);
        g.fillRect(346,142,70,10);
        g.fillRect(0,244,50,10);
        g.fillRect(346,244,70,10);
        g.fillRect(142,346, 10, 50);
        g.fillRect(142,0, 10, 50);
        g.fillRect(242,0, 10, 50);
        g.fillRect(242,346, 10, 50);
        //���е�����
        g.fillRect(60,104,40,6);
        g.fillRect(60,124,40,6);
        g.fillRect(60,144,40,6);
        g.fillRect(60,164,40,6);
        g.fillRect(60,184,40,6);
        g.fillRect(294,204, 40, 6);
        g.fillRect(294,224, 40, 6);
        g.fillRect(294,244, 40, 6);
        g.fillRect(294,264, 40, 6);
        g.fillRect(294,284, 40, 6);
        g.fillRect(204,60, 6, 40);
        g.fillRect(224,60, 6, 40);
        g.fillRect(244,60, 6, 40);
        g.fillRect(264,60, 6, 40);
        g.fillRect(284,60, 6, 40);
        g.fillRect(104,294, 6, 40);
        g.fillRect(124,294, 6, 40);
        g.fillRect(144,294, 6, 40);
        g.fillRect(164,294, 6, 40);
        g.fillRect(184,294, 6, 40);
        //�źŵƺ�ɫ����
        g.setColor(Color.black);
        g.fillRect(194,294, 100, 40);
        g.fillRect(294,100, 40, 100);
        g.fillRect(100,60, 100, 40);
        g.fillRect(60,194,40, 100);
        light tempLight;
        //�������н�ͨ�ƣ�������״̬������Ӧ����ɫ
        for(int i=0;i<lightList.size();i++) {
            tempLight=lightList.get(i);
            if(tempLight.status) g.setColor(Color.green);
            else g.setColor(Color.RED);
            g.fillOval(tempLight.x, tempLight.y, 20, 20);
        }
    }
}