import sun.nio.cs.ext.GB18030;
import sun.nio.cs.ext.GBK;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.*;

public class XOR extends JFrame {
    public JButton jButton1,jButton2;
    public JLabel jLabel1,jLabel2,jLabel3;
    public JTextField jTextField1,jTextField2,jTextField3;
    public static String address1,address2,password;
    public XOR(){
        jButton1=new JButton("加密文件");
        jButton2=new JButton("解密文件");
        jLabel1=new JLabel("需要加密/解密的文件地址");
        jLabel2=new JLabel("加密/解密后文件地址");
        jLabel3=new JLabel("加密/解密文件密钥");
        jTextField1=new JTextField(20);
        jTextField2=new JTextField(20);
        jTextField3=new JTextField(20);
        this.setLayout(new GridLayout(4, 1));
        JPanel top=new JPanel(new FlowLayout());
        top.add(jLabel1);
        top.add(jTextField1);
        this.add(top, BorderLayout.NORTH);
        JPanel mid=new JPanel(new FlowLayout());
        mid.add(jLabel2);
        mid.add(jTextField2);
        this.add(mid,BorderLayout.CENTER);//设置在顶部
        JPanel down=new JPanel(new FlowLayout());
        down.add(jLabel3);
        down.add(jTextField3);
        down.add(jButton1);
        down.add(jButton2);
        this.add(down, BorderLayout.SOUTH);
        jButton1.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                address1=jTextField1.getText();
                address2=jTextField2.getText();
                password=jTextField3.getText();
                File file = new File(address1);
                InputStream is = null;
                try {
                    is = new FileInputStream(file);
                } catch (FileNotFoundException fileNotFoundException) {
                    fileNotFoundException.printStackTrace();
                }
                try {
                    writeToLocal(address2, is,password);
                } catch (IOException ioException) {
                    ioException.printStackTrace();
                }
            }
        });
        jButton2.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                address1=jTextField1.getText();
                address2=jTextField2.getText();
                password=jTextField3.getText();
                File file = new File(address1);
                InputStream is = null;
                try {
                    is = new FileInputStream(file);
                } catch (FileNotFoundException fileNotFoundException) {
                    fileNotFoundException.printStackTrace();
                }
                try {
                    writeToLocal(address2, is,password);
                } catch (IOException ioException) {
                    ioException.printStackTrace();
                }
            }
        });
        setTitle("异或运算加密软件");
        setSize(300,400);
        setLocationRelativeTo(null);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    }
    public static void main(String[] args){
        XOR xor=new XOR();
        xor.setVisible(true);
    }
    private static void writeToLocal(String destination, InputStream input,String code)
            throws IOException {
        int index;
        byte[] bytes = new byte[1024];
        byte[] bytes2 = new byte[1024];
        byte[] bytes3=code.getBytes();
        byte[] bytes4= new byte[1024];
        for(int k=0;k<bytes4.length;k+=bytes3.length){
            bytes4[k]=bytes3[0];
            bytes4[k+1]=bytes3[1];
            bytes4[k+2]=bytes3[2];
            bytes4[k+3]=bytes3[3];
        }
        FileOutputStream downloadFile = new FileOutputStream(destination);
        while ((index = input.read(bytes)) != -1) {
            for (int i = 0; i < index; i++) {
                bytes2[i] = (byte) (bytes[i] ^ bytes4[i]);
            }
            downloadFile.write(bytes2, 0, index);
            downloadFile.flush();
        }
        downloadFile.close();
    }
}