package view;

import java.awt.Color;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.*;
import javax.swing.GroupLayout.Alignment;
import javax.swing.LayoutStyle.ComponentPlacement;
import javax.swing.border.EmptyBorder;

import controller.Controller;
import dao.User;
import util.DbUtil;
import util.StringUtil;

@SuppressWarnings("serial")

public class LoginFrame extends JFrame {
    public static final DbUtil dbUtil = new DbUtil();
    public static User currentUser = new User();
    private Controller controller;
    private JPanel contentPane;
    private JTextField usernameInput;
    private JPasswordField passwordField;
    public LoginFrame(Controller controller) {
        setResizable(false);
        this.controller = controller;
        init();
        setLocationRelativeTo(null);
        setVisible(true);
    }
    private void init(){
        final LoginFrame thisFrame = this;
        setTitle("职员管理系统");
        JLabel loginTitle = new JLabel("职员管理系统");
        loginTitle.setForeground(Color.BLUE);
        //loginTitle.setFont(new Font("Microsoft YaHei UI", Font.PLAIN, 32));
        loginTitle.setHorizontalAlignment(SwingConstants.CENTER);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setBounds(100, 100, 493, 335);
        contentPane = new JPanel();
        contentPane.setBackground(new Color(201,201,201));
        contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
        setContentPane(contentPane);
        JLabel passwordLabel = new JLabel("密码");
        JLabel usernameLabel = new JLabel("用户名");
        usernameLabel.setForeground(new Color(0, 0, 0));
        usernameLabel.setVerticalAlignment(SwingConstants.TOP);
        JButton confirmBtn = new JButton("确认");
        JButton resetBtn = new JButton("重置");
        passwordField = new JPasswordField();
        usernameInput = new JTextField();
        usernameInput.setColumns(10);
        final JRadioButton admin = new JRadioButton("管理员");
        JRadioButton user = new JRadioButton("职员");
        admin.setBackground(new Color(201,201,201));
        user.setBackground(new Color(201,201,201));
        user.setSelected(true);
        GroupLayout gl_contentPane = new GroupLayout(contentPane);
        gl_contentPane.setHorizontalGroup(
                gl_contentPane.createParallelGroup(Alignment.TRAILING)
                        .addGroup(gl_contentPane.createSequentialGroup()
                                .addGroup(gl_contentPane.createParallelGroup(Alignment.LEADING)
                                        .addGroup(gl_contentPane.createSequentialGroup()
                                                .addGap(171)
                                                .addComponent(confirmBtn, GroupLayout.PREFERRED_SIZE, 69, GroupLayout.PREFERRED_SIZE)
                                                .addGap(26)
                                                .addComponent(resetBtn, GroupLayout.PREFERRED_SIZE, 69, GroupLayout.PREFERRED_SIZE))
                                        .addGroup(gl_contentPane.createSequentialGroup()
                                                .addGap(87)
                                                .addGroup(gl_contentPane.createParallelGroup(Alignment.TRAILING)
                                                        .addComponent(usernameLabel)
                                                        .addComponent(passwordLabel))
                                                .addGap(18)
                                                .addGroup(gl_contentPane.createParallelGroup(Alignment.TRAILING)
                                                        .addGroup(gl_contentPane.createSequentialGroup()
                                                                .addGroup(gl_contentPane.createParallelGroup(Alignment.LEADING, false)
                                                                        .addComponent(passwordField)
                                                                        .addComponent(usernameInput, GroupLayout.DEFAULT_SIZE, 221, Short.MAX_VALUE))
                                                                .addPreferredGap(ComponentPlacement.RELATED, 9, Short.MAX_VALUE))
                                                        .addGroup(gl_contentPane.createSequentialGroup()
                                                                .addComponent(admin)
                                                                .addPreferredGap(ComponentPlacement.RELATED, 120, Short.MAX_VALUE)
                                                                .addComponent(user)
                                                                .addGap(33)))))
                                .addGap(99))
                        .addGroup(gl_contentPane.createSequentialGroup()
                                .addContainerGap(240, Short.MAX_VALUE)
                                .addComponent(loginTitle)
                                .addGap(191))
        );
        gl_contentPane.setVerticalGroup(
                gl_contentPane.createParallelGroup(Alignment.LEADING)
                        .addGroup(gl_contentPane.createSequentialGroup()
                                .addGap(32)
                                .addComponent(loginTitle)
                                .addGap(18)
                                .addGroup(gl_contentPane.createParallelGroup(Alignment.BASELINE)
                                        .addComponent(admin)
                                        .addComponent(user))
                                .addGap(18)
                                .addGroup(gl_contentPane.createParallelGroup(Alignment.BASELINE)
                                        .addComponent(usernameLabel)
                                        .addComponent(usernameInput, GroupLayout.PREFERRED_SIZE, 33, GroupLayout.PREFERRED_SIZE))
                                .addGap(30)
                                .addGroup(gl_contentPane.createParallelGroup(Alignment.BASELINE)
                                        .addComponent(passwordLabel)
                                        .addComponent(passwordField, GroupLayout.PREFERRED_SIZE, 33, GroupLayout.PREFERRED_SIZE))
                                .addGap(18)
                                .addGroup(gl_contentPane.createParallelGroup(Alignment.BASELINE)
                                        .addComponent(confirmBtn, GroupLayout.PREFERRED_SIZE, 36, GroupLayout.PREFERRED_SIZE)
                                        .addComponent(resetBtn, GroupLayout.PREFERRED_SIZE, 36, GroupLayout.PREFERRED_SIZE))
                                .addContainerGap())
        );
        ButtonGroup btnGroup = new ButtonGroup();
        btnGroup.add(admin);
        btnGroup.add(user);
        contentPane.setLayout(gl_contentPane);
        resetBtn.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                usernameInput.setText("");
                passwordField.setText("");
            }
        });
        confirmBtn.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String username = usernameInput.getText();
                String password = new String(passwordField.getPassword());
                if(StringUtil.isEmpty(username)){
                    JOptionPane.showMessageDialog(null, "用户名不能为空");
                    return;
                }
                if(StringUtil.isEmpty(password)){
                    JOptionPane.showMessageDialog(null, "密码不能为空");
                    return;
                }
                String role = admin.isSelected() ? "admin":"user";
                User user = new User("admin",username,password);
                try {
                    currentUser = controller.login(dbUtil.getCon(), user,role);
                    if(currentUser!=null){
                        if(role.equals("admin")){
                            new AdminFrame(controller);
                        }else{
                            new UserFrame(controller);
                        }
                        thisFrame.dispose();
                    }else{
                        JOptionPane.showMessageDialog(null, "登录失败");
                    }
                } catch (Exception e1) {
                    e1.printStackTrace();
                }
            }
        });
    }
}