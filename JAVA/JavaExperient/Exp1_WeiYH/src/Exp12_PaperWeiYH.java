import java.util.Random;

public class Exp12_PaperWeiYH {
    public static void main(String[] args) {
        int[] a = new int[20];
        int[] b;
        int i, position;
        int temp;
        System.out.print("乱序前数组为：");
        for (i = 0; i < 20; i++) {
            a[i] = i;
            System.out.print(a[i] + " ");
        }
        int length = a.length - 1;
        b=a.clone();
        for (; length > 0; length--) {
            Random rand = new Random();
            position = rand.nextInt(length);
            temp=b[position];
            b[position]=b[length];
            b[length]=temp;
            i--;
        }
        System.out.print("\n");
        System.out.print("乱序后数组为：");
        for (i = 0; i < 20; i++) {
            System.out.print(b[i] + " ");
        }
    }
}
