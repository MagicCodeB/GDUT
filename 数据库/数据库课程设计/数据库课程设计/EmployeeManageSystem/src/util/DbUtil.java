package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbUtil{

    private String dbUrl = "jdbc:mysql://localhost:3306/managesystem?characterEncoding=utf8&useSSL=false";
    private String dbUsername = "root";
    private String dbPassword = "WYHyuwen917";
    private String jdbcName = "com.mysql.jdbc.Driver";
    public Connection getCon() throws Exception{
        Class.forName(jdbcName);
        Connection con = DriverManager.getConnection(dbUrl,dbUsername,dbPassword);
        return con;
    }
    public void closeCon(Connection con) throws SQLException{
        if(con!=null){
            con.close();
        }
    }
}
