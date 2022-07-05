import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.net.Socket;

public class Exp32_ClientWeiYH {
    private  int ID;
    private  String name;
    public Exp32_ClientWeiYH(int ID, String name){
        this.ID=ID;
        this.name=name;
    }
    public void start(){
        try {
            Socket socket = new Socket(InetAddress.getLocalHost(),4000);
            BufferedReader is = new BufferedReader(new InputStreamReader(socket.getInputStream()));
            PrintWriter os = new PrintWriter(socket.getOutputStream());
            BufferedReader in = new BufferedReader(new InputStreamReader(System.in));
            System.out.println("服务器已连接");
            os.println(name);
            while(true){
                String s = in.readLine();
                os.println("From "+ID+" "+name+": "+s);
                os.flush();
                System.out.println(is.readLine());
                if (s.contains("Exit")){
                    break;
                }
            }
            os.close();
            is.close();
            socket.close();
        }
        catch (Exception e){
            e.printStackTrace();
        }
    }
}
