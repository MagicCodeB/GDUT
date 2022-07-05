package com.MagicB.www;

import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JTextField;
//设置界面
public class set extends JFrame implements ActionListener {
    JLabel lab1,lab2,lab3,lab4,lab5;
    JTextField jText1,jText2,jText3,jText4,jText5;
    JButton jButton1,jButton2;
    int time1,time2,time3,time4,time5;
    public set(){
        lab1=new JLabel("南北直线绿灯时间：");
        lab2=new JLabel("南北左转绿灯时间：");
        lab3=new JLabel("东西直线绿灯时间：");
        lab4=new JLabel("东西左转绿灯时间：");
        lab5=new JLabel("生成小车速度大小：");
        time1=MainClass.panel.lamp1.getGreenTime();
        time2=MainClass.panel.lamp2.getGreenTime();
        time3=MainClass.panel.lamp3.getGreenTime();
        time4=MainClass.panel.lamp4.getGreenTime();
        time5=2000;
        jText1=new JTextField(String.valueOf(time1));
        jText2=new JTextField(String.valueOf(time2));
        jText3=new JTextField(String.valueOf(time3));
        jText4=new JTextField(String.valueOf(time4));
        jText5=new JTextField(String.valueOf(time5));
        jButton1=new JButton("确定");
        jButton1.addActionListener(this);
        jButton2=new JButton("取消");
        jButton2.addActionListener(this);
        this.setLayout(new GridLayout(6,2,10,5));
        this.add(lab1);
        this.add(jText1);
        this.add(lab2);
        this.add(jText2);
        this.add(lab3);
        this.add(jText3);
        this.add(lab4);
        this.add(jText4);
        this.add(lab5);
        this.add(jText5);
        this.add(jButton1);
        this.add(jButton2);
        this.setLocationRelativeTo(null);
        this.setSize(250, 300);
        this.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        this.setResizable(false);
        this.setVisible(true);
    }
    //选择事件
    public void actionPerformed(ActionEvent e) {
        if(e.getSource()==jButton1) {
            if(jText1.getText().length()==0||jText2.getText().length()==0||jText3.getText().length()==0||jText4.getText().length()==0||jText5.getText().length()==0)
                JOptionPane.showMessageDialog(this, "输入错误，请重新输入！", "错误", JOptionPane.INFORMATION_MESSAGE);
            else {
                MainClass.panel.lamp1.setGreenTime(Integer.parseInt(jText1.getText()));
                MainClass.panel.lamp2.setGreenTime(Integer.parseInt(jText2.getText()));
                MainClass.panel.lamp3.setGreenTime(Integer.parseInt(jText3.getText()));
                MainClass.panel.lamp4.setGreenTime(Integer.parseInt(jText4.getText()));
                String[] directions = new String[]{
                        "S2N","S2W","E2W","E2S","N2S","N2E","W2E","W2N","S2E","E2N","N2W","W2S"
                };
                for (int i=0;i<directions.length;i++){
                    new Road(directions[i],Integer.parseInt(jText5.getText()));
                }
                this.dispose();
            }
        }
        else if(e.getSource()==jButton2){
            this.dispose();
        }
    }
}