import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;

public class ClientUI extends JFrame {
    public static void main(String[] args) {
        new ClientUI();
    }
    public JButton Login;//登录按钮
    public JButton Send;//发送按钮
    public JTextField textFieldSend; //输入信息文本框
    public JTextPane  nameText; //输入用户名提示
    public JTextPane  ipText; //输入Ip提示
    public JTextPane  portText; //输入端口提示
    public JTextField textFieldName; //输入用户名文本框
    public JTextField textFieldIP; //输入Ip文本框
    public JTextField textFieldPort; //输入端口文本框
    public JTextArea textAreaShow;//收发信息展示区
    public Client server;//客户端
    public ClientUI() {//构造器
        super("GDUTYouChat");
        Login = new JButton("登录至服务器");
        Send = new JButton("发送信息");
        textFieldSend = new JTextField(20);
        textFieldIP = new JTextField(8);
        textFieldPort = new JTextField(3);
        textFieldName = new JTextField(6);
        nameText = new JTextPane();
        nameText.setText("用户名");
        nameText.setEditable(false);
        ipText = new JTextPane();
        ipText.setText("IP地址");
        ipText.setEditable(false);
        portText = new JTextPane();
        portText.setText("端口号");
        portText.setEditable(false);
        textAreaShow = new JTextArea();
        Login.addActionListener(new ActionListener() {//登录按钮触发事件
            public void actionPerformed(ActionEvent e) {
                server = new Client(ClientUI.this);
            }
        });
        Send.addActionListener(new ActionListener() {//发送按钮触发事件
            public void actionPerformed(ActionEvent e) {
                String name = textFieldName.getText();
                if (name == null || "".equals(name)) {
                    name = "匿名用户";
                }
                server.sendMessage("用户 "+name + ": " + textFieldSend.getText());
                textFieldSend.setText("");
            }
        });
        this.addWindowListener(new WindowAdapter() {//关闭窗体触发事件
            public void windowClosing(WindowEvent e) {
                int flag = JOptionPane.showConfirmDialog(null, "确认退出程序?", "Warning",
                        JOptionPane.YES_NO_OPTION);
                if (flag == 1) {
                    System.exit(0);//关闭
                }
            }
        });
        JPanel top = new JPanel(new FlowLayout());
        top.add(textFieldSend);//设置发送文本框
        top.add(Send);//设置发送按钮
        this.add(top, BorderLayout.SOUTH);//设置在底部
        JPanel northJpannel = new JPanel(new FlowLayout());
        northJpannel.add(nameText);
        northJpannel.add(textFieldName);
        northJpannel.add(ipText);
        northJpannel.add(textFieldIP);
        northJpannel.add(portText);
        northJpannel.add(textFieldPort);
        northJpannel.add(Login);
        this.add(northJpannel,BorderLayout.NORTH);//设置在顶部
        final JScrollPane sp = new JScrollPane();
        sp.setVerticalScrollBarPolicy(JScrollPane.VERTICAL_SCROLLBAR_ALWAYS);
        sp.setViewportView(this.textAreaShow);
        this.textAreaShow.setEditable(false);
        this.add(sp, BorderLayout.CENTER);//设置中间为展示信息区
        this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        this.setSize(800, 600);//窗体大小
        this.setLocation(600, 200);
        this.setVisible(true);
    }
}