package com.MagicB.www.Command;

import com.MagicB.www.User.Account;
import com.MagicB.www.User.UserInfo;

import java.io.*;
import java.net.Socket;
import java.util.Calendar;
//下载文件指令，从FTP服务器中下载文件
public class getCommand implements BaseCommand{
    @Override
    public void Command(String datas, BufferedWriter writer, UserInfo userInfo) {
        File file = new File(Account.getRootDir()+File.separator+datas);
        File rootFile = new File(System.getProperty("user.home")+File.separator);
        File lastFileName = new File(System.getProperty("user.home")+File.separator+datas);
        String name = System.getProperty("user.home")+"\\"+datas;
        if (file.exists()) {
            //检测文件是否有同名的文件
            for (String item:rootFile.list()){
                item = System.getProperty("user.home")+"\\"+item;
                //获取文件名
                if (item.equals(name)){
                    //如果文件重名，使用时间的方法来重命名文件
                    File temp = new File(System.getProperty("user.home")+"\\"+ Calendar.getInstance().getTimeInMillis()+"."+item.substring(item.lastIndexOf(".")+1));
                    lastFileName.renameTo(temp);
                }
            }
            try {
                writer.write("\n150 文件状态正常，准备打开数据连接......\r\n");
                writer.flush();
                Socket socket = new Socket("127.0.0.1", 25);
                OutputStream outputStream = socket.getOutputStream();
                FileInputStream inputStream = new FileInputStream(file);
                int length;
                byte[] buff = new byte[1024];
                while((length = inputStream.read(buff))!=-1){
                    outputStream.write(buff, 0, length);
                }
                //文件传输完成后，关闭输入输出流，关闭socket服务
                inputStream.close();
                outputStream.close();
                socket.close();
                writer.write("\n220 文件下载成功，可以请求新的指令\r\n");
                writer.flush();
            }
            catch (IOException e) {
                e.printStackTrace();
            }

        }
        else{
            try {
                writer.write("\n220 文件不存在，可以请求新的指令\r\n");
                writer.flush();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}
