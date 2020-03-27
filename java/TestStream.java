import java.util.*;  

public class TestStream {
	static String s = new String("abc");
	public static void main(String[] args) {
		Arrays.asList("a1", "a2", "b1", "c2", "c1").stream()
			.filter(s -> s.equals("a*"))
			.forEach(System.out::println); 
		Arrays.asList("a1", "a2", "b1", "c2", "c1")  
            .parallelStream()  
            .filter(s -> {  
                System.out.format("filter: %s [%s]\n",  
                    s, Thread.currentThread().getName());  
                return true;  
            })  
            .map(s -> {  
                System.out.format("map: %s [%s]\n",  
                    s, Thread.currentThread().getName());  
                return s.toUpperCase();  
            })  
            .forEach(s -> System.out.format("forEach: %s [%s]\n",  
                s, Thread.currentThread().getName()));  
	}
}

