package com.MagicB.www.Command;

import com.MagicB.www.File.FileInfo;
import com.MagicB.www.User.Account;
import com.MagicB.www.User.UserInfo;

import java.io.BufferedWriter;
import java.io.File;
import java.io.IOException;
//服务器目录下全部文件
public class dirCommand implements BaseCommand{
    @Override
    public void Command(String data, BufferedWriter writer, UserInfo userInfo) {
        File file=new File(Account.getRootDir());
        //如果目录下没有文件
        if(!file.isDirectory()){
            try{
                writer.write("\n450 文件不存在\r\n");
                writer.flush();
            }
            catch (IOException e){
                e.printStackTrace();
            }
        }
        //如果文件存在，输出文件字符串
        else{
            StringBuffer dirList=new StringBuffer();
            int count=1;
            for(String item: file.list()){
                File itemFile=new File(file+File.separator+item);
                String fileSize= FileInfo.getFileSize(itemFile);//调用文件信息类中的获取文件大小方法
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
                writer.write("\n150 文件状态正常，准备打开数据连接......\r\n");
                writer.flush();
                writer.write(dirList+"\r\n");
                writer.write("220 服务就绪，可以请求新的指令\r\n");
                writer.flush();
                System.out.println(dirList.toString());
            }
            catch (IOException e){
                e.printStackTrace();
            }
        }
    }
}
