import java.util.Scanner;
import java.util.Calendar;

public class Exp21_CommissionEmployeeWeiYH extends Exp21_EmployeeWeiYH{
    @Override
    public int salaryCalculate() {
        int month,saleAmount,sales,redEnvelope=100;
        Scanner sc = new Scanner(System.in);
        System.out.print("请输入员工销售量:");
        saleAmount=sc.nextInt();
        System.out.print("请输入员工销售提成(元/件):");
        sales=sc.nextInt();
        if((month=Calendar.getInstance().get(Calendar.MONTH)+1) == birthMonth){
            salary=redEnvelope+sales*saleAmount;
            return salary;
        }
        else{
            salary=sales*saleAmount;
            return salary;
        }
    }
}
