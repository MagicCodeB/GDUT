package com.MagicB.www.Command;

import com.MagicB.www.File.FileInfo;
import com.MagicB.www.User.Account;
import com.MagicB.www.User.UserInfo;

import java.io.BufferedWriter;
import java.io.File;
import java.io.IOException;
//������Ŀ¼��ȫ���ļ�
public class dirCommand implements BaseCommand{
    @Override
    public void Command(String data, BufferedWriter writer, UserInfo userInfo) {
        File file=new File(Account.getRootDir());
        //���Ŀ¼��û���ļ�
        if(!file.isDirectory()){
            try{
                writer.write("\n450 �ļ�������\r\n");
                writer.flush();
            }
            catch (IOException e){
                e.printStackTrace();
            }
        }
        //����ļ����ڣ�����ļ��ַ���
        else{
            StringBuffer dirList=new StringBuffer();
            int count=1;
            for(String item: file.list()){
                File itemFile=new File(file+File.separator+item);
                String fileSize= FileInfo.getFileSize(itemFile);//�����ļ���Ϣ���еĻ�ȡ�ļ���С����
                if(fileSize.equals("")||fileSize==null){
                    fileSize="dir";
                }
                else{
                    fileSize+=" file";
                }
                dirList.append(count+"  "+item+"    "+fileSize);
                dirList.append("\r\n");
                count++;
            }
            try{
                writer.write("\n150 �ļ�״̬������׼������������......\r\n");
                writer.flush();
                writer.write(dirList+"\r\n");
                writer.write("220 ������������������µ�ָ��\r\n");
                writer.flush();
                System.out.println(dirList.toString());
            }
            catch (IOException e){
                e.printStackTrace();
            }
        }
    }
}
