import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.ArrayList;

public class Server extends Thread{
    ServerUI UI;
    ServerSocket serverSocket;
    BufferedReader bufferedReader;
    PrintWriter printWriter;
    int Port;
    public Server(ServerUI UI) {
        this.UI = UI;
        this.start();
        Port=Integer.parseInt(UI.textFieldPort.getText());
    }
    @Override
    public void run() {
        try {
            serverSocket = new ServerSocket(Port);
            UI.clients=new ArrayList<>();
            println("�����������ɹ�,�������˿ں�Ϊ:"+Port);
            while (true) {
                println("�ȴ��û�����");
                Socket client = serverSocket.accept();
                UI.clients.add(client);
                println("�û����ӳɹ�");
                new ConnectClient(UI, client);
            }
        }
        catch (IOException e) {
            println("����������ʧ��");
            println(e.toString());
            e.printStackTrace();
        }
    }
    public synchronized void sendMsg(String msg) {
        try {
            for (int i = 0; i < UI.clients.size(); i++) {
                Socket client = UI.clients.get(i);
                printWriter = new PrintWriter(client.getOutputStream(), true);
                printWriter.println(msg);
            }
        }
        catch (Exception e) {
            println(e.toString());
        }
    }
    public void println(String s) {
        if (s != null) {
            s = "�����: " + s;
            this.UI.textAreaShow.setText(this.UI.textAreaShow.getText() + s + "\n");
            System.out.println(s + "\n");
        }
    }
    public void closeServer() {
        try {
            if (serverSocket != null)
                serverSocket.close();
            if (bufferedReader != null)
                bufferedReader.close();
            if (printWriter != null)
                printWriter.close();
        }
        catch (IOException e) {
            e.printStackTrace();
        }
    }
}