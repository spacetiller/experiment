import java.io.IOException;
import java.io.FileNotFoundException;
import java.io.File;
import java.io.Externalizable;
import java.io.FileOutputStream;
import java.io.FileInputStream;
import java.io.ObjectOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutput;
import java.io.ObjectInput;

public class ExternalizableTest {
	public static void main(String[] args) throws Exception, IOException {
		SerializeUser();
		DeSerializeUser();
    }
	//序列化
	private static void SerializeUser() throws FileNotFoundException, IOException {
        User1 user = new User1();
        user.setName("Java上P8");
        ObjectOutputStream oos = new ObjectOutputStream(new FileOutputStream("./template"));
        oos.writeObject(user);
        oos.close();
        System.out.println("使用Externalizable接口，添加了transient关键字序列化之前："+user.toString());
	}
	//反序列化
	private static void DeSerializeUser() throws IOException, ClassNotFoundException {
        File file = new File("./template");
        ObjectInputStream ois = new ObjectInputStream(new FileInputStream(file));
        User1 newUser = (User1)ois.readObject();
        System.out.println("使用Externalizable接口，添加了transient关键字序列化之后："+newUser.toString());
	}
}
class User1 implements Externalizable{	
	private transient String name;
	//private final transient Logger logger = Logger.getLogger("demo");

	public void User1(){
	}
	
	public void setName(String name){
		this.name = name;
	}
    
	@Override
	public void writeExternal(ObjectOutput out) throws IOException {
		try {
			out.writeObject(name);
		} catch(Exception e){ }
	}
	@Override
	public void readExternal(ObjectInput in) throws IOException {
		try {
			name = (String) in.readObject();
		} catch(Exception e){ }
	}
}
