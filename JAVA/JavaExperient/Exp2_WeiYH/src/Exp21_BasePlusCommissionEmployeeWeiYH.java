import java.util.Calendar;
import java.util.Scanner;

public class Exp21_BasePlusCommissionEmployeeWeiYH extends Exp21_CommissionEmployeeWeiYH{
    @Override
    public int salaryCalculate() {
        int month,saleAmount,sales,base,redEnvelope=100;
        Scanner sc = new Scanner(System.in);
        System.out.print("请输入员工底薪:");
        base=sc.nextInt();
        System.out.print("请输入员工销售量:");
        saleAmount=sc.nextInt();
        System.out.print("请输入员工销售提成(元/件):");
        sales=sc.nextInt();
        if((month= Calendar.getInstance().get(Calendar.MONTH)+1) == birthMonth){
            salary=redEnvelope+sales*saleAmount+base;
            return salary;
        }
        else{
            salary=sales*saleAmount+base;
            return salary;
        }
    }
}
