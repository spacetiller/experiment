// Liskov Substitution, LSP: try not to modify parent's method
class A{
	public int func1(int a, int b){
		return a-b;
	}
}

class B extends A{
	public int func1(int a, int b){
		return a+b;
	}

	public int func2(int a, int b){
		return func1(a,b)+100;
	}
}

public class LiskovSubstitution2 {
	public static void main(String[] args){
		B b = new B();
		System.out.println("100-50="+b.func1(100, 50));
		System.out.println("100-80="+b.func1(100, 80));
		System.out.println("100+20+100="+b.func2(100, 20));
	}
}
