package socket;  
  
import java.io.*;  
import java.net.*;  
  
public class MyServer {  
    public static void main(String[] args) throws IOException{  
        ServerSocket svrSocket = new ServerSocket(8080);  
        while(true){  
            Socket socket = svrSocket.accept();  
            //�㹻���һ��������  
            byte[] buf = new byte[1024*1024];  
            InputStream in = socket.getInputStream();  
            int byteRead = in.read(buf, 0, 1024*1024);  
            String dataString = new String(buf, 0, byteRead);  
            System.out.println(dataString);  
            in.close();  
            socket.close();  
        }  
    }  
}  