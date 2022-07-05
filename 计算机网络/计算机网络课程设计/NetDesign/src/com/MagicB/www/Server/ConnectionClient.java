package com.MagicB.www.Server;

import com.MagicB.www.Command.BaseCommand;
import com.MagicB.www.Command.CommandChoice;
import com.MagicB.www.User.UserInfo;

import java.io.*;
import java.net.Socket;
//监听FTP服务器
public class ConnectionClient implements Runnable {

    private Socket socket;
    private BufferedWriter writer;
    private BufferedReader reader;

    public ConnectionClient(Socket socket) {
        this.socket = socket;
    }

    @Override
    public void run() {
        try {
            writer = new BufferedWriter(new OutputStreamWriter(socket.getOutputStream(),"GBK"));
            reader = new BufferedReader(new InputStreamReader(socket.getInputStream(),"GBK"));
            UserInfo userInfo = new UserInfo();
            userInfo.setSocket(socket);
            writer.write("220,FTP服务器已连接\r\n");
            writer.flush();
            writer.write("\n请输入你的帐号\r\n");
            writer.flush();
            while (true) {

                if (!socket.isClosed()) {
                    String result = null;
                    try {
                        result = reader.readLine();
                    } catch (Exception e) {
                        System.out.println("服务器异常关闭\r\n ");
                    }
                    System.out.println(result);
                    if (result != null && result != "") {
                        String[] data = result.split(" ");//空格区分命令
                        BaseCommand command = CommandChoice.commandChoice(data[0]);//data[0]为命令，选择对应的命令
                        if (command != null) {
                            if (data.length == 1) {
                                command.Command("", writer, userInfo);
                            } else {
                                command.Command(data[1], writer, userInfo);
                            }
                        } else {
                            writer.write("不识别的命令\r\n ");
                            writer.flush();
                        }
                    }
                    else {
                        reader.close();
                        writer.close();
                        socket.close();
                        break;
                    }

                }
                else break;
            }

        }
        catch (IOException e) {
            e.printStackTrace();
        }
    }
}
