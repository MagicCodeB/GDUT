package com.MagicB.www;
//��ͨ����
public class light {
    public int x;//x����
    public int y;//y����
    public boolean status;//״̬
    public String name;//����
    //�ƹ�����
    public light(int x, int y, boolean status,String name) {
        this.x=x;
        this.y=y;
        this.status=status;
        this.name=name;
    }
    //��״̬���÷���
    public void setLightStatus(boolean status){
        this.status=status;
    }
}
