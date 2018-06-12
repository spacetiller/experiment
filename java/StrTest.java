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
	}
	void fun(String s) {
		s = "def";
		System.out.println(this.s == s);
	}
}

