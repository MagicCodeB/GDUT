import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Scanner;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;

public class DesProject {
    public static void main(String[] args)
    {
        byte[] des_key = new byte[8];//密钥
        byte[] des_input = new byte[8];//明文
        System.out.println("默认明文为：1111111111111111");
        System.out.println("默认密钥为：1111111111111111");
        for (int i = 0; i < 8; i++)
        {
            des_key[i] = 0x11;//设置默认明文为1111111111111111
            des_input[i] = 0x11;//设置默认密钥为1111111111111111
        }
        //加密后的密文为F40379AB9E0EC533
        byte[] des_output = encrypt(des_key, des_input);
        //输出加密结果
        System.out.println("加密结果为：" + byteArrayToHex(des_output));
        BitsArray key = new BitsArray(des_key);
        BitsArray input = new BitsArray(des_input);
        BitsArray output = new BitsArray(des_output);
        //选择想改变位数的是明文或者密钥（当输入其他数值时自动终止程序）
        System.out.print("请选择想要改变明文/密钥(1.明文 2.密钥)：");
        Scanner scan1 = new Scanner(System.in);
        int select = scan1.nextInt();
        if(select > 2 || select < 1)
        {
            System.out.println("请输入正确的选项!");
            System.exit(0);
        }
        if(select == 1)
        {
            //分别计算改变1~64位时的平均改变位数并输出
            for(int bits = 1; bits <= 64; bits++)
            {
                int count = 0; //记录改变的位数的数量
                for(int j = 0; j < 20; j++)//循环20次记录结果
                {
                    HashSet<Integer> hs = new HashSet<Integer>();
                    for(int i = 0; i < bits; i++)
                    {
                        while(hs.size() == i) hs.add((int)(Math.random() * 64));
                    }
                    ArrayList<Integer> list = new ArrayList<Integer>();
                    for(int i: hs) list.add(i);
                    BitsArray inputCopy = input.clone();//克隆一份原明文的备份
                    //对明文进行指定位数的修改
                    for(int i = 0; i < bits; i++)
                    {
                        int pos = list.get(i); //要修改的位的位置
                        if(input.toString().charAt(pos) == '0') input.setOne(pos);
                        else if(input.toString().charAt(pos) == '1') input.setZero(pos);
                    }
                    des_input = input.toByteArray();
                    byte[] des_newOutput = encrypt(des_key, des_input);//使用修改后的明文和原来的密钥进行加密运算，得到新的密文byte数组
                    BitsArray newOutput = new BitsArray(des_newOutput);//将新的密文byte数组转化为位串对象
                    newOutput.xor(output);//与原来输出的密文的位串进行异或操作
                    count += newOutput.OnesCount();//计算异或之后位串中1的个数，即为改变的位数
                    input = inputCopy;//重置已被修改的明文为原明文
                }
                System.out.println("改变明文位数为" + bits + "时，平均密文改变位数为" + ((double) count / 20));
            }
        }
        else if(select == 2)
        {
            for(int bits = 1; bits <= 64; bits++)
            {
                int count = 0;
                for(int j = 0; j < 20; j++)
                {
                    HashSet<Integer> hs = new HashSet<Integer>();
                    for(int i = 0; i < bits; i++)
                    {
                        while(hs.size() == i) hs.add((int)(Math.random() * 64));
                    }
                    ArrayList<Integer> list = new ArrayList<Integer>();
                    for(int i: hs) list.add(i);
                    BitsArray keyCopy = key.clone();
                    for(int i = 0; i < bits; i++)
                    {
                        int pos = list.get(i);
                        if(key.toString().charAt(pos) == '0') key.setOne(pos);
                        else if(key.toString().charAt(pos) == '1') key.setZero(pos);
                    }
                    des_key = key.toByteArray();
                    byte[] des_newOutput = encrypt(des_key, des_input);
                    BitsArray newOutput = new BitsArray(des_newOutput);
                    newOutput.xor(output);
                    count += newOutput.OnesCount();
                    key = keyCopy;
                }
                System.out.println("改变密钥位数为" + bits + "时，平均密文改变位数为" + ((double) count / 20));
            }
        }
        scan1.close();
    }
    //将字节数组输出为16进制串
    public static String byteArrayToHex(byte[] bs)
    {
        StringBuilder res = new StringBuilder();

        for(byte b: bs) res.append(String.format("%02X", (b & 0xff)));

        return res.toString();
    }
    //DES加密算法
    public static byte[] encrypt(byte[] des_key, byte[] des_input)
    {

        Cipher des = null;//DES加密算法
        byte[] des_output = null;//加密后的输出
        SecretKey secretKey = new SecretKeySpec(des_key, "DES"); //创建DES密钥
        //创建DES密码算法对象，指定电码本模式和无填充方式
        try
        {
            des = Cipher.getInstance("DES/ECB/NoPadding");
        }
        catch (NoSuchAlgorithmException | NoSuchPaddingException e)
        {
            e.printStackTrace();
        }
        try
        {
            des.init(Cipher.ENCRYPT_MODE, secretKey);
        } catch (InvalidKeyException e)
        {
            e.printStackTrace();
        }
        try
        {
            des_output = des.doFinal(des_input);
        } catch (IllegalBlockSizeException | BadPaddingException e)
        {
            e.printStackTrace();
        }
        return des_output;
    }
}

