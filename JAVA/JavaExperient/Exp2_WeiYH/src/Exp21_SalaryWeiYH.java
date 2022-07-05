import java.util.Scanner;

public class Exp21_SalaryWeiYH {
    public static void main(String[] args) {
        int choice;
        Exp21_EmployeeWeiYH []employee = new Exp21_EmployeeWeiYH[4];
        employee[0]=new Exp21_SalariedEmployeeWeiYH();
        employee[1]=new Exp21_HourlyEmployeeWeiYH();
        employee[2]=new Exp21_CommissionEmployeeWeiYH();
        employee[3]=new Exp21_BasePlusCommissionEmployeeWeiYH();
        System.out.println("**员工薪资支付系统**");
        System.out.println("员工类型 1.固定月薪 2.计时取薪 3.按销售额提成 4.带底薪并按销售额提成");
        System.out.print("请输入:");
        Scanner sc = new Scanner(System.in);
        choice= sc.nextInt();
        switch (choice){
            case 1:{
                employee[0].ID=getID();
                employee[0].name=getName();
                employee[0].birthYear=getBirthYear();
                employee[0].birthMonth=getBirthMonth();
                System.out.println("员工工资为:"+ employee[0].salaryCalculate());
                System.out.println("员工ID为:"+employee[0].ID);
                System.out.println("员工姓名为:"+employee[0].name);
                System.out.println("员工生日为:"+employee[0].birthYear+"年"+employee[0].birthMonth+"月");
               break;
            }
            case 2:{
                employee[1].ID=getID();
                employee[1].name=getName();
                employee[1].birthYear=getBirthYear();
                employee[1].birthMonth=getBirthMonth();
                System.out.println("员工工资为:"+ employee[1].salaryCalculate());
                System.out.println("员工ID为:"+employee[1].ID);
                System.out.println("员工姓名为:"+employee[1].name);
                System.out.println("员工生日为:"+employee[1].birthYear+"年"+employee[0].birthMonth+"月");
                break;
            }
            case 3:{
                employee[2].ID=getID();
                employee[2].name=getName();
                employee[2].birthYear=getBirthYear();
                employee[2].birthMonth=getBirthMonth();
                System.out.println("员工工资为:"+ employee[2].salaryCalculate());
                System.out.println("员工ID为:"+employee[2].ID);
                System.out.println("员工姓名为:"+employee[2].name);
                System.out.println("员工生日为:"+employee[2].birthYear+"年"+employee[2].birthMonth+"月");
                break;
            }
            case 4:{
                employee[3].ID=getID();
                employee[3].name=getName();
                employee[3].birthYear=getBirthYear();
                employee[3].birthMonth=getBirthMonth();
                System.out.println("员工工资为:"+ employee[3].salaryCalculate());
                System.out.println("员工ID为:"+employee[3].ID);
                System.out.println("员工姓名为:"+employee[3].name);
                System.out.println("员工生日为:"+employee[3].birthYear+"年"+employee[3].birthMonth+"月");
                break;
            }
        }
    }

    public static String getName(){
        Scanner sc = new Scanner(System.in);
        System.out.print("请输入员工名字:");
        String employeeName= sc.next();
        return employeeName;
    }

    public static int getID(){
        Scanner sc = new Scanner(System.in);
        System.out.print("请输入员工ID:");
        int employeeID=sc.nextInt();
        return employeeID;
    }

    public static int getBirthMonth(){
        Scanner sc = new Scanner(System.in);
        System.out.print("请输入员工生日月份:");
        int employeeMonth= sc.nextInt();
        return employeeMonth;
    }

    public static int getBirthYear(){
        Scanner sc = new Scanner(System.in);
        System.out.print("请输入员工生日年份:");
        int employeeYear= sc.nextInt();
        return employeeYear;
    }
}
