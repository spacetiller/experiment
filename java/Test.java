//package test;
/*
 * @param none
 * @return void
 * @author Juncheng
 * @version 0.1
 */
import java.math.BigDecimal;
public class Test
{
      //程序的主函数入门
	  public static void main(String args[])
	  {
	      //输出打印字符语句
	      int i = 10;
	      char czh = '\u9999';
		  double d = 5.123456789;
		  double f = 5.123456789f;

		  int f1 = 0x80000001;
		  float f2 = f1;
	  
	      System.out.println("Charzh: " + czh);
	      System.out.println("Double: " + Double.toString(d));
	      System.out.println("Float : " + f);
		  System.out.printf("1000.0/3.0: %,.2f",1000.0/3.0);
		  System.out.println("Double 的取值范围：\n" + Double.MAX_VALUE+"---->" + Double.MIN_VALUE);
		  System.out.println("Float 的取值范围：" + Float.MAX_VALUE+"---->" + Float.MIN_VALUE);
	      System.out.println("Float 1 : " + f2);

		  BigDecimal bd = new BigDecimal(Double.toString(d));
		  System.out.println("BigDecimal: " + String.valueOf(bd));
		  System.out.println("BigDecimal::multiply() : " + bd.multiply(new BigDecimal(0.1)).doubleValue());

		  long creditCardNumber = 1234_5678_9012_3456L;
long socialSecurityNumber = 999_99_9999L;
float pi = 	3.14_15F;
long hexBytes = 0xFF_EC_DE_5E;
long hexWords = 0xCAFE_BABE;
long maxLong = 0x7fff_ffff_ffff_ffffL;
byte nybbles = 0b0010_0101;
long bytes = 0b11010010_01101001_10010100_10010010;
		
		System.out.println(new BigDecimal(0.1).toString()); // 0.1000000000000000055511151231257827021181583404541015625
System.out.println(new BigDecimal("0.1").toString()); // 0.1
System.out.println(new BigDecimal(
Double.toString(0.1000000000000000055511151231257827021181583404541015625)).toString());// 0.1
System.out.println(new BigDecimal(Double.toString(0.1)).toString()); // 0.1


	  }
}
