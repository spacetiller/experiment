// Generated from /Users/zhanghui/Documents/workspace/wecash-di/bayern/bayern-main/src/main/java/net/wecash/bi/bayern/main/util/Demo.g4 by ANTLR 4.8
package net.wecash.bi.bayern.main.util;
import org.antlr.v4.runtime.tree.ParseTreeVisitor;

/**
 * This interface defines a complete generic visitor for a parse tree produced
 * by {@link DemoParser}.
 *
 * @param <T> The return type of the visit operation. Use {@link Void} for
 * operations with no return type.
 */
public interface DemoVisitor<T> extends ParseTreeVisitor<T> {
	/**
	 * Visit a parse tree produced by {@link DemoParser#prog}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitProg(DemoParser.ProgContext ctx);
	/**
	 * Visit a parse tree produced by {@link DemoParser#stat}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitStat(DemoParser.StatContext ctx);
	/**
	 * Visit a parse tree produced by {@link DemoParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExpr(DemoParser.ExprContext ctx);
	/**
	 * Visit a parse tree produced by {@link DemoParser#multExpr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitMultExpr(DemoParser.MultExprContext ctx);
	/**
	 * Visit a parse tree produced by {@link DemoParser#atom}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitAtom(DemoParser.AtomContext ctx);
}