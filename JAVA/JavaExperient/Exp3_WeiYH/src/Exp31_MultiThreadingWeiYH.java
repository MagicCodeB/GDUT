public class Exp31_MultiThreadingWeiYH {
    public static void main(String[] args) {
        Exp31_CustomerWeiYh customerOne=new Exp31_CustomerWeiYh("曾浩");
        Exp31_CustomerWeiYh customerTwo=new Exp31_CustomerWeiYh("魏耀辉");
        Exp31_CustomerWeiYh customerThree=new Exp31_CustomerWeiYh("区肇洲");
        customerOne.start();
        customerTwo.start();
        customerThree.start();
    }
}
