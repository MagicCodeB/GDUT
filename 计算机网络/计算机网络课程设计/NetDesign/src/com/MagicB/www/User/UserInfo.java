package com.MagicB.www.User;

import java.net.Socket;
//�û���
public class UserInfo {
    private String name;//����
    private String password;//����
    private Socket  socket;//socket������

    public void setPassword(String password){
        this.password=password;
    }

    public void setName(String name){
        this.name=name;
    }

    public String getName(){
        return name;
    }

    public void setSocket(Socket socket){
        this.socket=socket;
    }
}
