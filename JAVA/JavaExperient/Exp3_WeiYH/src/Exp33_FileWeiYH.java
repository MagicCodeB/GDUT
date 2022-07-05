import java.io.*;
import java.util.InputMismatchException;
import java.util.Scanner;
import java.util.regex.Pattern;

public class Exp33_FileWeiYH {
    public static String ID;
    public static String name;
    public static String Grade;
    public static String major;

    public static void main(String[] args) throws IOException {
        System.out.print("请输入需要录入学生的人数:");
        int number=inputNumber();
        Exp33_StudentWeiYH []student=new Exp33_StudentWeiYH[number];
        for(int i=0;i<number;i++){
            inputInfo();
            for(int j=0;j<i;j++){
                while(ID.equals(student[j].returnID())){
                    System.out.println("学号重复，请重新输入");
                    inputInfo();
                }
            }
            Exp33_StudentWeiYH stu=new Exp33_StudentWeiYH(ID,name,Grade,major);
            student[i]=stu;
        }
        File file=new File("studentInfo.txt");
        Write(file,student);
        Read(file);
    }

    public static int inputNumber(){
        try{
            Scanner sc=new Scanner(System.in);
            int amount=sc.nextInt();
            if(amount<=0){
                System.out.println("请输入正整数");
                return inputNumber();
            }
            else return amount;
        }
        catch (InputMismatchException e){
            System.out.println("请输入正整数");
            return inputNumber();
        }
    }

    public static void inputInfo(){
        try{
            Scanner sc=new Scanner(System.in);
            System.out.print("请输入学号:");
            long id=sc.nextLong();
            System.out.print("请输入姓名:");
            name=sc.next();
            System.out.print("请输入年级:");
            int grade=sc.nextInt();
            System.out.print("请输入专业:");
            major=sc.next();
            System.out.print("\n");
            Pattern pattern=Pattern.compile(".*\\d+.*");
            ID=String.valueOf(id);
            Grade=String.valueOf(grade);
            if(pattern.matcher(name).matches()){
                System.out.println("名字输入错误，请重新输入");
                inputInfo();
            }
        }
        catch (InputMismatchException e){
            System.out.println("输入非法，重新输入");
            inputInfo();
        }
    }

    public static void Write(File file,Exp33_StudentWeiYH []student) throws IOException {
        FileWriter fileWriter=new FileWriter(file,false);
        BufferedWriter bufferedWriter=new BufferedWriter(fileWriter);
        for(Exp33_StudentWeiYH stu : student){
            bufferedWriter.write(stu.returnInfo());
            bufferedWriter.newLine();
        }
        bufferedWriter.close();
        fileWriter.close();
    }

    public static void Read(File file) throws IOException {
        FileReader fileReader=new FileReader(file);
        BufferedReader bufferedReader=new BufferedReader(fileReader);
        String s;
        while((s=bufferedReader.readLine())!=null){
            System.out.println(s);
        }
        bufferedReader.close();
        fileReader.close();
    }
}
