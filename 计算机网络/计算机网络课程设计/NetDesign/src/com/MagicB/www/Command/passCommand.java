package com.MagicB.www.Command;

import com.MagicB.www.User.Account;
import com.MagicB.www.User.UserInfo;

import java.io.BufferedWriter;
import java.io.IOException;
//输入密码命令
public class passCommand implements BaseCommand{
    @Override
    public void Command(String password, BufferedWriter writer, UserInfo userInfo) {
        if(password.equals(Account.getPassword(userInfo.getName()))){//判断密码是否和该用户名存的密码一致
            System.out.println(password+"密码正确");
            try{
                writer.write("\n230 用户已登录\r\n");
                writer.flush();
                userInfo.setPassword(password);
            }
            catch (IOException e){
                e.printStackTrace();
            }
        }
        else{
            System.out.println(password+"密码不正确");
            try{
                writer.write("\n530 用户未登录\r\n");
                writer.flush();
            }
            catch (IOException e){
                e.printStackTrace();
            }
        }
    }
}
