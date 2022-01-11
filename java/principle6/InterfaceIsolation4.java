// Interface Isolation, IIP, design interface
interface I1 {
	public void method1();
}

interface I2 {
	public void method2();
	public void method3();
}

interface I3 {
	public void method4();
	public void method5();
}

class A{
	public void depend1(I1 i){
		i.method1();
	}
	public void depend2(I2 i){
		i.method2();
	}
	public void depend3(I2 i){
		i.method3();
	}
}

class B implements I1, I2{
	public void method1() {
		System.out.println("类B实现接口I1的方法1");
	}
	public void method2() {
		System.out.println("类B实现接口I2的方法2");
	}
	public void method3() {
		System.out.println("类B实现接口I2的方法3");
	}
}

class C{
	public void depend1(I1 i){
		i.method1();
	}
	public void depend2(I3 i){
		i.method4();
	}
	public void depend3(I3 i){
		i.method5();
	}
}

class D implements I1, I3{
	public void method1() {
		System.out.println("类D实现接口I1的方法1");
	}
	public void method4() {
		System.out.println("类D实现接口I3的方法4");
	}
	public void method5() {
		System.out.println("类D实现接口I3的方法5");
	}
}
public class InterfaceIsolation4 {
	public static void main(String[] args){
		A a = new A();
		a.depend1(new B());
		a.depend2(new B());
		a.depend3(new B());

		C c = new C();
		c.depend1(new D());
		c.depend2(new D());
		c.depend3(new D());
	}
}
