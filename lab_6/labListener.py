# Generated from lab_6/lab.g4 by ANTLR 4.13.2
from antlr4 import *
if "." in __name__:
    from .labParser import labParser
else:
    from labParser import labParser

# This class defines a complete listener for a parse tree produced by labParser.
class labListener(ParseTreeListener):

    # Enter a parse tree produced by labParser#program.
    def enterProgram(self, ctx:labParser.ProgramContext):
        pass

    # Exit a parse tree produced by labParser#program.
    def exitProgram(self, ctx:labParser.ProgramContext):
        pass


    # Enter a parse tree produced by labParser#toplevel.
    def enterToplevel(self, ctx:labParser.ToplevelContext):
        pass

    # Exit a parse tree produced by labParser#toplevel.
    def exitToplevel(self, ctx:labParser.ToplevelContext):
        pass


    # Enter a parse tree produced by labParser#type.
    def enterType(self, ctx:labParser.TypeContext):
        pass

    # Exit a parse tree produced by labParser#type.
    def exitType(self, ctx:labParser.TypeContext):
        pass


    # Enter a parse tree produced by labParser#funcArgs.
    def enterFuncArgs(self, ctx:labParser.FuncArgsContext):
        pass

    # Exit a parse tree produced by labParser#funcArgs.
    def exitFuncArgs(self, ctx:labParser.FuncArgsContext):
        pass


    # Enter a parse tree produced by labParser#varDecls.
    def enterVarDecls(self, ctx:labParser.VarDeclsContext):
        pass

    # Exit a parse tree produced by labParser#varDecls.
    def exitVarDecls(self, ctx:labParser.VarDeclsContext):
        pass


    # Enter a parse tree produced by labParser#argPair.
    def enterArgPair(self, ctx:labParser.ArgPairContext):
        pass

    # Exit a parse tree produced by labParser#argPair.
    def exitArgPair(self, ctx:labParser.ArgPairContext):
        pass


    # Enter a parse tree produced by labParser#stmtList.
    def enterStmtList(self, ctx:labParser.StmtListContext):
        pass

    # Exit a parse tree produced by labParser#stmtList.
    def exitStmtList(self, ctx:labParser.StmtListContext):
        pass


    # Enter a parse tree produced by labParser#statement.
    def enterStatement(self, ctx:labParser.StatementContext):
        pass

    # Exit a parse tree produced by labParser#statement.
    def exitStatement(self, ctx:labParser.StatementContext):
        pass


    # Enter a parse tree produced by labParser#expr.
    def enterExpr(self, ctx:labParser.ExprContext):
        pass

    # Exit a parse tree produced by labParser#expr.
    def exitExpr(self, ctx:labParser.ExprContext):
        pass


    # Enter a parse tree produced by labParser#atom.
    def enterAtom(self, ctx:labParser.AtomContext):
        pass

    # Exit a parse tree produced by labParser#atom.
    def exitAtom(self, ctx:labParser.AtomContext):
        pass


    # Enter a parse tree produced by labParser#funcCall.
    def enterFuncCall(self, ctx:labParser.FuncCallContext):
        pass

    # Exit a parse tree produced by labParser#funcCall.
    def exitFuncCall(self, ctx:labParser.FuncCallContext):
        pass



del labParser