/*文件载入类，将源文件中的内容输出到字节数组中*/
import java.io.FileInputStream;
import java.io.File;
public class FileLoad {
 public static byte[] getContent(String fileName)throws Exception{
 File file = new File(fileName);
 if(!file.exists()){
  System.out.println("输入有误，该文件不存在");
 }
 FileInputStream fis = new FileInputStream(file);
 int length = (int)file.length();
 byte[] data = new byte[length];
 fis.read(data);
 fis.close();
 return data;
 }
}
