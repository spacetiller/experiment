import java.util.ArrayList;
import java.util.List;

public class TestUnmodified {

    public static void main(String[] args) {
        // TODO Auto-generated method stub
        List<Integer> listA=new ArrayList<>();
        listA.add(1);
        listA.add(2);
        listA.add(3);
        listA.add(4);
        listA.add(5);
        listA.add(6);

        for(Integer a:listA){
			System.out.println(a);
            if (a==3) {
                listA.remove(3);
            }
        }
    }
}
