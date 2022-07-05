package com.MagicB.www.User;

import java.net.Socket;
//用户类
public class UserInfo {
    private String name;//名字
    private String password;//密码
    private Socket  socket;//socket服务器

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
