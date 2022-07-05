package com.MagicB.www.Command;

import com.MagicB.www.User.Account;
import com.MagicB.www.User.UserInfo;

import java.io.*;
import java.net.Socket;
import java.util.Calendar;
//�����ļ�ָ���FTP�������������ļ�
public class getCommand implements BaseCommand{
    @Override
    public void Command(String datas, BufferedWriter writer, UserInfo userInfo) {
        File file = new File(Account.getRootDir()+File.separator+datas);
        File rootFile = new File(System.getProperty("user.home")+File.separator);
        File lastFileName = new File(System.getProperty("user.home")+File.separator+datas);
        String name = System.getProperty("user.home")+"\\"+datas;
        if (file.exists()) {
            //����ļ��Ƿ���ͬ�����ļ�
            for (String item:rootFile.list()){
                item = System.getProperty("user.home")+"\\"+item;
                //��ȡ�ļ���
                if (item.equals(name)){
                    //����ļ�������ʹ��ʱ��ķ������������ļ�
                    File temp = new File(System.getProperty("user.home")+"\\"+ Calendar.getInstance().getTimeInMillis()+"."+item.substring(item.lastIndexOf(".")+1));
                    lastFileName.renameTo(temp);
                }
            }
            try {
                writer.write("\n150 �ļ�״̬������׼������������......\r\n");
                writer.flush();
                Socket socket = new Socket("127.0.0.1", 25);
                OutputStream outputStream = socket.getOutputStream();
                FileInputStream inputStream = new FileInputStream(file);
                int length;
                byte[] buff = new byte[1024];
                while((length = inputStream.read(buff))!=-1){
                    outputStream.write(buff, 0, length);
                }
                //�ļ�������ɺ󣬹ر�������������ر�socket����
                inputStream.close();
                outputStream.close();
                socket.close();
                writer.write("\n220 �ļ����سɹ������������µ�ָ��\r\n");
                writer.flush();
            }
            catch (IOException e) {
                e.printStackTrace();
            }

        }
        else{
            try {
                writer.write("\n220 �ļ������ڣ����������µ�ָ��\r\n");
                writer.flush();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}
