import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

public class Exp32_ServerWeiYH {
    public static void main(String[] args) {
        try {
            ServerSocket server = new ServerSocket(4000);
            System.out.println("服务器连接中...");
            Socket socket = server.accept();
            System.out.println("服务器连接成功");
            BufferedReader is = new BufferedReader(new InputStreamReader(socket.getInputStream()));
            PrintWriter os = new PrintWriter(socket.getOutputStream());
            String name = is.readLine();
            while(true){
                String s = is.readLine();
                System.out.println(s);
                if(s.contains("Exit")){
                    String feedback = "Bye";
                    os.println("To "+name+": "+feedback);
                    os.flush();
                    break;
                }
                else if(s.contains("what time is it")){
                    LocalTime time = LocalTime.now();
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm:ss");
                    os.println("To "+name+": "+time.format(formatter));
                    os.flush();
                }
                else{
                    String feedback = "输入Exit与服务器断开连接或者输入what time is it查看当前时间";
                    os.println("To "+name+": "+feedback);
                    os.flush();
                }
            }
            os.close();
            is.close();
            socket.close();
            server.close();
        }
        catch(Exception e){
            e.printStackTrace();
        }
    }
}
