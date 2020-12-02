import javax.swing.JOptionPane;
public class Main {
  
 public static void main(String[] args) {
 String srcFile = JOptionPane.showInputDialog("输入源文件");
 try{
  byte[] data = FileLoad.getContent(srcFile);
  TxtTrans tt = new TxtTrans();
  String dString = tt.trans(data);
  FileOutput.output(dString, "/Users/zhanghui/Documents/workspace/experiment/java/translate/dict/result.txt");
 }catch(Exception ex){
  JOptionPane.showMessageDialog(null, "操作异常");
  System.exit(1);
 }
  
  
 JOptionPane.showMessageDialog(null, "翻译完毕");
 }
  
}
