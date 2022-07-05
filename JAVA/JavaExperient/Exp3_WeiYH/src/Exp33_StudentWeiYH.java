public class Exp33_StudentWeiYH {
    private String ID;
    private String grade;
    private String name;
    private String major;

    public Exp33_StudentWeiYH(String ID,String name,String grade,String major){
        this.ID=ID;
        this.name=name;
        this.grade=grade;
        this.major=major;
    }

    public String returnID(){
        return ID;
    }
    public String returnInfo(){
        return "学号:"+ID+"\t姓名:"+name+"\t年级:"+grade+"\t专业:"+major;
    }
}
