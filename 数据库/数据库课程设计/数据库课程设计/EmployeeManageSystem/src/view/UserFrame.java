package view;

import java.awt.Component;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JFrame;
import javax.swing.JMenu;
import javax.swing.JMenuBar;
import javax.swing.JMenuItem;

import controller.Controller;
import util.DbUtil;

@SuppressWarnings("serial")
public class UserFrame extends JFrame{
    private Controller controller;
    UserFrame userFrame ;
    Component[] components;
    DbUtil dbUtil = new DbUtil();
    public static final String CHECK_MODIFY_PERSONAL_INFO = "查看/修改个人信息";
    public static final String CHOOSE_COURSE = "选择任务";
    public static final String PRINT_SCORE = "查看个人绩效";
    public static final String MODIFY_PERSONAL = "修改用户名/密码";
    public UserFrame(Controller controller) {
        this.controller = controller;
        init();
    }
    private void init(){
        userFrame = this;
        setTitle("用户");
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setBounds(100, 100, 450, 300);
        JMenuBar menuBar = new JMenuBar();
        JMenu edit = new JMenu("执行");
        JMenu print = new JMenu("查看");
        JMenu personal = new JMenu("个人中心");
        JMenuItem checkInfo = new JMenuItem(CHECK_MODIFY_PERSONAL_INFO );
        JMenuItem chooseCourse = new JMenuItem(CHOOSE_COURSE);
        JMenuItem printScore = new JMenuItem(PRINT_SCORE);
        JMenuItem modifyPersonal = new JMenuItem(MODIFY_PERSONAL);
        setJMenuBar(menuBar);
        edit.add(checkInfo);
        edit.add(chooseCourse);
        print.add(printScore);
        personal.add(modifyPersonal);
        menuBar.add(edit);
        menuBar.add(print);
        menuBar.add(personal);
        setVisible(true);
        checkInfo.addActionListener(new MenuItemListener());
        chooseCourse.addActionListener(new MenuItemListener());
        printScore.addActionListener(new MenuItemListener());
        modifyPersonal.addActionListener(new MenuItemListener());
    }
    class MenuItemListener implements ActionListener{
        @Override
        public void actionPerformed(ActionEvent e) {
            String command = e.getActionCommand();
            controller.performAction(dbUtil, userFrame, command);
        }
    }
}
