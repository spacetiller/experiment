package socket;  
  
import java.io.*;  
import java.net.*;  
/** 
 * MyHttpServer ʵ��һ���򵥵�HTTP�������ˣ����Ի�ȡ�û��ύ������ 
 * �����û�һ��response 
 * ��Ϊʱ��Ĺ�ϵ����httpͷ�Ĵ����Եò��淶 
 * �����ϴ���������ʱֻ�ܽ���ֻ�ϴ�һ���������Ҹ���λ���ڵ�һ������� 
 * ת����ע������http://blog.csdn.net/sunxing007 
 * **/  
public class MyHttpServer {  
    //��������Ŀ¼��post.html, upload.html�����ڸ�λ��  
    public static String WEB_ROOT = "c:/root";  
    //�˿�  
    private int port;  
    //�û�������ļ���url  
    private String requestPath;  
    //mltipart/form-data��ʽ�ύpost�ķָ���,   
    private String boundary = null;  
    //post�ύ��������ĵĳ���  
    private int contentLength = 0;  
  
    public MyHttpServer(String root, int port) {  
        WEB_ROOT = root;  
        this.port = port;  
        requestPath = null;  
    }  
    //����GET����  
    private void doGet(DataInputStream reader, OutputStream out) throws Exception {  
        if (new File(WEB_ROOT + this.requestPath).exists()) {  
            //�ӷ�������Ŀ¼���ҵ��û�������ļ������ͻ������  
            InputStream fileIn = new FileInputStream(WEB_ROOT + this.requestPath);  
            byte[] buf = new byte[fileIn.available()];  
            fileIn.read(buf);  
            out.write(buf);  
            out.close();  
            fileIn.close();  
            reader.close();  
            System.out.println("request complete.");  
        }  
    }  
    //����post����  
    private void doPost(DataInputStream reader, OutputStream out) throws Exception {  
        String line = reader.readLine();  
        while (line != null) {  
            System.out.println(line);  
            line = reader.readLine();  
            if ("".equals(line)) {  
                break;  
            } else if (line.indexOf("Content-Length") != -1) {  
                this.contentLength = Integer.parseInt(line.substring(line.indexOf("Content-Length") + 16));  
            }  
            //����Ҫ�ϴ������� ��ת��doMultiPart������  
            else if(line.indexOf("multipart/form-data")!= -1){  
                //��multiltipart�ķָ���  
                this.boundary = line.substring(line.indexOf("boundary") + 9);  
                this.doMultiPart(reader, out);  
                return;  
            }  
        }  
        //������ȡ��ͨpost��û�и������ύ������  
        System.out.println("begin reading posted data......");  
        String dataLine = null;  
        //�û����͵�post��������  
        byte[] buf = {};  
        int size = 0;  
        if (this.contentLength != 0) {  
            buf = new byte[this.contentLength];  
            while(size<this.contentLength){  
                int c = reader.read();  
                buf[size++] = (byte)c;  
                  
            }  
            System.out.println("The data user posted: " + new String(buf, 0, size));  
        }  
        //���ͻ������������  
        String response = "";  
        response += "HTTP/1.1 200 OK/n";  
        response += "Server: Sunpache 1.0/n";  
        response += "Content-Type: text/html/n";  
        response += "Last-Modified: Mon, 11 Jan 1998 13:23:42 GMT/n";  
        response += "Accept-ranges: bytes";  
        response += "/n";  
        String body = "<html><head><title>test server</title></head><body><p>post ok:</p>" + new String(buf, 0, size) + "</body></html>";  
        System.out.println(body);  
        out.write(response.getBytes());  
        out.write(body.getBytes());  
        out.flush();  
        reader.close();  
        out.close();  
        System.out.println("request complete.");  
    }  
    //������  
    private void doMultiPart(DataInputStream reader, OutputStream out) throws Exception {  
        System.out.println("doMultiPart ......");  
        String line = reader.readLine();  
        while (line != null) {  
            System.out.println(line);  
            line = reader.readLine();  
            if ("".equals(line)) {  
                break;  
            } else if (line.indexOf("Content-Length") != -1) {  
                this.contentLength = Integer.parseInt(line.substring(line.indexOf("Content-Length") + 16));  
                System.out.println("contentLength: " + this.contentLength);  
            } else if (line.indexOf("boundary") != -1) {  
                //��ȡmultipart�ָ���  
                this.boundary = line.substring(line.indexOf("boundary") + 9);  
            }  
        }  
        System.out.println("begin get data......");  
        /*�����ע����һ����������ʹ������������ȫ�ģ��������Ķ���˵���Ե�����***** 
        <HTTPͷ��������> 
        ............ 
        Cache-Control: no-cache 
        <������һ�����У����������������ݶ���Ҫ�ύ������> 
        -----------------------------7d925134501f6<����multipart�ָ���> 
        Content-Disposition: form-data; name="myfile"; filename="mywork.doc" 
        Content-Type: text/plain 
         
        <��������>........................................ 
        ................................................. 
         
        -----------------------------7d925134501f6<����multipart�ָ���> 
        Content-Disposition: form-data; name="myname"<�����ֶλ򸽼�> 
        <������һ������> 
        <�����ֶλ򸽼�������> 
        -----------------------------7d925134501f6--<����multipart�ָ��������һ���ָ���������-> 
        ****************************************************************/  
        /** 
         * �����ע����һ����������multipart���͵�POST��ȫ��ģ�ͣ� 
         * Ҫ�Ѹ���ȥ����������Ҫ�ҵ��������ĵ���ʼλ�úͽ���λ�� 
         * **/  
        if (this.contentLength != 0) {  
            //�����е��ύ�����ģ����������������ֶζ��ȶ���buf.  
            byte[] buf = new byte[this.contentLength];  
            int totalRead = 0;  
            int size = 0;  
            while (totalRead < this.contentLength) {  
                size = reader.read(buf, totalRead, this.contentLength - totalRead);  
                totalRead += size;  
            }  
            //��buf����һ���ַ������������ַ�������ļ�����������ڵ�λ��  
            String dataString = new String(buf, 0, totalRead);  
            System.out.println("the data user posted:/n" + dataString);  
            int pos = dataString.indexOf(boundary);  
            //�����Թ�4�о��ǵ�һ��������λ��  
            pos = dataString.indexOf("/n", pos) + 1;  
            pos = dataString.indexOf("/n", pos) + 1;  
            pos = dataString.indexOf("/n", pos) + 1;  
            pos = dataString.indexOf("/n", pos) + 1;  
            //������ʼλ��  
            int start = dataString.substring(0, pos).getBytes().length;  
            pos = dataString.indexOf(boundary, pos) - 4;  
            //��������λ��  
            int end = dataString.substring(0, pos).getBytes().length;  
            //�����ҳ�filename  
            int fileNameBegin = dataString.indexOf("filename") + 10;  
            int fileNameEnd = dataString.indexOf("/n", fileNameBegin);  
            String fileName = dataString.substring(fileNameBegin, fileNameEnd);  
            /** 
             * ��ʱ���ϴ����ļ���ʾ�������ļ���·��,����c:/my file/somedir/project.doc 
             * ����ʱ��ֻ��ʾ�ļ������֣�����myphoto.jpg. 
             * ������Ҫ��һ���жϡ� 
            */  
            if(fileName.lastIndexOf("//")!=-1){  
                fileName = fileName.substring(fileName.lastIndexOf("//") + 1);  
            }  
            fileName = fileName.substring(0, fileName.length()-2);  
            OutputStream fileOut = new FileOutputStream("c://" + fileName);  
            fileOut.write(buf, start, end-start);  
            fileOut.close();  
            fileOut.close();  
        }  
        String response = "";  
        response += "HTTP/1.1 200 OK/n";  
        response += "Server: Sunpache 1.0/n";  
        response += "Content-Type: text/html/n";  
        response += "Last-Modified: Mon, 11 Jan 1998 13:23:42 GMT/n";  
        response += "Accept-ranges: bytes";  
        response += "/n";  
        out.write("<html><head><title>test server</title></head><body><p>Post is ok</p></body></html>".getBytes());  
        out.flush();  
        reader.close();  
        System.out.println("request complete.");  
    }  
  
    public void service() throws Exception {  
        ServerSocket serverSocket = new ServerSocket(this.port);  
        System.out.println("server is ok.");  
        //����serverSocket�ȴ��û���������Ȼ�������������������  
        //��������ֻ���GET��POST���˴���  
        //����POST���н�����������������  
        while (true) {  
            Socket socket = serverSocket.accept();  
            System.out.println("new request coming.");  
            DataInputStream reader = new DataInputStream((socket.getInputStream()));  
            String line = reader.readLine();  
            String method = line.substring(0, 4).trim();  
            OutputStream out = socket.getOutputStream();  
            this.requestPath = line.split(" ")[1];  
            System.out.println(method);  
            if ("GET".equalsIgnoreCase(method)) {  
                System.out.println("do get......");  
                this.doGet(reader, out);  
            } else if ("POST".equalsIgnoreCase(method)) {  
                System.out.println("do post......");  
                this.doPost(reader, out);  
            }  
            socket.close();  
            System.out.println("socket closed.");  
        }  
    }  
    public static void main(String args[]) throws Exception {  
        MyHttpServer server = new MyHttpServer("c:/root", 8080);  
        server.service();  
    }  
}  