import java.util.Calendar;
import java.util.Scanner;

public class Exp21_HourlyEmployeeWeiYH extends Exp21_EmployeeWeiYH{
    @Override
    public int salaryCalculate() {
        int month,workHour,hourSalary,extraFee,redEnvelope=100;
        Scanner sc = new Scanner(System.in);
        System.out.print("请输入员工的工作时长:");
        workHour=sc.nextInt();
        System.out.print("请输入员工的时薪:");
        hourSalary=sc.nextInt();
        System.out.print("请输入员工的每小时加班费:");
        extraFee=sc.nextInt();
        if(workHour<160){
            salary=workHour*hourSalary;
        }
        else{
            salary=workHour*hourSalary+extraFee*(workHour-160);
        }
        if((month= Calendar.getInstance().get(Calendar.MONTH)+1) == birthMonth){
            salary+=redEnvelope;
            return salary;
        }
        else return salary;
    }
}
