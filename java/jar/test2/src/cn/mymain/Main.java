package cn.mymain;
import cn.mytest1.test1;
import cn.mytest2.test2;

public class Main
{
    public static void main(String[] args)
    {
        for(String a:args)
        {
            System.out.println("给定的参数"+a);
        }
        test1 t1 = new test1();
        t1.display();
        test2 t2 = new test2();
        t2.display();
    }
}


