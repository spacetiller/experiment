import java.math.*

public class Test81 {
    public static void main(String[] args) {
        Formula a=new For();
        a.calculate(1);
        System.out.println(a.sqrt(8));


    }
    interface Formula {
        double calculate(int a);
        default double sqrt(int a) {//这个方法可以在实现类重写，或者直接使用
            return Math.sqrt(a);
        }
    }
    static class For implements Formula{
        @Override
        public double calculate(int a) {
            return 0;
        }

        @Override
        public double sqrt(int a) {
            return 0;
        }
    }
}
