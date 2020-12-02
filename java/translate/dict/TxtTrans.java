/*文件翻译，将字节数组变为字符串，分离出其中的单词，然后翻译为对应的汉字，去掉空格，变为字符串*/
import java.util.StringTokenizer;
import java.util.Properties;
import java.io.*;
public class TxtTrans {
 private Properties pps;
 public TxtTrans(){
 loadCiku();
 }
 public void loadCiku(){
 pps = new Properties();
 try{
  FileReader fis = new FileReader("/Users/zhanghui/Documents/workspace/experiment/java/translate/dict/dict.txt");//以字符载入时没有乱码，以字节载入时出现了乱码
  pps.load(fis);
  fis.close();
 }catch(Exception ex){
  ex.printStackTrace(System.out);
  System.out.println("载入词库时出错");
 }
 //System.out.println(pps.get("china")) ;
 
 }
 public String trans(byte[] data){
 String srcTxt = new String(data);
 String dstTxt = srcTxt;
 
 String delim = " ,.!\n\t"; //分隔符可以指定
 StringTokenizer st = new StringTokenizer(srcTxt,delim,false);
 String sub,lowerSub,newSub;
 //int i=0;
 while(st.hasMoreTokens()){
  sub = st.nextToken(); //分割出的一个个单词
 
  lowerSub = sub.toLowerCase();//统一转换为小写，这样可以简化词库
  //System.out.println(sub);
  newSub = pps.getProperty(lowerSub);
  if(newSub != null){ //如果找到了匹配的汉字，则进行替换
  dstTxt = dstTxt.replaceFirst(sub, newSub); //只替换第一个，即只替换了当前的字符串，否则容易造成ch我na的例子
  //System.out.println(dstTxt);
  }
 }
 
 return dstTxt.replaceAll(" ", ""); //去掉空格
 }
 
 
 
}
