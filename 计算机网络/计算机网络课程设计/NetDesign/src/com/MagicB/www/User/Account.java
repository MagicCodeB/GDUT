package com.MagicB.www.User;

import java.io.File;
import java.util.HashMap;
//�ʺ���
public class Account {
    static String fileName="server.xml";
    static String rootDir="D:\\Data"+ File.separator;//FTP��������ַ
    static HashMap<String,String> users= new HashMap<String,String>();

    public static void initUser(){
        File file=new File(System.getProperty("user.dir")+fileName);
        users.put("MagicB","000917");//Ԥ���û�1
        users.put("LYongNing","001212");//Ԥ���û�2
    }

    public static String getRootDir(){
        return rootDir;
    }

    public static boolean hasUser(String username){//�ж��û��Ƿ���ڵķ���
        if(users.get(username)!=null){
            return true;
        }
        else{
            return false;
        }
    }

    public static String getPassword(String username){//�����û����뷽���������ж����������Ƿ���ȷ
        return users.get(username);
    }
}
