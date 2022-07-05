package com.MagicB.www;
//交通灯类
public class light {
    public int x;//x坐标
    public int y;//y坐标
    public boolean status;//状态
    public String name;//名字
    //灯构造器
    public light(int x, int y, boolean status,String name) {
        this.x=x;
        this.y=y;
        this.status=status;
        this.name=name;
    }
    //灯状态设置方法
    public void setLightStatus(boolean status){
        this.status=status;
    }
}
