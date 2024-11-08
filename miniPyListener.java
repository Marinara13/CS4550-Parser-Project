// Generated from miniPy.g4 by ANTLR 4.13.2
import org.antlr.v4.runtime.tree.ParseTreeListener;

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link miniPyParser}.
 */
public interface miniPyListener extends ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link miniPyParser#prog}.
	 * @param ctx the parse tree
	 */
	void enterProg(miniPyParser.ProgContext ctx);
	/**
	 * Exit a parse tree produced by {@link miniPyParser#prog}.
	 * @param ctx the parse tree
	 */
	void exitProg(miniPyParser.ProgContext ctx);
	/**
	 * Enter a parse tree produced by {@link miniPyParser#line}.
	 * @param ctx the parse tree
	 */
	void enterLine(miniPyParser.LineContext ctx);
	/**
	 * Exit a parse tree produced by {@link miniPyParser#line}.
	 * @param ctx the parse tree
	 */
	void exitLine(miniPyParser.LineContext ctx);
	/**
	 * Enter a parse tree produced by {@link miniPyParser#assignment}.
	 * @param ctx the parse tree
	 */
	void enterAssignment(miniPyParser.AssignmentContext ctx);
	/**
	 * Exit a parse tree produced by {@link miniPyParser#assignment}.
	 * @param ctx the parse tree
	 */
	void exitAssignment(miniPyParser.AssignmentContext ctx);
	/**
	 * Enter a parse tree produced by {@link miniPyParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterExpression(miniPyParser.ExpressionContext ctx);
	/**
	 * Exit a parse tree produced by {@link miniPyParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitExpression(miniPyParser.ExpressionContext ctx);
	/**
	 * Enter a parse tree produced by {@link miniPyParser#array}.
	 * @param ctx the parse tree
	 */
	void enterArray(miniPyParser.ArrayContext ctx);
	/**
	 * Exit a parse tree produced by {@link miniPyParser#array}.
	 * @param ctx the parse tree
	 */
	void exitArray(miniPyParser.ArrayContext ctx);
}