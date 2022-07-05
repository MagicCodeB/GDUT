import java.util.Scanner;

class Car007 implements Exp22_CommonWeiYH {
    @Override
    public double velocity(double a,double b,double c) {
        if(c==0){
            System.out.println("参数C错误！");
            return 0;
        }
        else return a*b/c;
    }
}
