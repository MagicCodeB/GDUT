package com.MagicB.www.Server;

import com.MagicB.www.Command.BaseCommand;
import com.MagicB.www.Command.CommandChoice;
import com.MagicB.www.User.UserInfo;

import java.io.*;
import java.net.Socket;
//����FTP������
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
            writer.write("220,FTP������������\r\n");
            writer.flush();
            writer.write("\n����������ʺ�\r\n");
            writer.flush();
            while (true) {

                if (!socket.isClosed()) {
                    String result = null;
                    try {
                        result = reader.readLine();
                    } catch (Exception e) {
                        System.out.println("�������쳣�ر�\r\n ");
                    }
                    System.out.println(result);
                    if (result != null && result != "") {
                        String[] data = result.split(" ");//�ո���������
                        BaseCommand command = CommandChoice.commandChoice(data[0]);//data[0]Ϊ���ѡ���Ӧ������
                        if (command != null) {
                            if (data.length == 1) {
                                command.Command("", writer, userInfo);
                            } else {
                                command.Command(data[1], writer, userInfo);
                            }
                        } else {
                            writer.write("��ʶ�������\r\n ");
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
