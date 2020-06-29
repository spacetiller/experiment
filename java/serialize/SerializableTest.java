import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;

/**   

 * @Title: SerializableTest.java 

 * @author olive  

 * @date Feb 19, 2016 9:28:30 AM  

 * 序列化： 把对象转换为字节序列的过程

 * 反序列化： 把字节序列恢复为对象的过程

 */

public class SerializableTest implements Serializable{

    /**

     * serializable ID

     */

    private static final long serialVersionUID = -7873944822450384597L;

    private String username;

    private transient String psw;

    public SerializableTest(String username,String psw){

        this.username=username;

        this.psw=psw;

    }

       

    /**

     * @return the username

     */

    public String getUsername() {

        return username;

    }

   

    /**

     * @param username the username to set

     */

    public void setUsername(String username) {

        this.username = username;

    }

   

    /**

     * @return the psw

     */

    public String getPsw() {

        return psw;

    }

   

    /**

     * @param psw the psw to set

     */

    public void setPsw(String psw) {

        this.psw = psw;

    }

    public static void main(String[]args){

        SerializableTest a=new SerializableTest("mary","12345");

        String file="./tmp.txt";

        try {

            System.out.println("username:"+a.getUsername()+" password:"+a.getPsw());

            // 使用ObjectOutputStream将对象SerializableTest序列化，并将其保存到文件中

            FileOutputStream fos=new FileOutputStream(file);

            ObjectOutputStream out=new ObjectOutputStream(fos);

            out.writeObject(a);

            out.flush();

            out.close();

            fos.close();

            // 使用ObjectInputStream将对象反序列化

            ObjectInputStream in=new ObjectInputStream(new FileInputStream(file));

            SerializableTest test=(SerializableTest)in.readObject();

            System.out.println("username:"+test.getUsername()+" password:"+test.getPsw());

            in.close();

        } catch (FileNotFoundException e) {

            // TODO Auto-generated catch block

            e.printStackTrace();

        } catch (IOException e) {

            // TODO Auto-generated catch block

            e.printStackTrace();

        } catch (ClassNotFoundException e) {

            // TODO Auto-generated catch block

            e.printStackTrace();

        }

    }

}
