package com.MagicB.www.Command;

import com.MagicB.www.User.Account;
import com.MagicB.www.User.UserInfo;


import java.io.BufferedWriter;
import java.io.IOException;
//�����û����������Ƿ��и��û�����
public class userCommand implements BaseCommand{
    @Override
    public void Command(String username, BufferedWriter writer, UserInfo userInfo) {
        if(Account.hasUser(username)){//����Account�е�hasUser���������Ƿ��и��û�
            System.out.println(username+" ���û�����");
            try{
                writer.write("\n331 �û�����ȷ����Ҫ����\r\n");
                writer.flush();
                userInfo.setName(username);
            }
            catch (IOException e){
                e.printStackTrace();
            }
        }
        else{
            System.out.println("�û�������");
            try{
                writer.write("\n502 �˺Ų�����\r\n");
                writer.flush();
            }
            catch (IOException e){
                e.printStackTrace();
            }
        }
    }
}
