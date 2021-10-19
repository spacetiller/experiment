import java.math.*;

public class TestFor {
    public static void main(String[] args) {
        //Formula a=new For();
        //a.calculate(1);
        //System.out.println(a.sqrt(8));

		int total = 10;
		boolean hit = false;
		for(int i=0; i<total; i++) {
			System.out.println(""+i);
			if(i == 8 && ! hit) { 
				total = 20;
				i = -1;
				hit = true;
			}
		}
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
