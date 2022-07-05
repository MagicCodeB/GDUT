import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;

public class ConnectClient extends Thread{
    BufferedReader bufferedReader;
    PrintWriter printWriter;
    ServerUI UI;
    Socket client;
    public ConnectClient(ServerUI UI, Socket client) {
        this.UI = UI;
        this.client=client;
        this.start();
    }
    @Override
    public void run() {//为每一个客户端创建线程等待接收信息，然后把信息广播出去
        String messsage = "";
        while (true) {
            try {
                bufferedReader = new BufferedReader(new InputStreamReader(client.getInputStream()));
                printWriter = new PrintWriter(client.getOutputStream(), true);
                messsage = bufferedReader.readLine();
                sendMessage(messsage);
            } catch (IOException e) {
                println(e.toString());
                break;
            }
            if (messsage != null && messsage.trim() != "") {
                println("客户端: " + messsage);
            }
        }
    }
    public synchronized void sendMessage(String msg) {//把信息广播到所有用户
        try {
            for (int i = 0; i < UI.clients.size(); i++) {
                Socket client = UI.clients.get(i);
                printWriter = new PrintWriter(client.getOutputStream(), true);
                printWriter.println(msg);
            }

        } catch (Exception e) {
            println(e.toString());
        }
    }
    public void println(String s) {
        if (s != null) {
            this.UI.textAreaShow.setText(this.UI.textAreaShow.getText() + s + "\n");
            System.out.println(s + "\n");
        }
    }
}