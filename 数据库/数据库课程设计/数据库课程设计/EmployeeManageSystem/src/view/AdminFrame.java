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
public class AdminFrame extends JFrame{
    private Controller controller;
    AdminFrame adminFrame ;
    Component[] components;
    DbUtil dbUtil = new DbUtil();
    public static final String CHECK_STUDENT_INFO = "查看职员信息";
    public static final String ADD_STUDENT_INFO = "添加职员信息";
    public static final String MODIFY_DELETE_STUDENT_INFO = "修改/删除职员信息";
    public static final String ADD_COURSE = "添加任务";
    public static final String MODIFY_DELETE_COURSE = "修改/删除任务";
    public static final String EDIT_STUDENT_SCORE = "编辑职员绩效";
    public static final String MODIFY_PASSWORD = "修改密码";
    public AdminFrame(Controller controller) {
        this.controller = controller;
        init();
    }
    private void init(){
        adminFrame = this;
        setTitle("管理员");
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setBounds(100, 100, 450, 300);
        JMenuBar menuBar = new JMenuBar();
        JMenu edit = new JMenu("执行");
        JMenu personal = new JMenu("个人中心");
        JMenuItem selectStudent = new JMenuItem(CHECK_STUDENT_INFO);
        JMenuItem addStudent = new JMenuItem(ADD_STUDENT_INFO);
        JMenuItem modifyStudent = new JMenuItem(MODIFY_DELETE_STUDENT_INFO);
        JMenuItem addCourse = new JMenuItem(ADD_COURSE);
        JMenuItem deleteCourse = new JMenuItem(MODIFY_DELETE_COURSE);
        JMenuItem addStudentScore = new JMenuItem(EDIT_STUDENT_SCORE);
        JMenuItem modifyPassword = new JMenuItem(MODIFY_PASSWORD);
        setJMenuBar(menuBar);
        edit.add(selectStudent);
        edit.add(addStudent);
        edit.add(modifyStudent);
        edit.add(addCourse);
        edit.add(deleteCourse);
        edit.add(addStudentScore);

        personal.add(modifyPassword);
        menuBar.add(edit);
        menuBar.add(personal);
        setVisible(true);
        selectStudent.addActionListener(new MenuItemListener());
        addStudent.addActionListener(new MenuItemListener());
        modifyStudent.addActionListener(new MenuItemListener());
        addCourse.addActionListener(new MenuItemListener());
        deleteCourse.addActionListener(new MenuItemListener());
        addStudentScore.addActionListener(new MenuItemListener());
        modifyPassword.addActionListener(new MenuItemListener());
    }
    class MenuItemListener implements ActionListener{
        @Override
        public void actionPerformed(ActionEvent e) {
            String command = e.getActionCommand();
            controller.performAction(dbUtil, adminFrame, command);
        }
    }

}
