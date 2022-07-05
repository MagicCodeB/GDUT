import java.util.Scanner;

public class Exp22_ComputeTimeWeiYH {
        public static void main(String[] args) throws Exception {
            Scanner sc=new Scanner(System.in);
            String type=sc.next();
            double v;
            int a,b,c;
            a= sc.nextInt();
            b= sc.nextInt();
            c= sc.nextInt();
            Exp22_CommonWeiYH d=(Exp22_CommonWeiYH)Class.forName(type).getDeclaredConstructor().newInstance();
            v=d.velocity(a,b,c);
            System.out.println("速度为:"+v);
    }
}
