import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;

public class Client extends Thread {
    ClientUI UI;
    Socket client;
    BufferedReader bufferedReader;//����
    PrintWriter printWriter;//���
    public Client(ClientUI UI) {
        this.UI = UI;
        try {
            String ip = UI.textFieldIP.getText(); //��ȡ�����Ip��ַ
            int port = Integer.parseInt(UI.textFieldPort.getText()); //��ȡ����Ķ˿ں�
            client = new Socket(ip, port);//���ÿͻ������ӷ���˵�Ip�Ͷ˿�
            println("���ӷ������ɹ�");
            bufferedReader = new BufferedReader(new InputStreamReader(client.getInputStream()));
            printWriter = new PrintWriter(client.getOutputStream(), true);
            String name = UI.textFieldName.getText();//�û�����Ϣ
            if (name == null || "".equals(name)) {//���û���Ϊ�գ�����Ϊ�����û�
                name = "�����û�";
            }
            sendMessage("��ӭ: " + name + "����GDUTYouChat");
        }
        catch (NumberFormatException nu) {
            println("���ӷ�����ʧ�ܣ���������ȷ�Ķ˿ں�");
            nu.printStackTrace();
        }
        catch (IOException e) {
            println("���ӷ�����ʧ�ܣ���������ȷ��IP��ַ��˿ںŸ�ʽ");
            println(e.toString());
            e.printStackTrace();
        }
        this.start();//�����ͻ���
    }
    public void run() {
        String message = "";
        while (true) {
            try {
                message = bufferedReader.readLine();
            }
            catch (IOException e) {//���������ر�
                println("�������Ͽ�����,����ϵ����������");
                break;
            }
            if (message != null && message.trim() != "") {
                println(message);
            }
        }
    }
    public void sendMessage(String msg) {//������Ϣ����
        try {
            printWriter.println(msg);
        }
        catch (Exception e) {
            println(e.toString());
        }
    }
    public void println(String s) {//��ӡ������Ϣ
        if (s != null) {
            this.UI.textAreaShow.setText(this.UI.textAreaShow.getText() + s + "\n");
            System.out.println(s + "\n");
        }
    }
}