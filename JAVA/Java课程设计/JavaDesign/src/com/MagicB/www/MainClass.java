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
        this.setTitle("��ͨ�źŵ�ģ��ϵͳ");//����
        this.setSize(420,450);//�����С
        this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        ((JPanel)this.getContentPane()).setOpaque(false);
        jMenuBar=new JMenuBar();
        jMenu1=new JMenu("�˵�");
        jMenu2=new JMenu("����");
        jMenuItem1=new JMenuItem("��ʼģ��");
        jMenuItem1.addActionListener(this);
        jMenuItem2=new JMenuItem("�˳�ģ��");
        jMenuItem2.addActionListener(this);
        jMenuItem3=new JMenuItem("�������С��");
        jMenuItem3.addActionListener(this);
        jMenuItem4=new JMenuItem("����ʱ������");
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
    //ѡ���¼�
    public void actionPerformed(ActionEvent e) {
        //�˵���ѡ��ʼģ��
        if(e.getSource()==jMenuItem1) {
            panel = new MyPanel();
            this.setContentPane(panel);
            this.setVisible(true);
        }
        //�˵���ѡ���˳�ģ��
        else if(e.getSource()==jMenuItem2) {
            System.exit(0);
        }
        //�˵���ѡ������С��
        else if(e.getSource()==jMenuItem3) {
            if(panel==null)
                JOptionPane.showMessageDialog(this, "�뿪ʼģ��������С��", "����", JOptionPane.INFORMATION_MESSAGE);
            else {
                String[] directions = new String[]{
                        "S2N","S2W","E2W","E2S","N2S","N2E","W2E","W2N","S2E","E2N","N2W","W2S"
                };
                for (int i=0;i<directions.length;i++){
                    new Road(directions[i],2000);
                }
            }
        }
        //������ѡ���޸�����
        else if (e.getSource() == jMenuItem4) {
            if(MainClass.panel==null)
                JOptionPane.showMessageDialog(this, "�뿪ʼģ���ٽ�������", "����", JOptionPane.INFORMATION_MESSAGE);
            else new set();
        }
    }
    //main������������������
    public static void main(String[] args) {
        new MainClass();
    }
}
