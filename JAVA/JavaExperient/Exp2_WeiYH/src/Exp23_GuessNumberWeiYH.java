import java.util.Scanner;

public class Exp23_GuessNumberWeiYH {
    public static void main(String[] args) {
        int choice,guessNumber,i,guess,score=0;
        int option,option1;
        boolean flag=true;
        System.out.println("***欢迎来到猜数游戏！***");
        System.out.println("1.开始游戏  2.退出");
        System.out.print("请输入:");
        Scanner sc=new Scanner(System.in);
        choice= sc.nextInt();
        while(flag){
            switch (choice){
                case 1:{
                    System.out.println("游戏开始！");
                    guessNumber=(int)(Math.random()*99);
                    if(!flag)break;
                    check :goOn :
                    for(i=0;i<3;i++){
                        System.out.println("目前是第"+(i+1)+"次机会，还剩下"+(3-i)+"次机会");
                        System.out.print("请输入你猜的数:");
                        guess= sc.nextInt();
                        if(guess==guessNumber){
                            if(i==0)score+=3;
                            else if(i==1)score+=2;
                            else if(i==2)score+=1;
                            System.out.println("你猜对啦！目前总分是"+score);
                            System.out.println("***是否再来一次***");
                            System.out.println("1.再来一次  2.退出");
                            option=sc.nextInt();
                            switch (option){
                                case 1:{
                                    break goOn;
                                }
                                case 2:{
                                    flag=false;
                                    break check;
                                }
                            }
                        }
                        if(guess<guessNumber){
                            System.out.println("太小啦!");
                            if(i==2)score-=2;
                            System.out.println("目前总分是:"+score);
                        }
                        if(guess>guessNumber){
                            System.out.println("太大啦!");
                            if(i==2)score-=2;
                            System.out.println("目前总分是:"+score);
                        }
                    }
                    if(i==3){
                        System.out.println("游戏失败，正确数字是:"+guessNumber);
                        System.out.println("***是否再来一次***");
                        System.out.println("1.再来一次  2.退出");
                        option1=sc.nextInt();
                        switch (option1){
                            case 1:{
                                flag=true;
                                break;
                            }
                            case 2:{
                                flag=false;
                                break;
                            }
                        }
                    }
                    break;
                }
                case 2:{
                    flag=false;
                    break;
                }
            }
        }
        sc.close();
        System.out.println("您最后的总分是:"+score);
        System.out.println("游戏关闭，感谢您的游玩！");
    }
}
