package com.MagicB.www.Command;

import com.MagicB.www.User.Account;
import com.MagicB.www.User.UserInfo;

import java.io.BufferedWriter;
import java.io.IOException;
//������������
public class passCommand implements BaseCommand{
    @Override
    public void Command(String password, BufferedWriter writer, UserInfo userInfo) {
        if(password.equals(Account.getPassword(userInfo.getName()))){//�ж������Ƿ�͸��û����������һ��
            System.out.println(password+"������ȷ");
            try{
                writer.write("\n230 �û��ѵ�¼\r\n");
                writer.flush();
                userInfo.setPassword(password);
            }
            catch (IOException e){
                e.printStackTrace();
            }
        }
        else{
            System.out.println(password+"���벻��ȷ");
            try{
                writer.write("\n530 �û�δ��¼\r\n");
                writer.flush();
            }
            catch (IOException e){
                e.printStackTrace();
            }
        }
    }
}
