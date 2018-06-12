import java.util.*;

class Person {
	public int age;
	public String name;
	public void setAge(int age){ this.age = age; }
	public Person(String name,int age){
		this.name = name;
		this.age = age;
	}
}

public class PersonIzp{
	public static void main(String[] args) {

		Set<Person> persons = new HashSet<Person>();
		Person person1 = new Person("izp",23);
		Person person2 = new Person("izp1",24);
		Person person3 = new Person("izp2",25);
		Person person4 = new Person("izp",23);
		persons.add(person1);
		persons.add(person2);
		persons.add(person3);
		persons.add(person4);
		persons.add(person1);
		System.out.println(persons.size());
		System.out.println(persons);
		person1.setAge(21);
		persons.remove(person1);
		System.out.println(persons.size());
		System.out.println(persons);

	}
}

