//package translate;
import java.awt.Toolkit;
import java.awt.datatransfer.Clipboard;
import java.awt.datatransfer.DataFlavor;
import java.awt.datatransfer.Transferable;

public class ClipboradUtils {

    protected static String getClipboardText() throws Exception{
        Clipboard clip = Toolkit.getDefaultToolkit().getSystemClipboard();//获取系统剪贴板
        // 获取剪切板中的内容
        Transferable clipT = clip.getContents(null);
        if (clipT != null) {
        // 检查内容是否是文本类型
        if (clipT.isDataFlavorSupported(DataFlavor.stringFlavor))
        return (String)clipT.getTransferData(DataFlavor.stringFlavor); 
        }
        return null;
    }
}

