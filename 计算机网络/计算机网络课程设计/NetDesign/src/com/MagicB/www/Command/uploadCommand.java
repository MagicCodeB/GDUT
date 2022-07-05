package com.MagicB.www.Command;

import com.MagicB.www.User.Account;
import com.MagicB.www.User.UserInfo;

import java.io.*;
import java.net.Socket;
import java.util.Calendar;

public class uploadCommand implements BaseCommand{
    @Override
    public void Command(String data, BufferedWriter writer, UserInfo userInfo) {
        File file=new File(Account.getRootDir());
        try{
            writer.write("\n150 �ļ�״̬������׼������������......\r\n");
            writer.flush();
            File lastFileName=new File(Account.getRootDir()+"\\"+data);
            String name=Account.getRootDir()+data;
            for(String item: file.list()){
                item=Account.getRootDir()+item;
                if(item.equals(name)){
                    File tempName=new File(Account.getRootDir()+ Calendar.getInstance().getTimeInMillis()+"."+item.substring(item.lastIndexOf(".")+1));
                    lastFileName.renameTo(tempName);
                    System.out.println(lastFileName);
                }

            }
            RandomAccessFile uploadFile=new RandomAccessFile(lastFileName,"rw");
            Socket tempSocket=new Socket("127.0.0.1",25);
            InputStream uploadSocket=tempSocket.getInputStream();
            byte []Buffer=new byte[1024];
            int length;
            if((length=uploadSocket.read(Buffer))!=-1){//����
                uploadFile.write(Buffer,0,length);
            }
            System.out.println("�ļ�����ɹ�");
            uploadFile.close();
            uploadSocket.close();
            tempSocket.close();
            writer.write("\n226 �ر��������ӣ��ļ������ɹ�\r\n");
            writer.flush();
        }
        catch (IOException e){
            e.printStackTrace();
        }
    }
}
