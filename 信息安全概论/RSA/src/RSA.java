import java.util.Scanner;

public class RSA {
    int p=0, q=0, e=0, d=0, n=0;//初始化RSA算法参数
    static int x = -1, y = -1;
    private Scanner scan = new Scanner(System.in);

    void generateKey()
    {
        primeNumberJudgment();//输入两个素数并进行检验
        this.n = this.p * this.q;//计算n=p*q
        int euler = (this.p - 1) * (this.q - 1);//计算欧拉函数euler=(p-1)*(q-1)
        this.e = selectE(euler);//选择与euler互质的数e
        this.d = extend_gcd(e, euler);//使用拓展欧几里得算法求d
        this.d = this.d < 0 ? this.d + euler : this.d;
    }

    private int extend_gcd(int a,int b)
    {
        if(b == 0) {
            x = 1;
            y = 0;
            return x;
        }
        else{
            extend_gcd(b, a % b);
            int t = x;
            x = y;
            y = t - a / b * y;
            return x;
        }
    }

    private int selectE(int euler)
    {
        System.out.print("请输入选择的素数e:");
        int temp = scan.nextInt();
        if(gcd(euler, temp) == 1) return temp;
        else {
            System.out.println("请重新选择并输入素数e!");
            return selectE(euler);
        }
    }

    private int gcd(int m, int n)
    {
        if(n == 0) return m;
        int r = m % n;
        return gcd(n,r);
    }

    private void primeNumberJudgment()
    {
        System.out.print("请输入素数p或者素数q: ");
        int temp = scan.nextInt();
        int root = (int) Math.sqrt(temp);
        boolean isPrime = true;
        for(int i = 2; i <= root; i++) {
            if(temp % i == 0) {
                isPrime = false;
                break;
            }
        }
        if(isPrime == false) {
            System.out.println("请重新输入!");
            primeNumberJudgment();
        }
        else {
            if(this.p == 0) {
                this.p = temp;
                primeNumberJudgment();
            }
            else {
                if(this.q == 0) this.q = temp;
            }
        }
    }

    int encrypt()
    {
        System.out.print("请输入需要加密的整形明文: ");
        int m = scan.nextInt();
        if(m >= this.n) {
            System.out.println("明文不合法，请重新输入明文!");
            encrypt();
        }

        return (int) exp_mod(m, e, n);
    }

    int decrypt()
    {
        System.out.print("请输入需要解密的整形密钥: ");
        int c = scan.nextInt();
        return (int) exp_mod(c, d, n);
    }

    private long exp_mod(long a, long n, long b)
    {
        long t;
        if(n == 0) return 1 % b;
        if(n == 1) return a % b;
        t = exp_mod(a, n / 2, b);
        t = t * t % b;
        if((n&1) == 1) t = t * a % b;
        return t;
    }

    public static void main(String[] args)
    {
        RSA rsa = new RSA();
        rsa.generateKey();
        System.out.println();
        System.out.println("公钥KU = {" + rsa.e + ", " + rsa.n + "}");
        System.out.println("私钥KR = {" + rsa.d + ", " + rsa.n + "}");
        System.out.println();
        int ciphertext = rsa.encrypt();
        System.out.println("加密后的密钥是" + ciphertext);
        System.out.println();
        int plaintext = rsa.decrypt();
        System.out.println("解密后的明文是" + plaintext);
    }
}
