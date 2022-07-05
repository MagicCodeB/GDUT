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
    public JButton Start;//����������
    public JButton Send;//������Ϣ��ť
    public JTextField textFieldSend;//��Ҫ���͵��ı���Ϣ
    public JTextField textFieldPort;//�˿���Ϣ
    public JTextPane  portText; //����˿���ʾ
    public JTextArea textAreaShow;//��Ϣչʾ
    public Server server;//���������ͻ�������
    static List<Socket> clients;//�������ӵ��������Ŀͻ���
    public ServerUI() {
        super("GDUTYouChat������");
        Start = new JButton("����������");
        Send = new JButton("����ȫ����Ϣ");
        portText = new JTextPane();
        portText.setText("�˿ں�");
        portText.setEditable(false);
        textFieldSend = new JTextField(20); //�������ֵ��ı���
        textFieldPort = new JTextField(8);
        textAreaShow = new JTextArea();
        Start.addActionListener(new ActionListener() {//�����������¼�
            public void actionPerformed(ActionEvent e) {
                server = new Server(ServerUI.this);
            }
        });
        Send.addActionListener(new ActionListener() {//������Ϣ�¼�
            public void actionPerformed(ActionEvent e) {
                server.sendMsg(textFieldSend.getText());
                textFieldSend.setText("");
            }
        });
        this.addWindowListener(new WindowAdapter() {//�رմ����¼�
            public void windowClosing(WindowEvent e) {
                int flag = JOptionPane.showConfirmDialog(null, "ȷ�Ϲرշ�����?", "Warning",
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
        this.add(northJpannel,BorderLayout.NORTH);//�����ڶ���
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