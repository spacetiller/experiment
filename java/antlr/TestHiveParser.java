package net.wecash.bi.bayern.main.util;

import com.facebook.presto.jdbc.internal.guava.io.CharStreams;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.tree.ParseTree;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.ANTLRInputStream;
//import org.apache.hadoop.hive.ql.Context;
//import org.apache.hadoop.hive.ql.parse.*;
//import org.apache.hadoop.hive.ql.session.SessionState;
import org.apache.hadoop.hive.conf.HiveConf;

public class TestHiveParser {
    public static void run(String expr) throws Exception{

        //对每一个输入的字符串，构造一个 ANTLRStringStream 流 in
        ANTLRInputStream in = new ANTLRInputStream(expr);

        //用 in 构造词法分析器 lexer，词法分析的作用是产生记号
        DemoLexer lexer = new DemoLexer(in);

        //用词法分析器 lexer 构造一个记号流 tokens
        CommonTokenStream tokens = new CommonTokenStream(lexer);

        //再使用 tokens 构造语法分析器 parser,至此已经完成词法分析和语法分析的准备工作
        DemoParser parser = new DemoParser(tokens);

        //最终调用语法分析器的规则 prog，完成对表达式的验证
        parser.prog();
    }

    public static void main(String[] args) throws Throwable {
//        String sql = "select * from (select name from test.test1 where id = 1) a";
        String sql = "select * from test.test1";

        HiveConf hiveConf = new HiveConf();
        hiveConf.set("hive.stats.collect.tablekeys", "true");
        hiveConf.set("hive.stats.collect.scancols", "true");

        String[] testStr={
                "2",
                "a+b+3",
                "(a-b)+3",
                "a+(b*3"
        };
        String s = "(a-b)+3";
        run(s);

//        for (String s:testStr){
//            System.out.println("Input expr:"+s);
//            run(s);
//        }

//        CharStream input = CharStreams.fromString("12*2+12\r\n");
//        MathLexer lexer=new MathLexer(input);
//        CommonTokenStream tokens = new CommonTokenStream(lexer);
//        MathParser parser = new MathParser(tokens);
//        ParseTree tree = parser.prog(); // parse
//        MathVisitorTest vt=new MathVisitorTest();
//        vt.visit(tree);

//        SessionState sessionState = SessionState.start(hiveConf);
//        sessionState.initTxnMgr(hiveConf);
//        SessionState.setCurrentSessionState(sessionState);
//
//        Context ctx = new Context(hiveConf);
//        ctx.setTryCount(Integer.MAX_VALUE);
//        ctx.setCmd(sql);
//        ctx.setHDFSCleanup(true);
//
//        ParseDriver pd = new ParseDriver();
//        ASTNode tree = pd.parse(sql);
//        tree = ParseUtils.findRootNonNullToken(tree);
//        System.out.println(tree);
//        BaseSemanticAnalyzer baseSemanticAnalyzer = SemanticAnalyzerFactory.get(hiveConf, tree);
//        System.out.println(baseSemanticAnalyzer);
//        baseSemanticAnalyzer.analyze(tree, ctx);
//        TableAccessInfo tableAccessInfo = baseSemanticAnalyzer.getTableAccessInfo();
//        System.out.println(tableAccessInfo);
//
//        ColumnAccessInfo columnAccessInfo = baseSemanticAnalyzer.getColumnAccessInfo();
//        System.out.println(columnAccessInfo);
//
//        sessionState.close();
//        ctx.clear();
    }
}