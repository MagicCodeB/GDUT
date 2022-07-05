import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.net.Socket;
import java.util.List;

public class ServerUI extends JFrame {
    public static void main(String[] args) {
        new ServerUI();
    }
    public JButton Start;//启动服务器
    public JButton Send;//发送信息按钮
    public JTextField textFieldSend;//需要发送的文本信息
    public JTextField textFieldPort;//端口信息
    public JTextPane  portText; //输入端口提示
    public JTextArea textAreaShow;//信息展示
    public Server server;//用来监听客户端连接
    static List<Socket> clients;//保存连接到服务器的客户端
    public ServerUI() {
        super("GDUTYouChat服务器");
        Start = new JButton("启动服务器");
        Send = new JButton("发送全体信息");
        portText = new JTextPane();
        portText.setText("端口号");
        portText.setEditable(false);
        textFieldSend = new JTextField(20); //输入文字的文本框
        textFieldPort = new JTextField(8);
        textAreaShow = new JTextArea();
        Start.addActionListener(new ActionListener() {//启动服务器事件
            public void actionPerformed(ActionEvent e) {
                server = new Server(ServerUI.this);
            }
        });
        Send.addActionListener(new ActionListener() {//发送信息事件
            public void actionPerformed(ActionEvent e) {
                server.sendMsg(textFieldSend.getText());
                textFieldSend.setText("");
            }
        });
        this.addWindowListener(new WindowAdapter() {//关闭窗体事件
            public void windowClosing(WindowEvent e) {
                int flag = JOptionPane.showConfirmDialog(null, "确认关闭服务器?", "Warning",
                        JOptionPane.YES_NO_OPTION);
                if (flag == 1) {
                    server.closeServer();
                    System.exit(0);
                }
            }
        });
        JPanel top = new JPanel(new FlowLayout());
        top.add(textFieldSend);
        top.add(Send);
        top.add(Start);
        this.add(top, BorderLayout.SOUTH);
        JPanel northJpannel = new JPanel(new FlowLayout());
        northJpannel.add(portText);
        northJpannel.add(textFieldPort);
        this.add(northJpannel,BorderLayout.NORTH);//设置在顶部
        final JScrollPane sp = new JScrollPane();
        sp.setVerticalScrollBarPolicy(JScrollPane.VERTICAL_SCROLLBAR_ALWAYS);
        sp.setViewportView(this.textAreaShow);
        this.textAreaShow.setEditable(false);
        this.add(sp, BorderLayout.CENTER);
        this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        this.setSize(800, 600);
        this.setLocation(100, 200);
        this.setVisible(true);
    }
}