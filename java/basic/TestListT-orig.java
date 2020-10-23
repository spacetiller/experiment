import java.util.ArrayList;
import java.util.List;
public class TestListT {
	public static void main(String[] args) {
	
		//第一段：泛型出现之前集合定义方式
		List a1 =new ArrayList();
		a1.add(new Object());
		a1.add(new Integer(10));
		a1.add(new String("string"));
		
		//第二段：把a1引用赋值给a2,(a2与a1的区别是增加了泛型限制)
		List<Object> a2 =a1;
		a2.add(new Object());
		a2.add(new Integer(20));
		a2.add(new String("string2"));
		a2.add(25);
		//List<Object> 接受其他泛型赋值时,会报异常（因为在下面例子中List<Integer>不能转为List<Object>）
		List<Integer> aint = new ArrayList<Integer>();
		List<Object> a22 =aint;//Type mismatch: cannot convert from List<Integer> to List<Object>
		
		//第三段：把a1引用赋值给a3,（a3与a1的区别是增加了泛型<Integer>）
		List<Integer> a3 = a1; //此时如果遍历a3则会报类型转换异常ClassCastException
		a3.add(new Integer(20));
		//下面两行编译出错，不允许增加非Integer类型进入集合
		a3.add(new Object());//The method add(Integer) in the type List<Integer> is not applicable for the arguments (Object)
		a3.add(new String("string2"));
		
		//第四段：把a1引用赋值给a4,a4与a1的区别是增加了通配符
		List<?> a4 = a1;
		//允许删除和清除元素
		a4.remove(0);
		a4.clear();
		//编译错误，不允许添加任何元素
		a4.add(new Object());//The method add(capture#3-of ?) in the type List<capture#3-of ?> is not applicable for the arguments (Object)
		a4.add(new Integer(20));
		a4.add(new String("string2"));
	}
}
