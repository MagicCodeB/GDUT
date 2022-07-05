package com.MagicB.www;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

import static com.MagicB.www.MyPanel.lightList;

public class Road {
    public List<String> vehicles = new ArrayList<String>();//ÿ��·�ߵĳ�����װ��List����
    private String name=null;
    public int carTime;
    public Road(String name,int carTime) {//ÿ��·�ߵ��������������log�д�ӡ
        this.name = name;
        this.carTime=carTime;
        //ģ��������·
        ExecutorService pool = Executors.newSingleThreadExecutor();
        pool.execute(new Runnable() {
            public void run() {
                try {
                    Thread.sleep(carTime);//��ʼ��2����������ӳ���
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                for (int i = 0; i < 1000; i++) {
                    vehicles.add(Road.this.name + "_" + i);
                }
            }
        });
        //ģ��������������·��
        ScheduledExecutorService timer = Executors.newScheduledThreadPool(1);
        timer.scheduleAtFixedRate(
                new Runnable(){
                    public void run() {
                        if(vehicles.size()>0){
                            for(int i=1;i<lightList.size();i++){
                                light temp;
                                temp=lightList.get(i);
                                if(temp.name.equals(Road.this.name)){
                                    boolean lighted =temp.status;//��ȡ�Ƶ�״̬
                                    if(lighted){
                                        System.out.println("������"+vehicles.remove(0) + "  ͨ��·��");
                                    }
                                }
                            }
                        }
                    }},
                1,//�ӳ�1���ʼִ������
                1,//ÿ��һ��ִ��һ��
                TimeUnit.SECONDS);
    }
}

