package com.MagicB.www.Command;

import com.MagicB.www.User.Account;
import com.MagicB.www.User.UserInfo;


import java.io.BufferedWriter;
import java.io.IOException;
//输入用户名，查找是否有该用户存在
public class userCommand implements BaseCommand{
    @Override
    public void Command(String username, BufferedWriter writer, UserInfo userInfo) {
        if(Account.hasUser(username)){//调用Account中的hasUser方法查找是否有该用户
            System.out.println(username+" 该用户存在");
            try{
                writer.write("\n331 用户名正确，需要密码\r\n");
                writer.flush();
                userInfo.setName(username);
            }
            catch (IOException e){
                e.printStackTrace();
            }
        }
        else{
            System.out.println("用户不存在");
            try{
                writer.write("\n502 账号不存在\r\n");
                writer.flush();
            }
            catch (IOException e){
                e.printStackTrace();
            }
        }
    }
}
