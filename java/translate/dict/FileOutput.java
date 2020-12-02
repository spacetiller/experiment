import java.io.File;
import java.io.FileOutputStream;
public class FileOutput {
 public static void output(String text,String fileName)throws Exception{
 File file = new File(fileName);
 FileOutputStream fos = new FileOutputStream(file);
 fos.write(text.getBytes());
 fos.close();
 }
}
