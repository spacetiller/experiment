public class StrTest {
	static String s = new String("abc");
	public static void main(String[] args) {
		String a = "abc";
		String a1 = new String("abc");
		String a2 = "abc";
		System.out.println(a == a1);
		System.out.println(a==a2);
		StrTest st = new StrTest();
		st.fun(s);
		System.out.println(s);
		String e = "";
		System.out.println(e == "");
		System.out.println("abcd\t=\t1111");
		System.out.println("e\t=\t555555555");
		System.out.println("dkasdlfsldf\t=\t666");
	}
	void fun(String s) {
		s = "def";
		System.out.println(this.s == s);
	}
}

