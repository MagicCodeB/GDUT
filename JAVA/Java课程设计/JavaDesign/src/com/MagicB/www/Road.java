package com.MagicB.www;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

import static com.MagicB.www.MyPanel.lightList;

public class Road {
    public List<String> vehicles = new ArrayList<String>();//每条路线的车辆，装入List集合
    private String name=null;
    public int carTime;
    public Road(String name,int carTime) {//每条路线的命名，方便后续log中打印
        this.name = name;
        this.carTime=carTime;
        //模拟汽车上路
        ExecutorService pool = Executors.newSingleThreadExecutor();
        pool.execute(new Runnable() {
            public void run() {
                try {
                    Thread.sleep(carTime);//初始化2秒内随机增加车辆
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                for (int i = 0; i < 1000; i++) {
                    vehicles.add(Road.this.name + "_" + i);
                }
            }
        });
        //模拟汽车汽车穿过路口
        ScheduledExecutorService timer = Executors.newScheduledThreadPool(1);
        timer.scheduleAtFixedRate(
                new Runnable(){
                    public void run() {
                        if(vehicles.size()>0){
                            for(int i=1;i<lightList.size();i++){
                                light temp;
                                temp=lightList.get(i);
                                if(temp.name.equals(Road.this.name)){
                                    boolean lighted =temp.status;//获取灯的状态
                                    if(lighted){
                                        System.out.println("车辆："+vehicles.remove(0) + "  通过路口");
                                    }
                                }
                            }
                        }
                    }},
                1,//延迟1秒后开始执行任务
                1,//每隔一秒执行一次
                TimeUnit.SECONDS);
    }
}

