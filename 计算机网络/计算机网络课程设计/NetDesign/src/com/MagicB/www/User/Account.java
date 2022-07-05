package com.MagicB.www.User;

import java.io.File;
import java.util.HashMap;
//帐号类
public class Account {
    static String fileName="server.xml";
    static String rootDir="D:\\Data"+ File.separator;//FTP服务器地址
    static HashMap<String,String> users= new HashMap<String,String>();

    public static void initUser(){
        File file=new File(System.getProperty("user.dir")+fileName);
        users.put("MagicB","000917");//预留用户1
        users.put("LYongNing","001212");//预留用户2
    }

    public static String getRootDir(){
        return rootDir;
    }

    public static boolean hasUser(String username){//判断用户是否存在的方法
        if(users.get(username)!=null){
            return true;
        }
        else{
            return false;
        }
    }

    public static String getPassword(String username){//返回用户密码方法，用于判断输入密码是否正确
        return users.get(username);
    }
}
