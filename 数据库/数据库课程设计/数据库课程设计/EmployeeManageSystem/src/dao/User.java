package dao;

public class User {
    private String role;
    private String username;
    private String password;
    private String eno;
    public User() {
        super();
    }
    public User(String role, String username, String password) {
        super();
        this.role = role;
        this.username = username;
        this.password = password;
    }
    public String getRole() {
        return role;
    }
    public String getUsername() {
        return username;
    }
    public void setUsername(String username) {
        this.username = username;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public String getEno() {
        return eno;
    }
    public void setEno(String eno) {
        this.eno = eno;
    }
}
