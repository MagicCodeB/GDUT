package com.MagicB.www;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.*;

public class MainClass extends JFrame implements ActionListener{
    static MyPanel panel;
    JMenuBar jMenuBar;
    JMenu jMenu1,jMenu2;
    JMenuItem jMenuItem1,jMenuItem2,jMenuItem3,jMenuItem4;
    public MainClass(){
        this.setTitle("交通信号灯模拟系统");//标题
        this.setSize(420,450);//窗体大小
        this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        ((JPanel)this.getContentPane()).setOpaque(false);
        jMenuBar=new JMenuBar();
        jMenu1=new JMenu("菜单");
        jMenu2=new JMenu("设置");
        jMenuItem1=new JMenuItem("开始模拟");
        jMenuItem1.addActionListener(this);
        jMenuItem2=new JMenuItem("退出模拟");
        jMenuItem2.addActionListener(this);
        jMenuItem3=new JMenuItem("随机生成小车");
        jMenuItem3.addActionListener(this);
        jMenuItem4=new JMenuItem("更改时间设置");
        jMenuItem4.addActionListener(this);
        jMenu1.add(jMenuItem1);
        jMenu1.add(jMenuItem2);
        jMenu1.add(jMenuItem3);
        jMenu2.add(jMenuItem4);
        jMenuBar.add(jMenu1);
        jMenuBar.add(jMenu2);
        this.setJMenuBar(jMenuBar);
        this.setLocationRelativeTo(null);
        this.setResizable(false);
        this.setVisible(true);
    }
    //选择事件
    public void actionPerformed(ActionEvent e) {
        //菜单中选择开始模拟
        if(e.getSource()==jMenuItem1) {
            panel = new MyPanel();
            this.setContentPane(panel);
            this.setVisible(true);
        }
        //菜单中选择退出模拟
        else if(e.getSource()==jMenuItem2) {
            System.exit(0);
        }
        //菜单中选择生成小车
        else if(e.getSource()==jMenuItem3) {
            if(panel==null)
                JOptionPane.showMessageDialog(this, "请开始模拟再生成小车", "错误", JOptionPane.INFORMATION_MESSAGE);
            else {
                String[] directions = new String[]{
                        "S2N","S2W","E2W","E2S","N2S","N2E","W2E","W2N","S2E","E2N","N2W","W2S"
                };
                for (int i=0;i<directions.length;i++){
                    new Road(directions[i],2000);
                }
            }
        }
        //设置中选择修改设置
        else if (e.getSource() == jMenuItem4) {
            if(MainClass.panel==null)
                JOptionPane.showMessageDialog(this, "请开始模拟再进行设置", "错误", JOptionPane.INFORMATION_MESSAGE);
            else new set();
        }
    }
    //main方法，用于启动窗体
    public static void main(String[] args) {
        new MainClass();
    }
}
