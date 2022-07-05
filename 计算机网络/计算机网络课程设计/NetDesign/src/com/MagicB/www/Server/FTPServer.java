package com.MagicB.www.Server;

import com.MagicB.www.Thread.ThreadInfo;
import com.MagicB.www.User.Account;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;

public class FTPServer {
    private ServerSocket serverSocket;
    private FTPServer(int port){
        try{
            serverSocket=new ServerSocket(port);
            System.out.println(serverSocket);
        }
        catch (IOException e){
            e.printStackTrace();
        }
        Account.initUser();
    }
    private  void listenServer(){
        try{
            while(true){
                Socket socket=serverSocket.accept();
                ConnectionClient connectionClient=new ConnectionClient(socket);
                ThreadInfo.getThreadPool().execute(connectionClient);
            }
        }
        catch (IOException e){
            e.printStackTrace();
        }
    }
    public static void main(String[] args) {
        JFrame window=new JFrame("MagicB的FTP服务器");
        window.setLocationRelativeTo(null);
        window.setSize(700,700);
        window.setVisible(true);
        JButton start=new JButton("启动FTP服务器");
        start.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                FTPServer ftpServer=new FTPServer(25);//启动FTP服务器
                ftpServer.listenServer();
            }
        });
        JPanel top = new JPanel(new FlowLayout());
        top.add(start);
        window.add(top, BorderLayout.SOUTH);
        window.setLocation(100, 200);
        window.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        JLabel logoLabel=new JLabel(new ImageIcon("welcome.jpg"));
        logoLabel.setBounds(40,10,600,600);
        window.add(logoLabel);
    }
}



