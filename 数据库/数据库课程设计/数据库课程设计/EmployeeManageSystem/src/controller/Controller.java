package controller;

import java.awt.Color;
import java.awt.GridLayout;
import java.awt.event.*;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.swing.*;
import javax.swing.GroupLayout.Alignment;
import javax.swing.event.TableModelEvent;
import javax.swing.event.TableModelListener;
import javax.swing.table.DefaultTableModel;

import com.mysql.jdbc.PreparedStatement;
import dao.User;
import util.DbUtil;
import util.StringUtil;
import view.AdminFrame;
import view.LoginFrame;
import view.UserFrame;

public class Controller {
    public static LoginFrame loginFrame;
    JPanel jpanel;
    String[] newValue;
    String[] oldScore;

    public static void main(String[] args) {
        loginFrame = new LoginFrame(new Controller());
    }

    public User login(Connection connection,User user,String role) throws SQLException{//登录
        User resultUser = null;
        String sql /*= null*/;
        if(role.equals("admin")){
            sql = "select * from administrator where username='"+user.getUsername()+"' and password='"+user.getPassword()+"'";
        }else{
            sql = "select * from user where username='"+user.getUsername()+"' and password='"+user.getPassword()+"'";
        }
        ResultSet result = statementQuery(connection, sql);
        if(result.next()){
            resultUser = new User();
            resultUser.setUsername(result.getString("username"));
            resultUser.setPassword(result.getString("password"));
            if(role.equals("admin")){
                resultUser.setEno(null);
            }else{
                resultUser.setEno(result.getString("eno"));
            }
        }
        return resultUser;
    }
    //查看公司职员信息
    private void checkStudentInfo(Connection connection,AdminFrame adminFrame) throws SQLException{
        jpanel = new JPanel();
        Object[][] object = null;
        int rowCount = 0;
        int columnCount;
        ResultSet result /*= null*/;
        String[] columnNames =  { "工号", "姓名", "性别", "部门", "职位","出生日期"};
        try{
            String sql = "select eno,ename,esex,dname,spname,ebirthday from employeeinfo,speciality,department " +
                    "where employeeinfo.spno=speciality.spno and employeeinfo.dno=department.dno";
            result = statementQuery(connection, sql);
            //获取行数
            String countSQL = "select count(*) totalCount from employeeinfo";
            ResultSet rSet = statementQuery(connection, countSQL);
            if(rSet.next()) {
                rowCount=rSet .getInt("totalCount");
            }
            //获取列数
            columnCount = result.getMetaData().getColumnCount();
            object = new Object[rowCount][columnCount];
            int i=0, j=0;
            while(result.next()){
                if(result.getString(1) != null){
                    for(j = 0;j<6;j++){
                        object[i][j]=result.getString(j+1);
                    }
                    i++;
                }
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        JTable checkTab = new JTable(object,columnNames);
        checkTab.setEnabled(false);
        JScrollPane scrollPanel = new JScrollPane(checkTab);
        scrollPanel.setBounds(20,50,500,200);
        jpanel.setLayout(null);
        jpanel.add(scrollPanel);
        JLabel tableTitle = new JLabel();
        tableTitle.setText("公司成员信息");
        tableTitle.setForeground(Color.BLUE);
        tableTitle.setHorizontalAlignment(SwingConstants.CENTER);
        tableTitle.setBounds(200, 20, 150, 20);
        jpanel.add(tableTitle);
        jpanel.setVisible(true);
        adminFrame.add(jpanel);
        adminFrame.setSize(550,350);
        adminFrame.setResizable(false);
    }
    //添加公司职员信息
    private void addStudentInfo(final Connection connection,AdminFrame adminFrame){
        jpanel = new JPanel();
        JPanel leftJPanel,rightJPanel,titleJPanel,buttonJPanel;
        JButton addBtn;
        final JButton resetBtn;
        JLabel addLabel;
        final JTextField eno,ename,ebirthday;
        final JComboBox<String>  esex;
        final JComboBox<String> dnoBox;
        final JComboBox<String> spnoBox;

        leftJPanel = new JPanel(new GridLayout(6,1));
        rightJPanel = new JPanel(new GridLayout(6,1));
        titleJPanel = new JPanel();
        buttonJPanel = new JPanel();

        addBtn = new JButton("添加");
        resetBtn = new JButton("重置");

        addLabel = new JLabel("添加成员信息",SwingConstants.CENTER);

        eno = new JTextField(20);
        ename = new JTextField(20);
        esex = new JComboBox<String>();
        dnoBox =  new JComboBox<String>();
        spnoBox =new JComboBox<String>();
        ebirthday = new JTextField(20);
        ebirthday.setText("格式如：2021/12/27");
        esex.addItem("男");
        esex.addItem("女");
        esex.setSelectedItem("男");
        try {
            String dnoSQL = "select dno from department order by dno";
            ResultSet dnoItem = statementQuery(connection, dnoSQL);
            while(dnoItem.next()){
                dnoBox.addItem(dnoItem.getString(1));
            }
        } catch (SQLException e2) {
            e2.printStackTrace();
        }
        createSpnoItem(connection, spnoBox, (String)dnoBox.getSelectedItem());

        dnoBox.setSelectedIndex(0);
        leftJPanel.add(new JLabel("工号",SwingConstants.CENTER));
        leftJPanel.add(new JLabel("姓名",SwingConstants.CENTER));
        leftJPanel.add(new JLabel("性别",SwingConstants.CENTER));
        leftJPanel.add(new JLabel("部门",SwingConstants.CENTER));
        leftJPanel.add(new JLabel("职位",SwingConstants.CENTER));
        leftJPanel.add(new JLabel("出生日期",SwingConstants.CENTER));
        rightJPanel.add(eno);
        rightJPanel.add(ename);
        rightJPanel.add(esex);
        rightJPanel.add(dnoBox);
        rightJPanel.add(spnoBox);
        rightJPanel.add(ebirthday);
        titleJPanel.add(addLabel);
        buttonJPanel.add(addBtn);
        buttonJPanel.add(resetBtn);
        titleJPanel.setBounds(170,0,200,45);
        leftJPanel.setBounds(20,45,100,200);
        rightJPanel.setBounds(150,45,300,200);
        buttonJPanel.setBounds(170,270,200,50);
        jpanel.add(titleJPanel);
        jpanel.add(leftJPanel);
        jpanel.add(rightJPanel);
        jpanel.add(buttonJPanel);
        jpanel.setLayout(null);
        adminFrame.add(jpanel);
        adminFrame.setVisible(true);
        adminFrame.setSize(550,400);
        //文本框加入提示语
        ebirthday.addFocusListener(new FocusListener(){
            @Override
            public void focusGained(FocusEvent e) {
                ebirthday.setText("");
            }
            @Override
            public void focusLost(FocusEvent e) {
                if(StringUtil.isEmpty(ebirthday.getText())){
                    ebirthday.setText("格式如：2021/12/27");
                }
            }
        });
        addBtn.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String	sql = "insert into employeeinfo (eno,ename,esex,dno,spno,ebirthday) values ('"+eno.getText()+"','"+ename.getText()+"','"+esex.getSelectedItem()+"','"+dnoBox.getSelectedItem()+"','"+spnoBox.getSelectedItem()+"','"+ebirthday.getText()+"')";
                if(StringUtil.isEmpty(eno.getText())){
                    JOptionPane.showMessageDialog(null, "工号不能为空");
                    return ;
                }
                if(StringUtil.isEmpty(ename.getText())){
                    JOptionPane.showMessageDialog(null, "姓名不能为空");
                    return ;
                }
                try {
                    int result = statementUpdate(connection, sql);
                    if(result!=0){
                        JOptionPane.showMessageDialog(null, "添加成功");
                        resetBtn.doClick();
                    }
                } catch (Exception e1) {
                    e1.printStackTrace();
                    JOptionPane.showMessageDialog(null, "添加失败");
                }
            }
        });
        resetBtn.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                eno.setText("");
                ename.setText("");
                esex.setSelectedItem("男");
                dnoBox.setSelectedIndex(0);
                spnoBox.setSelectedIndex(0);
                ebirthday.setText("");
            }
        });
        dnoBox.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                String dno = (String) dnoBox.getSelectedItem();
                createSpnoItem(connection, spnoBox, dno);
            }
        });
    }
    //修改/删除公司职员信息
    private void modifyStudentInfo(final Connection connection,AdminFrame adminFrame){
        jpanel = new JPanel();
        JPanel leftJPanel,rightJPanel,titleJPanel,btnJPanel;
        JButton searchEno;
        final JButton editButton;
        final JButton modifyButton;
        final JButton deleteButton;
        JLabel addLabel;
        final JTextField eno,ename,ebirthday;
        final JComboBox<String>  esex;
        final JComboBox<String> dnoBox;
        final JComboBox<String> spnoBox;
        final String[] enoText=new String[1];
        leftJPanel = new JPanel(new GridLayout(6,1));
        rightJPanel = new JPanel(new GridLayout(6,1));
        titleJPanel = new JPanel();
        btnJPanel = new JPanel();
        editButton = new JButton("编辑");
        modifyButton = new JButton("修改");
        deleteButton = new JButton("删除");
        searchEno = new JButton("搜索");
        addLabel = new JLabel("修改成员信息",SwingConstants.CENTER);
        eno = new JTextField(20);
        ename = new JTextField(20);
        esex = new JComboBox<String>();
        dnoBox =  new JComboBox<String>();
        spnoBox =new JComboBox<String>();
        ebirthday = new JTextField(20);
        ebirthday.setText("格式如：2021/12/27");
        esex.addItem("男");
        esex.addItem("女");
        esex.setSelectedItem("男");
        try {
            String dnoSQL = "select dno from department order by dno";
            ResultSet dnoItem = statementQuery(connection, dnoSQL);
            while(dnoItem.next()){
                dnoBox.addItem(dnoItem.getString(1));
            }
        } catch (SQLException e2) {
            e2.printStackTrace();
        }
        createSpnoItem(connection, spnoBox, (String)dnoBox.getSelectedItem());
        dnoBox.setSelectedIndex(0);
        leftJPanel.add(new JLabel("输入修改的工号",SwingConstants.CENTER));
        leftJPanel.add(new JLabel("姓名",SwingConstants.CENTER));
        leftJPanel.add(new JLabel("性别",SwingConstants.CENTER));
        leftJPanel.add(new JLabel("部门",SwingConstants.CENTER));
        leftJPanel.add(new JLabel("职位",SwingConstants.CENTER));
        leftJPanel.add(new JLabel("出生日期",SwingConstants.CENTER));
        rightJPanel.add(eno);
        rightJPanel.add(ename);
        rightJPanel.add(esex);
        rightJPanel.add(dnoBox);
        rightJPanel.add(spnoBox);
        rightJPanel.add(ebirthday);
        ename.setEditable(false);
        esex.setEnabled(false);
        dnoBox.setEnabled(false);
        spnoBox.setEnabled(false);
        ebirthday.setEditable(false);
        editButton.setEnabled(false);
        modifyButton.setEnabled(false);
        deleteButton.setEnabled(false);
        titleJPanel.add(addLabel);
        btnJPanel.add(editButton);
        btnJPanel.add(modifyButton);
        btnJPanel.add(deleteButton);
        searchEno.setBounds(460, 53, 60, 23);
        titleJPanel.setBounds(170,0,200,45);
        leftJPanel.setBounds(20,45,100,200);
        rightJPanel.setBounds(150,45,300,200);
        btnJPanel.setBounds(170,270,200,50);
        jpanel.add(searchEno);
        jpanel.add(titleJPanel);
        jpanel.add(leftJPanel);
        jpanel.add(rightJPanel);
        jpanel.add(btnJPanel);
        jpanel.setLayout(null);
        adminFrame.add(jpanel);
        adminFrame.setVisible(true);
        adminFrame.setSize(550,400);
        //文本框加入提示语
        ebirthday.addFocusListener(new FocusListener(){
            @Override
            public void focusLost(FocusEvent e) {
                if(StringUtil.isEmpty(ebirthday.getText())){
                    ebirthday.setText("格式如：2021/12/27");
                }
            }
            @Override
            public void focusGained(FocusEvent e) {}
        });
        //搜索公司职员工号按钮事件
        searchEno.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                enoText[0] = eno.getText();
                if(enoText[0]!= null){
                    String searchSql = "select * from employeeinfo where eno = '"+eno.getText()+"'";
                    try {
                        ResultSet result = statementQuery(connection, searchSql);
                        if(result.next()){
                            eno.setText(result.getString("eno"));
                            ename.setText(result.getString("ename"));
                            esex.setSelectedItem(result.getString("esex"));
                            dnoBox.setSelectedItem(result.getString("dno"));
                            spnoBox.setSelectedItem(result.getString("spno"));
                            ebirthday.setText(result.getString("ebirthday"));
                            deleteButton.setEnabled(true);
                            editButton.setEnabled(true);
                        }else{
                            JOptionPane.showMessageDialog(null, "不存在该工号");
                        }
                    } catch (SQLException e1) {
                        e1.printStackTrace();
                    }
                }else{
                    JOptionPane.showMessageDialog(null, "请输入需要修改的工号");
                }
            }
        });
        //编辑按钮事件
        editButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                ename.setEditable(true);
                esex.setEnabled(true);
                dnoBox.setEnabled(true);
                spnoBox.setEnabled(true);
                ebirthday.setEditable(true);
                modifyButton.setEnabled(true);
            }
        });
        //编辑公司职员按钮事件
        modifyButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String updateSql;
                if(StringUtil.isEmpty(eno.getText())){
                    JOptionPane.showMessageDialog(null, "工号不能为空");
                    return ;
                }
                if(StringUtil.isEmpty(ename.getText())){
                    JOptionPane.showMessageDialog(null, "姓名不能为空");
                    return ;
                }
                updateSql = "update employeeinfo set eno='"+eno.getText()+"', ename = '"+ename.getText()+"' ,esex = '"+esex.getSelectedItem()+"',dno='"+dnoBox.getSelectedItem()+"',spno='"+spnoBox.getSelectedItem()+"',ebirthday='"+ebirthday.getText()+"' where eno='"+enoText[0]+"'";
                int result = statementUpdate(connection, updateSql);
                if(result!=0){
                    JOptionPane.showMessageDialog(null, "修改成功");
                }
            }
        });
        //删除公司职员按钮事件
        deleteButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String deleteSql = "delete from employeeinfo where eno = '"+eno.getText()+"'";
                int result = statementUpdate(connection, deleteSql);
                if(result!=0){
                    JOptionPane.showMessageDialog(null, "删除成功");
                    eno.setText("");
                    ename.setText("");
                    esex.setSelectedItem("男");
                    dnoBox.setSelectedIndex(0);
                    spnoBox.setSelectedIndex(0);
                    ebirthday.setText("");
                    ename.setEditable(false);
                    esex.setEnabled(false);
                    dnoBox.setEnabled(false);
                    spnoBox.setEnabled(false);
                    ebirthday.setEditable(false);
                    editButton.setEnabled(false);
                    modifyButton.setEnabled(false);
                    deleteButton.setEnabled(false);
                }else{
                    JOptionPane.showMessageDialog(null, "删除失败");
                }
            }
        });
        dnoBox.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                String dno = (String) dnoBox.getSelectedItem();
                createSpnoItem(connection, spnoBox, dno);
            }
        });
    }
    //添加任务
    private void addCourse(final Connection connection,AdminFrame adminFrame){
        jpanel = new JPanel();
        JPanel leftJPanel,rightJPanel,titleJPanel,btnJPanel;
        JButton addBtn;
        final JButton resetBtn;
        JLabel addLabel;
        final JTextField mno,mname,number;
        final JComboBox<String>  degree;
        final JComboBox<String> status;
        leftJPanel = new JPanel(new GridLayout(6,1));
        rightJPanel = new JPanel(new GridLayout(6,1));
        titleJPanel = new JPanel();
        btnJPanel = new JPanel();
        addBtn = new JButton("添加");
        resetBtn = new JButton("重置");
        addLabel = new JLabel("添加任务",SwingConstants.CENTER);
        mno = new JTextField(20);
        mname = new JTextField(20);
        degree = new JComboBox<String>();
        status =  new JComboBox<String>();
        number = new JTextField(20);
        mno.setText("格式:001");
        degree.addItem("重要且紧急");
        degree.addItem("重要但不紧急");
        degree.addItem("不重要但紧急");
        degree.addItem("不重要且不紧急");
        degree.setSelectedIndex(0);
        status.addItem("未完成");
        status.addItem("已完成");
        status.setSelectedIndex(0);
        leftJPanel.add(new JLabel("任务号",SwingConstants.CENTER));
        leftJPanel.add(new JLabel("任务名",SwingConstants.CENTER));
        leftJPanel.add(new JLabel("重要紧急程度",SwingConstants.CENTER));
        leftJPanel.add(new JLabel("任务状态",SwingConstants.CENTER));
        leftJPanel.add(new JLabel("任务人数",SwingConstants.CENTER));
        rightJPanel.add(mno);
        rightJPanel.add(mname);
        rightJPanel.add(degree);
        rightJPanel.add(status);
        rightJPanel.add(number);
        titleJPanel.add(addLabel);
        btnJPanel.add(addBtn);
        btnJPanel.add(resetBtn);
        titleJPanel.setBounds(170,0,200,45);
        leftJPanel.setBounds(20,45,100,200);
        rightJPanel.setBounds(150,45,300,200);
        btnJPanel.setBounds(170,270,200,50);
        jpanel.add(titleJPanel);
        jpanel.add(leftJPanel);
        jpanel.add(rightJPanel);
        jpanel.add(btnJPanel);
        jpanel.setLayout(null);
        adminFrame.add(jpanel);
        adminFrame.setVisible(true);
        adminFrame.setSize(550,400);
        //文本框加入提示语
        mno.addFocusListener(new FocusListener(){
            @Override
            public void focusGained(FocusEvent e) {
                mno.setText("");
            }
            @Override
            public void focusLost(FocusEvent e) {
                if(StringUtil.isEmpty(mno.getText())){
                    mno.setText("格式：001");
                }
            }
        });
        //添加任务按钮事件
        addBtn.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String	sql = "insert into mission (mno,mname,degree,status,number) values ('"+mno.getText()+"','"+mname.getText()+"','"+degree.getSelectedItem()+"','"+status.getSelectedItem()/*.toString()*/+"',"+number.getText()+")";
                if(StringUtil.isEmpty(mno.getText())){
                    JOptionPane.showMessageDialog(null, "任务号不能为空");
                    return ;
                }
                if(StringUtil.isEmpty(mname.getText())){
                    JOptionPane.showMessageDialog(null, "任务名不能为空");
                    return ;
                }
                try {
                    int result = statementUpdate(connection, sql);
                    if(result!=0){
                        JOptionPane.showMessageDialog(null, "添加任务成功");
                        resetBtn.doClick();
                    }
                } catch (Exception e1) {
                    e1.printStackTrace();
                    JOptionPane.showMessageDialog(null, "添加任务失败");
                }
            }
        });
        //重置按钮事件
        resetBtn.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                mno.setText("");
                mname.setText("");
                degree.setSelectedItem("重要且紧急");
                status.setSelectedIndex(0);
                number.setText("");
            }
        });
    }
    //修改/删除任务
    private void modifyCourse(final Connection connection,AdminFrame adminFrame){
        jpanel = new JPanel();
        JPanel leftJPanel,rightJPanel,titleJPanel,btnJPanel;
        JButton searchMname;
        final JButton editBtn, modifyBtn,deleteBtn;
        JLabel addLabel;
        final JTextField mno,mname,number;
        final JComboBox<String>  degree;
        final JComboBox<String> status;
        leftJPanel = new JPanel(new GridLayout(6,1));
        rightJPanel = new JPanel(new GridLayout(6,1));
        titleJPanel = new JPanel();
        btnJPanel = new JPanel();
        editBtn = new JButton("编辑");
        modifyBtn = new JButton("修改");
        deleteBtn = new JButton("删除");
        searchMname = new JButton("搜索");
        addLabel = new JLabel("修改/删除任务",SwingConstants.CENTER);
        mno = new JTextField(20);
        mname = new JTextField(20);
        degree = new JComboBox<String>();
        status =  new JComboBox<String>();
        number = new JTextField(20);
        mno.setText("格式:001");
        degree.addItem("重要且紧急");
        degree.addItem("重要但不紧急");
        degree.addItem("不重要但紧急");
        degree.addItem("不重要且不紧急");
        degree.setSelectedIndex(0);
        status.addItem("未完成");
        status.addItem("已完成");
        status.setSelectedIndex(0);
        leftJPanel.add(new JLabel("任务名",SwingConstants.CENTER));
        leftJPanel.add(new JLabel("任务号",SwingConstants.CENTER));
        leftJPanel.add(new JLabel("重要紧急程度",SwingConstants.CENTER));
        leftJPanel.add(new JLabel("任务状态",SwingConstants.CENTER));
        leftJPanel.add(new JLabel("任务人数",SwingConstants.CENTER));
        rightJPanel.add(mname);
        rightJPanel.add(mno);
        rightJPanel.add(degree);
        rightJPanel.add(status);
        rightJPanel.add(number);
        titleJPanel.add(addLabel);
        btnJPanel.add(editBtn);
        btnJPanel.add(modifyBtn);
        btnJPanel.add(deleteBtn);
        titleJPanel.setBounds(170,0,200,45);
        leftJPanel.setBounds(20,45,100,200);
        rightJPanel.setBounds(150,45,300,200);
        btnJPanel.setBounds(170,270,200,50);
        searchMname.setBounds(460, 53, 60, 23);
        jpanel.add(searchMname);
        jpanel.add(titleJPanel);
        jpanel.add(leftJPanel);
        jpanel.add(rightJPanel);
        jpanel.add(btnJPanel);
        jpanel.setLayout(null);
        adminFrame.add(jpanel);
        adminFrame.setVisible(true);
        adminFrame.setSize(550,400);
        mno.setEnabled(false);
        degree.setEnabled(false);
        status.setEnabled(false);
        number.setEnabled(false);
        modifyBtn.setEnabled(false);
        deleteBtn.setEnabled(false);
        final String[] mnameText = new String[1];
        //搜索任务事件
        searchMname.addActionListener(new ActionListener() {
            @SuppressWarnings("unused")
            @Override
            public void actionPerformed(ActionEvent e) {
                mnameText[0] = mname.getText();
                if(mnameText!= null){
                    String searchSql = "select * from mission where mname = '"+ mnameText[0]+"'";
                    try {
                        ResultSet result = statementQuery(connection, searchSql);
                        if(result.next()){
                            mno.setText(result.getString("mno"));
                            degree.setSelectedItem(result.getString("degree"));
                            status.setSelectedItem(result.getString("status"));
                            number.setText(result.getString("number"));
                            deleteBtn.setEnabled(true);
                        }else{
                            JOptionPane.showMessageDialog(null, "不存在该任务");
                        }
                    } catch (SQLException e1) {
                        e1.printStackTrace();
                    }
                }else{
                    JOptionPane.showMessageDialog(null, "请输入需要修改的任务名");
                }
            }
        });
        //编辑按钮事件
        editBtn.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                mno.setEnabled(true);
                degree.setEnabled(true);
                status.setEnabled(true);
                number.setEnabled(true);
                modifyBtn.setEnabled(true);
                deleteBtn.setEnabled(true);
            }
        });
        //修改按钮事件
        modifyBtn.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String updateSql;
                if(StringUtil.isEmpty(mno.getText())){
                    JOptionPane.showMessageDialog(null, "任务号不能为空");
                    return ;
                }
                if(StringUtil.isEmpty(mname.getText())){
                    JOptionPane.showMessageDialog(null, "任务名不能为空");
                    return ;
                }
                updateSql = "update mission set mno='"+mno.getText() +"', mname = '"+ mname.getText() +"' ,degree ='"+degree.getSelectedItem()+"',number='"+number.getText()+"',status='"+status.getSelectedItem()+"' where mname = '"+ mnameText[0]+"'";
                int result = statementUpdate(connection, updateSql);
                if(result!=0){
                    JOptionPane.showMessageDialog(null, "修改成功");
                }
            }
        });
        //删除按钮事件
        deleteBtn.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String deleteSql = "delete from mission where mname = '"+ mname.getText() +"'";
                int result = statementUpdate(connection, deleteSql);
                if(result!=0){
                    JOptionPane.showMessageDialog(null, "删除成功");
                    mname.setText("");
                    mno.setText("");
                    degree.setSelectedIndex(0);
                    status.setSelectedIndex(0);
                    number.setText("");
                    mno.setEnabled(false);
                    degree.setEnabled(false);
                    status.setEnabled(false);
                    number.setEditable(false);
                    modifyBtn.setEnabled(false);
                    deleteBtn.setEnabled(false);
                }else{
                    JOptionPane.showMessageDialog(null, "删除失败");
                }
            }
        });
    }
    //修改公司职员任务绩效
    private void editScore(final Connection connection,final AdminFrame adminFrame){
        jpanel = new JPanel();
        JPanel titleJPanel,btnJPanel,searchPanel;
        final JPanel tablePanel;
        final JButton searchBtn;
        JLabel addLabel,enameLabel;
        final JTextField mname;
        final String[] mnameText=new String[1];
        final JTable checkTab = new JTable();
        final int[] rowCount= new int[1];
        titleJPanel = new JPanel();
        searchPanel = new JPanel();
        btnJPanel = new JPanel();
        tablePanel = new JPanel();
        searchBtn = new JButton("搜索");
        addLabel = new JLabel("修改职员绩效",SwingConstants.CENTER);
        enameLabel = new JLabel("任务名",SwingConstants.CENTER);
        mname = new JTextField();
        mname.setColumns(10);
        titleJPanel.add(addLabel);
        titleJPanel.setBounds(170,0,200,45);
        searchPanel.setBounds(0, 45, 524, 50);
        tablePanel.setBounds(0, 94, 524, 175);
        btnJPanel.setBounds(170,290,200,33);
        jpanel.add(titleJPanel);
        jpanel.add(btnJPanel);
        jpanel.setLayout(null);
        jpanel.add(searchPanel);
        jpanel.add(tablePanel);
        adminFrame.add(jpanel);
        adminFrame.setResizable(false);
        enameLabel.setHorizontalAlignment(SwingConstants.CENTER);
        GroupLayout gl_searchPanel = new GroupLayout(searchPanel);
        gl_searchPanel.setHorizontalGroup(
                gl_searchPanel.createParallelGroup(Alignment.LEADING)
                        .addGroup(gl_searchPanel.createSequentialGroup()
                                .addContainerGap()
                                .addComponent(enameLabel, GroupLayout.PREFERRED_SIZE, 112, GroupLayout.PREFERRED_SIZE)
                                .addGap(18)
                                .addComponent(mname, GroupLayout.PREFERRED_SIZE, 264, GroupLayout.PREFERRED_SIZE)
                                .addGap(30)
                                .addComponent(searchBtn, GroupLayout.PREFERRED_SIZE, 60, GroupLayout.PREFERRED_SIZE)
                                .addGap(26))
        );
        gl_searchPanel.setVerticalGroup(
                gl_searchPanel.createParallelGroup(Alignment.LEADING)
                        .addGroup(gl_searchPanel.createSequentialGroup()
                                .addGap(11)
                                .addGroup(gl_searchPanel.createParallelGroup(Alignment.BASELINE)
                                        .addComponent(enameLabel, GroupLayout.DEFAULT_SIZE, 29, Short.MAX_VALUE)
                                        .addComponent(mname, GroupLayout.PREFERRED_SIZE, 27, GroupLayout.PREFERRED_SIZE)
                                        .addComponent(searchBtn))
                                .addContainerGap())
        );
        searchPanel.setLayout(gl_searchPanel);
        adminFrame.setVisible(true);
        adminFrame.setSize(550,400);
        //文本框加入提示语
        searchBtn.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                mnameText[0] = mname.getText();
                rowCount[0] = 0;
                ResultSet result;
                Object[][] object = null;
                String[] columnNames =  { "任务号", "职员工号", "绩效"};
                if(mnameText[0]!= null){
                    String searchSql = "select employee_mission.mno,eno,score from employee_mission,mission where employee_mission.mno = mission.mno and mname = '"+ mnameText[0] +"'";
                    try {
                        result = statementQuery(connection, searchSql);
                        //获取行数
                        String countSql = "select count(*) totalCount from employee_mission,mission where employee_mission.mno = mission.mno and mname = '"+mname.getText()+"'";
                        ResultSet rSet = statementQuery(connection, countSql);
                        if(rSet.next()) {
                            rowCount[0]=rSet.getInt("totalCount");
                        }
                        newValue = new String[rowCount[0]];
                        oldScore = new String[rowCount[0]];
                        object = new Object[rowCount[0]][3];
                        int i=0, j;
                        while(result.next()){
                            if(result.getString(1) != null){
                                for(j = 0;j<3;j++){
                                    object[i][j]=result.getString(j+1);
                                }
                                i++;
                            }
                        }
                    }catch (SQLException e1) {
                        e1.printStackTrace();
                    }
                    @SuppressWarnings("serial")
                    DefaultTableModel dtm = new DefaultTableModel(object,columnNames) {
                        @Override
                        public boolean isCellEditable(int row, int column) {
                            if (column == 2) {
                                return true;
                            } else {
                                return false;
                            }
                        }};
                    //修改过的单元格
                    dtm.addTableModelListener(new TableModelListener() {
                        @Override
                        public void tableChanged(TableModelEvent e) {
                            if(e.getType() == TableModelEvent.UPDATE){
                                newValue[e.getLastRow()] =checkTab.getValueAt(e.getLastRow(),e.getColumn()).toString();
                                String updateSql = "update employee_mission set score = "+ checkTab.getValueAt(e.getLastRow(),e.getColumn()).toString()+" where eno = '"+ checkTab.getValueAt(e.getLastRow(),1).toString()+"' and mno = '"+ checkTab.getValueAt(e.getLastRow(),0).toString()+"'";
                                int result = statementUpdate(connection, updateSql);
                                if(result!=0){
                                    JOptionPane.showMessageDialog(null, "修改绩效成功");
                                }else{
                                    JOptionPane.showMessageDialog(null, "修改绩效失败");
                                }
                            }
                        }
                    });
                    checkTab.setModel(dtm);
                    JScrollPane scrollPane = new JScrollPane(checkTab);
                    scrollPane.setBounds(20,20, 500, 160);
                    tablePanel.setLayout(null);
                    tablePanel.add(scrollPane);
                    tablePanel.setVisible(true);
                }else{
                    JOptionPane.showMessageDialog(null, "请输入课程名");
                }
            }
        });
        //点击过的单元格
        checkTab.addMouseListener(new MouseAdapter(){
            public void mouseClicked(MouseEvent e){
                //记录进入编辑状态前单元格得数据
                //第i行的数据放入第i个数中
                if(checkTab.getSelectedColumn()==2 && oldScore[checkTab.getSelectedRow()]==null) {
                    oldScore[checkTab.getSelectedRow()] = checkTab.getValueAt(checkTab.getSelectedRow(),checkTab.getSelectedColumn()).toString();
                }
            }
        });
    }
    //修改管理员密码
    private User modifyAdMinPassWord(final Connection connection, AdminFrame adminFrame) {
        jpanel = new JPanel();
        JPanel leftJPanel,rightJPanel,titleJPanel,btnJPanel;
        final JButton editBtn,modifyBtn;
        JLabel addLabel;
        final JTextField username;
        final JPasswordField oldPassword,newPassword,confirmPassword;
        leftJPanel = new JPanel(new GridLayout(6,1));
        rightJPanel = new JPanel(new GridLayout(6,1));
        titleJPanel = new JPanel();
        btnJPanel = new JPanel();
        editBtn = new JButton("编辑");
        modifyBtn = new JButton("修改");
        addLabel = new JLabel("个人中心",SwingConstants.CENTER);
        username = new JTextField(20);
        oldPassword = new JPasswordField();
        newPassword = new JPasswordField();
        confirmPassword = new JPasswordField();
        leftJPanel.add(new JLabel("用户名",SwingConstants.CENTER));
        leftJPanel.add(new JLabel("请输入原密码",SwingConstants.CENTER));
        leftJPanel.add(new JLabel("请输入新密码",SwingConstants.CENTER));
        leftJPanel.add(new JLabel("再次输入新密码",SwingConstants.CENTER));
        rightJPanel.add(username);
        rightJPanel.add(oldPassword);
        rightJPanel.add(newPassword);
        rightJPanel.add(confirmPassword);
        username.setEditable(false);
        oldPassword.setEnabled(false);
        newPassword.setEnabled(false);
        confirmPassword.setEnabled(false);
        modifyBtn.setEnabled(false);
        titleJPanel.add(addLabel);
        btnJPanel.add(editBtn);
        btnJPanel.add(modifyBtn);
        titleJPanel.setBounds(170,0,200,45);
        leftJPanel.setBounds(20,45,100,200);
        rightJPanel.setBounds(150,45,300,200);
        btnJPanel.setBounds(170,270,200,50);
        jpanel.add(titleJPanel);
        jpanel.add(leftJPanel);
        jpanel.add(rightJPanel);
        jpanel.add(btnJPanel);
        jpanel.setLayout(null);
        adminFrame.add(jpanel);
        adminFrame.setVisible(true);
        adminFrame.setSize(550,400);
        final String currentUsername = LoginFrame.currentUser.getUsername();
        username.setText(currentUsername);
        modifyBtn.addActionListener(new ActionListener(){
            @Override
            public void actionPerformed(ActionEvent e) {
                String oldSQL = "select password from administrator where username = '"+currentUsername+"'";
                String newName = username.getText(),
                        oldPss = new String(oldPassword.getPassword()),
                        newPss = new String(newPassword.getPassword()),
                        confirmPss = new String(confirmPassword.getPassword());
                if(StringUtil.isEmpty(newName)){
                    JOptionPane.showMessageDialog(null, "用户名不能为空");
                    return;
                }
                if(StringUtil.isEmpty(oldPss)){
                    JOptionPane.showMessageDialog(null, "请输入原密码");
                    return;
                }
                if(StringUtil.isEmpty(newPss)){
                    JOptionPane.showMessageDialog(null, "新密码不能为空");
                    return;
                }
                if(StringUtil.isEmpty(confirmPss)){
                    JOptionPane.showMessageDialog(null, "确认新密码");
                    return;
                }
                try{
                    ResultSet result = statementQuery(connection, oldSQL);
                    if(result.next()){
                        if(oldPss.equals(result.getString("password")) && newPss.equals(confirmPss)){
                            String passUpdateSql = "update administrator set username = '"+newName+"' ,password = '"+newPss+"' where username='"+currentUsername+"'";
                            int userUpdate = statementUpdate(connection, passUpdateSql);
                            if(userUpdate!=0){
                                JOptionPane.showMessageDialog(null, "信息修改成功");
                            }
                        }
                    }
                }catch(Exception e1){
                    e1.getStackTrace();
                }
            }
        });
        editBtn.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                username.setEditable(true);
                oldPassword.setEnabled(true);
                newPassword.setEnabled(true);
                confirmPassword.setEnabled(true);
                editBtn.setEnabled(true);
                modifyBtn.setEnabled(true);
            }
        });
        return LoginFrame.currentUser;
    }

    private void chooseCourse(final Connection connection, UserFrame userFrame) {//选课
        jpanel = new JPanel();
        JPanel leftJPanel,rightJPanel,titleJPanel,btnJPanel;
        JButton searchEno;
        final JButton selectBtn;
        JLabel addLabel;
        final JTextField searchMname,eno;
        final JComboBox<String> mnameBox;
        final String[] mnameText=new String[1];
        leftJPanel = new JPanel(new GridLayout(6,1));
        rightJPanel = new JPanel(new GridLayout(6,1));
        titleJPanel = new JPanel();
        btnJPanel = new JPanel();
        selectBtn = new JButton("选择任务");
        searchEno = new JButton("搜索");
        addLabel = new JLabel("选择任务",SwingConstants.CENTER);
        searchMname = new JTextField(20);
        eno = new JTextField(20);
        mnameBox =  new JComboBox<String>();
        eno.setText(LoginFrame.currentUser.getEno());
        leftJPanel.add(new JLabel("请输入任务名",SwingConstants.CENTER));
        leftJPanel.add(new JLabel("工号",SwingConstants.CENTER));
        leftJPanel.add(new JLabel("任务名",SwingConstants.CENTER));
        rightJPanel.add(searchMname);
        rightJPanel.add(eno);
        rightJPanel.add(mnameBox);
        eno.setEditable(false);
        mnameBox.setEnabled(false);
        selectBtn.setEnabled(false);
        titleJPanel.add(addLabel);
        btnJPanel.add(selectBtn);
        searchEno.setBounds(460, 53, 60, 23);
        titleJPanel.setBounds(170,0,200,45);
        leftJPanel.setBounds(20,45,100,200);
        rightJPanel.setBounds(150,45,300,200);
        btnJPanel.setBounds(170,270,200,50);
        jpanel.add(searchEno);
        jpanel.add(titleJPanel);
        jpanel.add(leftJPanel);
        jpanel.add(rightJPanel);
        jpanel.add(btnJPanel);
        jpanel.setLayout(null);
        userFrame.add(jpanel);
        userFrame.setVisible(true);
        userFrame.setSize(550,400);
        searchEno.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                mnameText[0] = searchMname.getText();
                if(mnameText[0]!= null){
                    String searchSql = "select mname from mission where mname ='"+mnameText[0]+"'";
                    try {
                        ResultSet result = statementQuery(connection, searchSql),
                                resultBackup = statementQuery(connection, searchSql);
                        if(resultBackup.next()){
                            mnameBox.removeAllItems();
                            while(result.next()){
                                mnameBox.addItem(result.getString("mname"));
                            }
                            selectBtn.setEnabled(true);
                            mnameBox.setEnabled(true);
                            mnameBox.setSelectedIndex(0);
                        }else{
                            JOptionPane.showMessageDialog(null, "不存在该任务");
                        }
                    } catch (SQLException e1) {
                        e1.printStackTrace();
                    }
                }else{
                    JOptionPane.showMessageDialog(null, "请输入任务名");
                }
            }
        });
        selectBtn.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                if(StringUtil.isEmpty(eno.getText())){
                    JOptionPane.showMessageDialog(null, "工号不能为空");
                    return ;
                }
                if(StringUtil.isEmpty((String)mnameBox.getSelectedItem())){
                    JOptionPane.showMessageDialog(null, "任务名不能为空");
                    return ;
                }
                String checkChooseCourseSql = "select mission.mno from mission,employee_mission where eno = '"+eno.getText()+"' and mission.mno = employee_mission.mno and mname = '"+ mnameBox.getSelectedItem()+"'";//查看改该职员是否已经选择了该任务
                ResultSet checkResult;
                try {
                    checkResult = statementQuery(connection, checkChooseCourseSql);
                    if(checkResult.next()){//若已选改门课程
                        JOptionPane.showMessageDialog(null, "您已选择该任务，无法重复选择！");
                        return ;
                    }else{
                        String mno="";
                        try {
                            String mnoSQL = "select mno from mission where mname = '"+ mnameBox.getSelectedItem()+"'";
                            ResultSet cnoResult = statementQuery(connection, mnoSQL);
                            if(cnoResult.next()){
                                mno = cnoResult.getString("mno");
                                if(mno == null){
                                    mno = "";
                                }
                            }
                            String chooseCourseSql = "insert into employee_mission(mno,eno) values ('"+ mno +"','"+eno.getText() +"')";
                            int chooseResult = statementUpdate(connection, chooseCourseSql);
                            if(chooseResult!=0){
                                JOptionPane.showMessageDialog(null, "选择任务成功");
                            }else{
                                JOptionPane.showMessageDialog(null, "选择任务失败");
                            }
                        } catch (SQLException e2) {
                            e2.printStackTrace();
                        }
                    }
                } catch (SQLException e1) {
                    JOptionPane.showMessageDialog(null, "选择任务失败");
                    e1.printStackTrace();
                }
            }
        });
    }
    //修改个人信息
    private void checkPersonalInfo(final Connection connection, UserFrame userFrame) {
        jpanel = new JPanel();
        JPanel leftJPanel,rightJPanel,titleJPanel,btnJPanel;
        final JButton editBtn;
        final JButton modifyBtn;
        JLabel addLabel;
        final JTextField eno,ename,ebirthday;
        final JComboBox<String>  esex;
        final JComboBox<String> dnoBox;
        final JComboBox<String> spnoBox;
        leftJPanel = new JPanel(new GridLayout(6,1));
        rightJPanel = new JPanel(new GridLayout(6,1));
        titleJPanel = new JPanel();
        btnJPanel = new JPanel();
        editBtn = new JButton("编辑");
        modifyBtn = new JButton("修改");
        addLabel = new JLabel("查看信息",SwingConstants.CENTER);
        eno = new JTextField(20);
        ename = new JTextField(20);
        esex = new JComboBox<String>();
        dnoBox =  new JComboBox<String>();
        spnoBox =new JComboBox<String>();
        ebirthday = new JTextField(20);
        esex.addItem("男");
        esex.addItem("女");
        try {
            String dnoSQL = "select dno from department order by dno";

            ResultSet dnoItem = statementQuery(connection, dnoSQL);
            while(dnoItem.next()){
                dnoBox.addItem(dnoItem.getString(1));
            }
        } catch (SQLException e2) {
            e2.printStackTrace();
        }
        createSpnoItem(connection, spnoBox, (String)dnoBox.getSelectedItem());
        dnoBox.setSelectedIndex(0);
        leftJPanel.add(new JLabel("请输入修改的工号",SwingConstants.CENTER));
        leftJPanel.add(new JLabel("姓名",SwingConstants.CENTER));
        leftJPanel.add(new JLabel("性别",SwingConstants.CENTER));
        leftJPanel.add(new JLabel("部门",SwingConstants.CENTER));
        leftJPanel.add(new JLabel("职位",SwingConstants.CENTER));
        leftJPanel.add(new JLabel("出生日期",SwingConstants.CENTER));
        rightJPanel.add(eno);
        rightJPanel.add(ename);
        rightJPanel.add(esex);
        rightJPanel.add(dnoBox);
        rightJPanel.add(spnoBox);
        rightJPanel.add(ebirthday);
        eno.setEditable(false);
        ename.setEditable(false);
        esex.setEnabled(false);
        dnoBox.setEnabled(false);
        spnoBox.setEnabled(false);
        ebirthday.setEditable(false);
        editBtn.setEnabled(false);
        modifyBtn.setEnabled(false);
        titleJPanel.add(addLabel);
        btnJPanel.add(editBtn);
        btnJPanel.add(modifyBtn);
        titleJPanel.setBounds(170,0,200,45);
        leftJPanel.setBounds(20,45,100,200);
        rightJPanel.setBounds(150,45,300,200);
        btnJPanel.setBounds(170,270,200,50);
        jpanel.add(titleJPanel);
        jpanel.add(leftJPanel);
        jpanel.add(rightJPanel);
        jpanel.add(btnJPanel);
        jpanel.setLayout(null);
        userFrame.add(jpanel);
        userFrame.setVisible(true);
        userFrame.setSize(550,400);
        //文本框加入提示语
        ebirthday.addFocusListener(new FocusListener(){
            @Override
            public void focusLost(FocusEvent e) {
                if(StringUtil.isEmpty(ebirthday.getText())){
                    ebirthday.setText("格式如：2021/12/27");
                }
            }
            @Override
            public void focusGained(FocusEvent e) {}
        });
        String searchSql = "select * from employeeinfo where eno = '" +LoginFrame.currentUser.getEno()+"'";
        try {
            ResultSet result = statementQuery(connection, searchSql);
            if(result.next()){
                eno.setText(result.getString("eno"));
                ename.setText(result.getString("ename"));
                esex.setSelectedItem(result.getString("esex"));
                dnoBox.setSelectedItem(result.getString("dno"));
                spnoBox.setSelectedItem(result.getString("spno"));
                ebirthday.setText(result.getString("ebirthday"));
                editBtn.setEnabled(true);
            }else{
                JOptionPane.showMessageDialog(null, "不存在该工号");
            }
        } catch (SQLException e1) {
            e1.printStackTrace();
        }
        editBtn.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                ename.setEditable(true);
                esex.setEnabled(true);
                ebirthday.setEditable(true);
                modifyBtn.setEnabled(true);
            }
        });
        modifyBtn.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String updateSql;
                if(StringUtil.isEmpty(eno.getText())){
                    JOptionPane.showMessageDialog(null, "工号不能为空");
                    return ;
                }
                if(StringUtil.isEmpty(ename.getText())){
                    JOptionPane.showMessageDialog(null, "姓名不能为空");
                    return ;
                }
                updateSql = "update employeeinfo set ename = '"+ename.getText() +"' ,esex = '"+esex.getSelectedItem()+"',ebirthday='"+ebirthday.getText()+"' where eno='"+eno.getText()+"'";
                int result = statementUpdate(connection, updateSql);
                if(result!=0){
                    JOptionPane.showMessageDialog(null, "修改成功");
                    ename.setEditable(false);
                    esex.setEnabled(false);
                    ebirthday.setEditable(false);
                    modifyBtn.setEnabled(false);
                }
            }
        });
    }
    //修改用户密码
    private User modifyUserPassWord(final Connection connection, UserFrame userframe) {
        jpanel = new JPanel();
        JPanel leftJPanel,rightJPanel,titleJPanel,btnJPanel;
        final JButton editBtn,modifyBtn;
        JLabel addLabel;
        final JTextField username,eno;
        final JPasswordField oldPassword,newPassword,confirmPassword;
        leftJPanel = new JPanel(new GridLayout(6,1));
        rightJPanel = new JPanel(new GridLayout(6,1));
        titleJPanel = new JPanel();
        btnJPanel = new JPanel();
        editBtn = new JButton("编辑");
        modifyBtn = new JButton("修改");
        addLabel = new JLabel("个人中心",SwingConstants.CENTER);
        eno = new JTextField(20);
        username = new JTextField(20);
        oldPassword = new JPasswordField();
        newPassword = new JPasswordField();
        confirmPassword = new JPasswordField();
        leftJPanel.add(new JLabel("工号",SwingConstants.CENTER));
        leftJPanel.add(new JLabel("用户名",SwingConstants.CENTER));
        leftJPanel.add(new JLabel("请输入原密码",SwingConstants.CENTER));
        leftJPanel.add(new JLabel("请输入新密码",SwingConstants.CENTER));
        leftJPanel.add(new JLabel("再次输入新密码",SwingConstants.CENTER));
        rightJPanel.add(eno);
        rightJPanel.add(username);
        rightJPanel.add(oldPassword);
        rightJPanel.add(newPassword);
        rightJPanel.add(confirmPassword);
        eno.setEditable(false);
        username.setEditable(false);
        oldPassword.setEnabled(false);
        newPassword.setEnabled(false);
        confirmPassword.setEnabled(false);
        modifyBtn.setEnabled(false);
        titleJPanel.add(addLabel);
        btnJPanel.add(editBtn);
        btnJPanel.add(modifyBtn);
        titleJPanel.setBounds(170,0,200,45);
        leftJPanel.setBounds(20,45,100,200);
        rightJPanel.setBounds(150,45,300,200);
        btnJPanel.setBounds(170,270,200,50);
        jpanel.add(titleJPanel);
        jpanel.add(leftJPanel);
        jpanel.add(rightJPanel);
        jpanel.add(btnJPanel);
        jpanel.setLayout(null);
        userframe.add(jpanel);
        userframe.setVisible(true);
        userframe.setSize(550,400);
        final String currentUsername = LoginFrame.currentUser.getUsername();
        username.setText(currentUsername);
        eno.setText(LoginFrame.currentUser.getEno());
        modifyBtn.addActionListener(new ActionListener(){
            @Override
            public void actionPerformed(ActionEvent e) {
                String oldSQL = "select password from user where username = '"+currentUsername+"'";
                String newName = username.getText(),
                        oldPss = new String(oldPassword.getPassword()),
                        newPss = new String(newPassword.getPassword()),
                        confirmPss = new String(confirmPassword.getPassword());
                if(StringUtil.isEmpty(newName)){
                    JOptionPane.showMessageDialog(null, "用户名不能为空");
                    return;
                }
                if(StringUtil.isEmpty(oldPss)){
                    JOptionPane.showMessageDialog(null, "请输入原密码");
                    return;
                }
                if(StringUtil.isEmpty(newPss)){
                    JOptionPane.showMessageDialog(null, "新密码不能为空");
                    return;
                }
                if(StringUtil.isEmpty(confirmPss)){
                    JOptionPane.showMessageDialog(null, "确认新密码");
                    return;
                }
                try{
                    ResultSet result =statementQuery(connection, oldSQL);
                    if(result.next()){
                        if(oldPss.equals(result.getString("password")) && newPss.equals(confirmPss)){
                            String passUpdateSql = "update user set username = '"+newName+"' ,password = '"+newPss+"' where username='"+currentUsername+"'";
                            int userUpdate = statementUpdate(connection, passUpdateSql);
                            if(userUpdate!=0){
                                JOptionPane.showMessageDialog(null, "信息修改成功");
                                oldPassword.setText("");
                                newPassword.setText("");
                                confirmPassword.setText("");
                                username.setEditable(false);
                                oldPassword.setEnabled(false);
                                newPassword.setEnabled(false);
                                confirmPassword.setEnabled(false);
                                modifyBtn.setEnabled(false);
                            }
                        }
                    }
                }catch(Exception e1){
                    e1.getStackTrace();
                }
            }
        });
        editBtn.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                username.setEditable(true);
                oldPassword.setEnabled(true);
                newPassword.setEnabled(true);
                confirmPassword.setEnabled(true);
                modifyBtn.setEnabled(true);
            }
        });
        return LoginFrame.currentUser;
    }
    //查看职员个人信息
    private void checkPersonScore(Connection connection,UserFrame adminFrame) throws SQLException{
        jpanel = new JPanel();
        Object[][] object = null;
        int rowCount = 0;
        ResultSet result;
        String[] columnNames =  { "任务名","绩效"};
        try{
            String sql = "select mission.mname,score from mission,employee_mission where eno = '"+ LoginFrame.currentUser.getEno()+"' and mission.mno = employee_mission.mno";
            result = statementQuery(connection,sql);
            //获取行数
            String countsql = "select count(*) totalCount from employee_mission where eno = '"+ LoginFrame.currentUser.getEno()+"'";
            ResultSet rset = statementQuery(connection, countsql);
            if(rset.next()) {
                rowCount=rset .getInt("totalCount");
            }
            object = new Object[rowCount][2];
            int i=0, j;
            while(result.next()){
                if(result.getString(1) != null){
                    for(j = 0;j<2;j++){
                        object[i][j]=result.getString(j+1);
                    }
                    i++;
                }
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        JTable checkTab = new JTable(object,columnNames);
        checkTab.setEnabled(false);
        JScrollPane scrollpane = new JScrollPane(checkTab);
        scrollpane.setBounds(20,50,500,200);
        jpanel.setLayout(null);
        jpanel.add(scrollpane);
        JLabel tableTitle = new JLabel();
        tableTitle.setText("个人绩效");
        tableTitle.setForeground(Color.BLUE);
        tableTitle.setHorizontalAlignment(SwingConstants.CENTER);
        tableTitle.setBounds(200, 20, 150, 20);
        jpanel.add(tableTitle);
        jpanel.setVisible(true);
        adminFrame.add(jpanel);
        adminFrame.setSize(550,350);
        adminFrame.setResizable(false);
    }
    //动态创建MenuItem
    private void createSpnoItem(Connection connection,JComboBox<String> spnoBox,String dno){
        PreparedStatement pstmt;
        spnoBox.removeAllItems();;
        try {
            pstmt = (PreparedStatement) connection.prepareStatement("select distinct spno from speciality where dno = ? ");
            pstmt.setString(1,dno);
            ResultSet spno = pstmt.executeQuery();
            while(spno.next()){
                spnoBox.addItem(spno.getString(1));
            }
            spnoBox.setSelectedIndex(0);
        } catch (SQLException e1) {
            e1.printStackTrace();
        }
    }
    //根据selection做对应操作
    public void performAction(DbUtil dbUtil, JFrame frame, String selection) {
        if (jpanel != null) {
            frame.remove(jpanel);
        }
        try{
            switch(selection) {
                case AdminFrame.CHECK_STUDENT_INFO:
                    checkStudentInfo(dbUtil.getCon(), (AdminFrame) frame);
                    break;
                case AdminFrame.ADD_STUDENT_INFO:
                    addStudentInfo(dbUtil.getCon(),(AdminFrame) frame);
                    break;
                case AdminFrame.MODIFY_DELETE_STUDENT_INFO:
                    modifyStudentInfo(dbUtil.getCon(),(AdminFrame) frame);
                    break;
                case AdminFrame.ADD_COURSE:
                    addCourse(dbUtil.getCon(),(AdminFrame) frame);
                    break;
                case AdminFrame.MODIFY_DELETE_COURSE:
                    modifyCourse(dbUtil.getCon(),(AdminFrame) frame);
                    break;
                case AdminFrame.EDIT_STUDENT_SCORE:
                    editScore(dbUtil.getCon(),(AdminFrame) frame);
                    break;
                case AdminFrame.MODIFY_PASSWORD:
                    modifyAdMinPassWord(dbUtil.getCon(),(AdminFrame) frame);
                    break;
                case UserFrame.CHECK_MODIFY_PERSONAL_INFO:
                    checkPersonalInfo(dbUtil.getCon(),(UserFrame) frame);
                    break;
                case UserFrame.CHOOSE_COURSE:
                    chooseCourse(dbUtil.getCon(),(UserFrame) frame);
                    break;
                case UserFrame.PRINT_SCORE:
                    checkPersonScore(dbUtil.getCon(),(UserFrame) frame);
                    break;
                case UserFrame.MODIFY_PERSONAL:
                    modifyUserPassWord(dbUtil.getCon(),(UserFrame)frame);
                    break;
            }
        }catch (Exception e) {
            e.printStackTrace();
            JOptionPane.showMessageDialog(null, "操作失败");
        }
    }
    private ResultSet statementQuery(Connection connection,String sql){
        ResultSet result=null;
        try {
            PreparedStatement statement = (PreparedStatement)connection.prepareStatement(sql);
            result = statement.executeQuery();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "操作失败");
            e.printStackTrace();
        }
        return result;
    }
    private int statementUpdate(Connection connection,String sql){
        int result=0;
        try {
            PreparedStatement statement = (PreparedStatement)connection.prepareStatement(sql);
            result = statement.executeUpdate();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "操作失败");
            e.printStackTrace();
        }
        return result;
    }
}