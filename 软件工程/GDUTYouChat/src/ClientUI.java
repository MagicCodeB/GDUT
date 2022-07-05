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
    public JButton Login;//��¼��ť
    public JButton Send;//���Ͱ�ť
    public JTextField textFieldSend; //������Ϣ�ı���
    public JTextPane  nameText; //�����û�����ʾ
    public JTextPane  ipText; //����Ip��ʾ
    public JTextPane  portText; //����˿���ʾ
    public JTextField textFieldName; //�����û����ı���
    public JTextField textFieldIP; //����Ip�ı���
    public JTextField textFieldPort; //����˿��ı���
    public JTextArea textAreaShow;//�շ���Ϣչʾ��
    public Client server;//�ͻ���
    public ClientUI() {//������
        super("GDUTYouChat");
        Login = new JButton("��¼��������");
        Send = new JButton("������Ϣ");
        textFieldSend = new JTextField(20);
        textFieldIP = new JTextField(8);
        textFieldPort = new JTextField(3);
        textFieldName = new JTextField(6);
        nameText = new JTextPane();
        nameText.setText("�û���");
        nameText.setEditable(false);
        ipText = new JTextPane();
        ipText.setText("IP��ַ");
        ipText.setEditable(false);
        portText = new JTextPane();
        portText.setText("�˿ں�");
        portText.setEditable(false);
        textAreaShow = new JTextArea();
        Login.addActionListener(new ActionListener() {//��¼��ť�����¼�
            public void actionPerformed(ActionEvent e) {
                server = new Client(ClientUI.this);
            }
        });
        Send.addActionListener(new ActionListener() {//���Ͱ�ť�����¼�
            public void actionPerformed(ActionEvent e) {
                String name = textFieldName.getText();
                if (name == null || "".equals(name)) {
                    name = "�����û�";
                }
                server.sendMessage("�û� "+name + ": " + textFieldSend.getText());
                textFieldSend.setText("");
            }
        });
        this.addWindowListener(new WindowAdapter() {//�رմ��崥���¼�
            public void windowClosing(WindowEvent e) {
                int flag = JOptionPane.showConfirmDialog(null, "ȷ���˳�����?", "Warning",
                        JOptionPane.YES_NO_OPTION);
                if (flag == 1) {
                    System.exit(0);//�ر�
                }
            }
        });
        JPanel top = new JPanel(new FlowLayout());
        top.add(textFieldSend);//���÷����ı���
        top.add(Send);//���÷��Ͱ�ť
        this.add(top, BorderLayout.SOUTH);//�����ڵײ�
        JPanel northJpannel = new JPanel(new FlowLayout());
        northJpannel.add(nameText);
        northJpannel.add(textFieldName);
        northJpannel.add(ipText);
        northJpannel.add(textFieldIP);
        northJpannel.add(portText);
        northJpannel.add(textFieldPort);
        northJpannel.add(Login);
        this.add(northJpannel,BorderLayout.NORTH);//�����ڶ���
        final JScrollPane sp = new JScrollPane();
        sp.setVerticalScrollBarPolicy(JScrollPane.VERTICAL_SCROLLBAR_ALWAYS);
        sp.setViewportView(this.textAreaShow);
        this.textAreaShow.setEditable(false);
        this.add(sp, BorderLayout.CENTER);//�����м�Ϊչʾ��Ϣ��
        this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        this.setSize(800, 600);//�����С
        this.setLocation(600, 200);
        this.setVisible(true);
    }
}