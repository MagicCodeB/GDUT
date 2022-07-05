import java.util.Calendar;
import java.util.Scanner;

public class Exp21_SalariedEmployeeWeiYH extends Exp21_EmployeeWeiYH{
    @Override
    public int salaryCalculate() {
        int month,redEnvelope=100;
        System.out.print("请输入员工固定月薪:");
        salary=new Scanner(System.in).nextInt();
        if((month= Calendar.getInstance().get(Calendar.MONTH)+1) == birthMonth){
            salary+=redEnvelope;
            return salary;
        }
        else return salary;
    }
}
