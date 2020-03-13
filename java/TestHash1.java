import java.util.HashMap;

public class TestHash1
{
    //程序的主函数入门
    public static void main(String args[])
    {
        //输出打印字符语句
        HashMap<String , Double> map = new HashMap<String , Double>();   
        map.put("语文" , 80.0);   
        map.put("数学" , 89.0);   
        map.put("英语" , 78.2);   
        System.out.println(map.get("数学"));
    }
}
