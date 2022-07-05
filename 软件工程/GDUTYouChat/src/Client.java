import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;

public class Client extends Thread {
    ClientUI UI;
    Socket client;
    BufferedReader bufferedReader;//输入
    PrintWriter printWriter;//输出
    public Client(ClientUI UI) {
        this.UI = UI;
        try {
            String ip = UI.textFieldIP.getText(); //获取输入的Ip地址
            int port = Integer.parseInt(UI.textFieldPort.getText()); //获取输入的端口号
            client = new Socket(ip, port);//设置客户端连接服务端的Ip和端口
            println("连接服务器成功");
            bufferedReader = new BufferedReader(new InputStreamReader(client.getInputStream()));
            printWriter = new PrintWriter(client.getOutputStream(), true);
            String name = UI.textFieldName.getText();//用户名信息
            if (name == null || "".equals(name)) {//若用户名为空，则标记为匿名用户
                name = "匿名用户";
            }
            sendMessage("欢迎: " + name + "进入GDUTYouChat");
        }
        catch (NumberFormatException nu) {
            println("连接服务器失败，请输入正确的端口号");
            nu.printStackTrace();
        }
        catch (IOException e) {
            println("连接服务器失败，请输入正确的IP地址与端口号格式");
            println(e.toString());
            e.printStackTrace();
        }
        this.start();//启动客户端
    }
    public void run() {
        String message = "";
        while (true) {
            try {
                message = bufferedReader.readLine();
            }
            catch (IOException e) {//检测服务器关闭
                println("服务器断开连接,请联系服务器管理");
                break;
            }
            if (message != null && message.trim() != "") {
                println(message);
            }
        }
    }
    public void sendMessage(String msg) {//发送信息方法
        try {
            printWriter.println(msg);
        }
        catch (Exception e) {
            println(e.toString());
        }
    }
    public void println(String s) {//打印发送信息
        if (s != null) {
            this.UI.textAreaShow.setText(this.UI.textAreaShow.getText() + s + "\n");
            System.out.println(s + "\n");
        }
    }
}