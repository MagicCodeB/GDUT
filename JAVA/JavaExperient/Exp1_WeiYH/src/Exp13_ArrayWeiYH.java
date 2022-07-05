import java.util.Random;

public class Exp13_ArrayWeiYH {
    public static void main(String[] args) {
        int [][] a=new int[5][5];
        int i,j,random;
        int max,maxX,maxY,total=0;
        for(i=0;i<5;i++){
            for(j=0;j<5;j++){
                Random rand=new Random();
                random=rand.nextInt(100);
                a[i][j]=random;
            }
        }
        max=a[0][0];
        maxX=0;
        maxY=0;
        for(i=0;i<5;i++){
            for(j=0;j<5;j++){
                System.out.print(a[i][j]+"  ");
                if(i==j){
                    if(max<a[i][j]){
                        max=a[i][j];
                        maxX=j;
                        maxY=i;
                    }
                }
                if(i==0||i==4||j==0||j==4)total+=a[i][j];
            }
            System.out.print("\n");
        }
        System.out.println("主对角线最小元素为:"+max+"，位置为（"+maxX+","+maxY+")");
        System.out.println("最外一圈元素和为："+total);
    }
}
