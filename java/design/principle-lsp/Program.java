internal class Program
{
    private static void Main(string[] args)
    {
        A a = new A();
        Console.WriteLine($"100-50={(a.func1(100, 50))}");

        B b = new B();
        Console.WriteLine($"100-50={(b.func1(100, 50))}");
        Console.WriteLine($"100-50={(b.func2(100, 50))}");

        Console.ReadKey();
    }
}

internal class A
{
    public int func1(int num1, int num2)
    {
        return num1 - num2;
    }
}

internal class B : A
{
    //public int func1(int num1, int num2)
    //{
    //    return num1 + num2;
    //}

    public int func2(int num1, int num2)
    {
        return func1(num1, num2) + 100;
    }
}