class BitsArray
{
    private String str;
    BitsArray(int length)
    {
        StringBuffer sb = new StringBuffer();
        for(int i = 0; i < length; i++) sb.append("0");
        str = sb.toString();
    }
    BitsArray(byte[] bs)
    {
        fromByteArray(bs);
    }
    int length()
    {
        return str.length();
    }
    void fromByteArray(byte[] bs)
    {
        StringBuffer result = new StringBuffer();
        for (int i = 0; i < bs.length; i++)
        {
            int length = Long.toString(bs[i] & 0xff, 2).length();
            String str = "";
            if(length < 8)
            {
                StringBuffer sb = new StringBuffer();
                for(int j = 0; j < 8 - length; j++) sb.append("0");
                str = sb.toString();
            }
            result.append(str + Long.toString(bs[i] & 0xff, 2));
        }
        str =  result.toString();
    }
    byte[] toByteArray()
    {
        String[] temp = new String[8];
        int pos = 0;
        for(int i = 0; i < 8; i++)
        {
            temp[i] = str.substring(pos, pos + 8);
            pos += 8;
        }
        byte[] b = new byte[8];
        for (int i = 0; i < b.length; i++) b[i] = Long.valueOf(temp[i], 2).byteValue();
        return b;
    }

    void xor(BitsArray other)
    {
        String otherStr = other.toString();
        char[] cs = str.toCharArray();
        for(int i = 0; i < otherStr.length(); i++)
        {
            if(str.charAt(i) == otherStr.charAt(i)) cs[i] = '0';
            else cs[i] = '1';
        }
        str = Arrays.toString(cs).replaceAll("[\\[\\]\\s,]", "");
    }

    int OnesCount()
    {
        int count = 0;
        for(int i = 0; i < str.length(); i++) if(str.charAt(i) == '1') count++;

        return count;
    }

    @Override
    protected BitsArray clone()
    {
        byte[] bs = toByteArray();
        BitsArray bitsArray = new BitsArray(bs);

        return bitsArray;
    }

    void setOne(int index)
    {
        char[] cs = str.toCharArray();
        cs[index] = '1';
        str = Arrays.toString(cs).replaceAll("[\\[\\]\\s,]", "");
    }

    void setZero(int index)
    {
        char[] cs = str.toCharArray();
        cs[index] = '0';
        str = Arrays.toString(cs).replaceAll("[\\[\\]\\s,]", "");
    }

    void set(int index, int value)
    {
        char[] cs = str.toCharArray();
        cs[index] = (char) ('0' + value);
        str = Arrays.toString(cs).replaceAll("[\\[\\]\\s,]", "");
    }

    @Override
    public String toString()
    {
        return str.toString();
    }
}
