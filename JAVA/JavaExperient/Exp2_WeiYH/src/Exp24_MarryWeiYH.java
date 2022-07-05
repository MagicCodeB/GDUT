import java.util.Scanner;

public class Exp24_MarryWeiYH {
    public static void main(String[] args) {
        Exp24_PersonWeiYH []person=new Exp24_PersonWeiYH[2];
        for(int i=0;i<2;i++){
            person[i]=new Exp24_PersonWeiYH();
            person[i].name=getName();
            person[i].gender=getGender();
            person[i].age=getAge();
            System.out.println("------分割线------");
        }
        person[0].partner=person[0].marry(person[1]);
        if(person[0].partner!=null){
            System.out.println(person[0].name+"的配偶为"+person[0].partner.name);
        }
        else{
            System.out.println("婚配系统关闭!");
        }
    }
    public static String getName(){
        Scanner sc = new Scanner(System.in);
        System.out.print("请输入角色名字:");
        String personName= sc.next();
        return personName;
    }

    public static String getGender(){
        Scanner sc = new Scanner(System.in);
        System.out.print("请输入角色性别(Male/Female):");
        String personGender=sc.next();
        return personGender;
    }

    public static int getAge(){
        Scanner sc = new Scanner(System.in);
        System.out.print("请输入角色年龄:");
        int personAge= sc.nextInt();
        return personAge;
    }
}
