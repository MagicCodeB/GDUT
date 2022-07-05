public class Exp31_CustomerWeiYh extends Thread{
    private String name;
    public Exp31_CustomerWeiYh(String name){
        this.name=name;
    }
    public void run(){
        int times=(int)(Math.random()*5);
        for(int i=0;i<times;i++){
            int money=((int)(Math.random()*9+1)*100);
            Exp31_BankWeiYH.remittance(name,money);
        }
    }
}
