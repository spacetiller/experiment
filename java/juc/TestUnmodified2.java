import java.util.ArrayList;
import java.util.List;
import java.util.Iterator;

public class TestUnmodified2 {

    public static void main(String[] args) {
        // TODO Auto-generated method stub
        List<Integer> listA=new ArrayList<>();
        listA.add(1);
        listA.add(2);
        listA.add(3);
        listA.add(4);
        listA.add(5);
        listA.add(6);
		
		Iterator<Integer> it_b=listA.iterator();
        while(it_b.hasNext()){
            Integer a=it_b.next();
            if (a==4) {
                it_b.remove();
            }
        }
        for(Integer b:listA){
            System.out.println(b);
        }
    }
}
