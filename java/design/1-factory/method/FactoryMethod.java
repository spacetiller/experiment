// 客户端角色
public class FactoryMethod {
    public static void main(String[] args) {
        String data = "" ;
        ExportFactory factory = new ExportWordFactory () ;
        ExportFile exportWord = factory.factory("user-word") ;
        exportWord.export(data) ;
        factory = new ExportPdfFactory() ;
        ExportFile exportPdf =factory.factory("log-pdf") ;
        exportPdf.export(data) ;
    }
}
// 抽象工厂角色
interface ExportFactory {
    ExportFile factory (String type) ;
}
// 具体工厂角色
class ExportWordFactory implements ExportFactory {
    @Override
    public ExportFile factory(String type) {
        if ("user-word".equals(type)){
            return new ExportUserWordFile() ;
        } else if ("log-word".equals(type)){
            return new ExportLogWordFile() ;
        } else {
            throw new RuntimeException("没有找到对象") ;
        }
    }
}
class ExportPdfFactory implements ExportFactory {
    @Override
    public ExportFile factory(String type) {
        if ("user-pdf".equals(type)){
            return new ExportUserPdfFile() ;
        } else if ("log-pdf".equals(type)){
            return new ExportLogPdfFile() ;
        } else {
            throw new RuntimeException("没有找到对象") ;
        }
    }
}
// 抽象导出角色
interface ExportFile {
    boolean export (String data) ;
}
// 具体导出角色
class ExportUserWordFile implements ExportFile {
    @Override
    public boolean export(String data) {
        System.out.println("导出用户Word文件");
        return true;
    }
}
class ExportLogWordFile implements ExportFile {
    @Override
    public boolean export(String data) {
        System.out.println("导出日志Word文件");
        return true;
    }
}
class ExportUserPdfFile implements ExportFile {
    @Override
    public boolean export(String data) {
        System.out.println("导出用户Pdf文件");
        return true;
    }
}
class ExportLogPdfFile implements ExportFile {
    @Override
    public boolean export(String data) {
        System.out.println("导出日志Pdf文件");
        return true;
    }
}
