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


