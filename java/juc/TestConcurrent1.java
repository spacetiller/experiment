import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

public class TestConcurrent1 {
    public static void main(String[] args){
        Demo2Thread threadDemo2 = new Demo2Thread();
           for (int i=0;i<10;i++){
               new Thread(threadDemo2).start();
           }
    }
}
//10个线程同时访问
class Demo2Thread implements Runnable{
    private static List<String> list = Collections.synchronizedList(new ArrayList<>());//普通做法
    static {
        list.add("aaa");
        list.add("bbb");
        list.add("ccc");
    }
    @Override
    public void run() {
        Iterator<String> iterator = list.iterator();
        while (iterator.hasNext()){
            System.out.println(iterator.next());//读
            list.add("ddd");//写
        }
    }
}
