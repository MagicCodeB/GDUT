public class Exp31_BankWeiYH {
    private static int total=0;
    public synchronized static void remittance(String name ,int money){
        try{
            Thread.sleep((int)(Math.random()*1000));
        }
        catch (InterruptedException e){}
        total+=money;
        System.out.println(name+"向银行汇入"+money+"元");
        System.out.println("当前银行余额为:"+total+"元");
        System.out.print("\n");
    }

}
