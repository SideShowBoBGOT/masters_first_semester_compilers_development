# Generated from lab_6/lab.g4 by ANTLR 4.13.2
# encoding: utf-8
from antlr4 import *
from io import StringIO
import sys
if sys.version_info[1] > 5:
	from typing import TextIO
else:
	from typing.io import TextIO

def serializedATN():
    return [
        4,1,16,110,2,0,7,0,2,1,7,1,2,2,7,2,2,3,7,3,2,4,7,4,2,5,7,5,2,6,7,
        6,2,7,7,7,2,8,7,8,2,9,7,9,2,10,7,10,1,0,5,0,24,8,0,10,0,12,0,27,
        9,0,1,0,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,1,2,1,3,1,3,
        4,3,44,8,3,11,3,12,3,45,3,3,48,8,3,1,3,1,3,1,4,1,4,1,5,1,5,1,5,1,
        5,1,5,1,6,1,6,5,6,61,8,6,10,6,12,6,64,9,6,1,6,1,6,1,7,1,7,1,7,1,
        7,1,7,1,7,1,7,1,7,1,7,1,7,1,7,1,7,1,7,1,7,1,7,1,7,1,7,1,7,1,7,1,
        7,1,7,1,7,1,7,1,7,3,7,92,8,7,1,8,1,8,3,8,96,8,8,1,9,1,9,1,10,1,10,
        1,10,5,10,103,8,10,10,10,12,10,106,9,10,1,10,1,10,1,10,0,0,11,0,
        2,4,6,8,10,12,14,16,18,20,0,2,1,0,6,8,2,0,9,10,13,15,107,0,25,1,
        0,0,0,2,30,1,0,0,0,4,39,1,0,0,0,6,41,1,0,0,0,8,51,1,0,0,0,10,53,
        1,0,0,0,12,58,1,0,0,0,14,91,1,0,0,0,16,95,1,0,0,0,18,97,1,0,0,0,
        20,99,1,0,0,0,22,24,3,2,1,0,23,22,1,0,0,0,24,27,1,0,0,0,25,23,1,
        0,0,0,25,26,1,0,0,0,26,28,1,0,0,0,27,25,1,0,0,0,28,29,5,0,0,1,29,
        1,1,0,0,0,30,31,5,11,0,0,31,32,5,1,0,0,32,33,5,15,0,0,33,34,3,4,
        2,0,34,35,3,6,3,0,35,36,3,8,4,0,36,37,3,12,6,0,37,38,5,12,0,0,38,
        3,1,0,0,0,39,40,7,0,0,0,40,5,1,0,0,0,41,47,5,11,0,0,42,44,3,10,5,
        0,43,42,1,0,0,0,44,45,1,0,0,0,45,43,1,0,0,0,45,46,1,0,0,0,46,48,
        1,0,0,0,47,43,1,0,0,0,47,48,1,0,0,0,48,49,1,0,0,0,49,50,5,12,0,0,
        50,7,1,0,0,0,51,52,3,6,3,0,52,9,1,0,0,0,53,54,5,11,0,0,54,55,5,15,
        0,0,55,56,3,4,2,0,56,57,5,12,0,0,57,11,1,0,0,0,58,62,5,11,0,0,59,
        61,3,14,7,0,60,59,1,0,0,0,61,64,1,0,0,0,62,60,1,0,0,0,62,63,1,0,
        0,0,63,65,1,0,0,0,64,62,1,0,0,0,65,66,5,12,0,0,66,13,1,0,0,0,67,
        68,5,11,0,0,68,69,5,2,0,0,69,70,5,15,0,0,70,71,3,16,8,0,71,72,5,
        12,0,0,72,92,1,0,0,0,73,74,5,11,0,0,74,75,5,3,0,0,75,76,3,16,8,0,
        76,77,3,12,6,0,77,78,3,12,6,0,78,79,5,12,0,0,79,92,1,0,0,0,80,81,
        5,11,0,0,81,82,5,4,0,0,82,83,3,16,8,0,83,84,3,12,6,0,84,85,5,12,
        0,0,85,92,1,0,0,0,86,87,5,11,0,0,87,88,5,5,0,0,88,89,3,16,8,0,89,
        90,5,12,0,0,90,92,1,0,0,0,91,67,1,0,0,0,91,73,1,0,0,0,91,80,1,0,
        0,0,91,86,1,0,0,0,92,15,1,0,0,0,93,96,3,18,9,0,94,96,3,20,10,0,95,
        93,1,0,0,0,95,94,1,0,0,0,96,17,1,0,0,0,97,98,7,1,0,0,98,19,1,0,0,
        0,99,100,5,11,0,0,100,104,5,15,0,0,101,103,3,18,9,0,102,101,1,0,
        0,0,103,106,1,0,0,0,104,102,1,0,0,0,104,105,1,0,0,0,105,107,1,0,
        0,0,106,104,1,0,0,0,107,108,5,12,0,0,108,21,1,0,0,0,7,25,45,47,62,
        91,95,104
    ]

class labParser ( Parser ):

    grammarFileName = "lab.g4"

    atn = ATNDeserializer().deserialize(serializedATN())

    decisionsToDFA = [ DFA(ds, i) for i, ds in enumerate(atn.decisionToState) ]

    sharedContextCache = PredictionContextCache()

    literalNames = [ "<INVALID>", "'fn'", "'set'", "'if'", "'while'", "'return'", 
                     "'int'", "'float'", "'bool'", "'true'", "'false'", 
                     "'('", "')'" ]

    symbolicNames = [ "<INVALID>", "FN", "SET", "IF", "WHILE", "RETURN", 
                      "INT_T", "FLOAT_T", "BOOL_T", "TRUE_T", "FALSE_T", 
                      "LPAREN", "RPAREN", "FLOAT", "INT", "IDENT", "WS" ]

    RULE_program = 0
    RULE_toplevel = 1
    RULE_type = 2
    RULE_funcArgs = 3
    RULE_varDecls = 4
    RULE_argPair = 5
    RULE_stmtList = 6
    RULE_statement = 7
    RULE_expr = 8
    RULE_atom = 9
    RULE_funcCall = 10

    ruleNames =  [ "program", "toplevel", "type", "funcArgs", "varDecls", 
                   "argPair", "stmtList", "statement", "expr", "atom", "funcCall" ]

    EOF = Token.EOF
    FN=1
    SET=2
    IF=3
    WHILE=4
    RETURN=5
    INT_T=6
    FLOAT_T=7
    BOOL_T=8
    TRUE_T=9
    FALSE_T=10
    LPAREN=11
    RPAREN=12
    FLOAT=13
    INT=14
    IDENT=15
    WS=16

    def __init__(self, input:TokenStream, output:TextIO = sys.stdout):
        super().__init__(input, output)
        self.checkVersion("4.13.2")
        self._interp = ParserATNSimulator(self, self.atn, self.decisionsToDFA, self.sharedContextCache)
        self._predicates = None




    class ProgramContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def EOF(self):
            return self.getToken(labParser.EOF, 0)

        def toplevel(self, i:int=None):
            if i is None:
                return self.getTypedRuleContexts(labParser.ToplevelContext)
            else:
                return self.getTypedRuleContext(labParser.ToplevelContext,i)


        def getRuleIndex(self):
            return labParser.RULE_program

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterProgram" ):
                listener.enterProgram(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitProgram" ):
                listener.exitProgram(self)




    def program(self):

        localctx = labParser.ProgramContext(self, self._ctx, self.state)
        self.enterRule(localctx, 0, self.RULE_program)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 25
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            while _la==11:
                self.state = 22
                self.toplevel()
                self.state = 27
                self._errHandler.sync(self)
                _la = self._input.LA(1)

            self.state = 28
            self.match(labParser.EOF)
        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class ToplevelContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser
            self.name = None # Token
            self.retType = None # TypeContext

        def LPAREN(self):
            return self.getToken(labParser.LPAREN, 0)

        def FN(self):
            return self.getToken(labParser.FN, 0)

        def funcArgs(self):
            return self.getTypedRuleContext(labParser.FuncArgsContext,0)


        def varDecls(self):
            return self.getTypedRuleContext(labParser.VarDeclsContext,0)


        def stmtList(self):
            return self.getTypedRuleContext(labParser.StmtListContext,0)


        def RPAREN(self):
            return self.getToken(labParser.RPAREN, 0)

        def IDENT(self):
            return self.getToken(labParser.IDENT, 0)

        def type_(self):
            return self.getTypedRuleContext(labParser.TypeContext,0)


        def getRuleIndex(self):
            return labParser.RULE_toplevel

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterToplevel" ):
                listener.enterToplevel(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitToplevel" ):
                listener.exitToplevel(self)




    def toplevel(self):

        localctx = labParser.ToplevelContext(self, self._ctx, self.state)
        self.enterRule(localctx, 2, self.RULE_toplevel)
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 30
            self.match(labParser.LPAREN)
            self.state = 31
            self.match(labParser.FN)
            self.state = 32
            localctx.name = self.match(labParser.IDENT)
            self.state = 33
            localctx.retType = self.type_()
            self.state = 34
            self.funcArgs()
            self.state = 35
            self.varDecls()
            self.state = 36
            self.stmtList()
            self.state = 37
            self.match(labParser.RPAREN)
        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class TypeContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def INT_T(self):
            return self.getToken(labParser.INT_T, 0)

        def FLOAT_T(self):
            return self.getToken(labParser.FLOAT_T, 0)

        def BOOL_T(self):
            return self.getToken(labParser.BOOL_T, 0)

        def getRuleIndex(self):
            return labParser.RULE_type

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterType" ):
                listener.enterType(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitType" ):
                listener.exitType(self)




    def type_(self):

        localctx = labParser.TypeContext(self, self._ctx, self.state)
        self.enterRule(localctx, 4, self.RULE_type)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 39
            _la = self._input.LA(1)
            if not((((_la) & ~0x3f) == 0 and ((1 << _la) & 448) != 0)):
                self._errHandler.recoverInline(self)
            else:
                self._errHandler.reportMatch(self)
                self.consume()
        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class FuncArgsContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def LPAREN(self):
            return self.getToken(labParser.LPAREN, 0)

        def RPAREN(self):
            return self.getToken(labParser.RPAREN, 0)

        def argPair(self, i:int=None):
            if i is None:
                return self.getTypedRuleContexts(labParser.ArgPairContext)
            else:
                return self.getTypedRuleContext(labParser.ArgPairContext,i)


        def getRuleIndex(self):
            return labParser.RULE_funcArgs

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterFuncArgs" ):
                listener.enterFuncArgs(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitFuncArgs" ):
                listener.exitFuncArgs(self)




    def funcArgs(self):

        localctx = labParser.FuncArgsContext(self, self._ctx, self.state)
        self.enterRule(localctx, 6, self.RULE_funcArgs)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 41
            self.match(labParser.LPAREN)
            self.state = 47
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            if _la==11:
                self.state = 43 
                self._errHandler.sync(self)
                _la = self._input.LA(1)
                while True:
                    self.state = 42
                    self.argPair()
                    self.state = 45 
                    self._errHandler.sync(self)
                    _la = self._input.LA(1)
                    if not (_la==11):
                        break



            self.state = 49
            self.match(labParser.RPAREN)
        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class VarDeclsContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def funcArgs(self):
            return self.getTypedRuleContext(labParser.FuncArgsContext,0)


        def getRuleIndex(self):
            return labParser.RULE_varDecls

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterVarDecls" ):
                listener.enterVarDecls(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitVarDecls" ):
                listener.exitVarDecls(self)




    def varDecls(self):

        localctx = labParser.VarDeclsContext(self, self._ctx, self.state)
        self.enterRule(localctx, 8, self.RULE_varDecls)
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 51
            self.funcArgs()
        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class ArgPairContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser
            self.name = None # Token

        def LPAREN(self):
            return self.getToken(labParser.LPAREN, 0)

        def type_(self):
            return self.getTypedRuleContext(labParser.TypeContext,0)


        def RPAREN(self):
            return self.getToken(labParser.RPAREN, 0)

        def IDENT(self):
            return self.getToken(labParser.IDENT, 0)

        def getRuleIndex(self):
            return labParser.RULE_argPair

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterArgPair" ):
                listener.enterArgPair(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitArgPair" ):
                listener.exitArgPair(self)




    def argPair(self):

        localctx = labParser.ArgPairContext(self, self._ctx, self.state)
        self.enterRule(localctx, 10, self.RULE_argPair)
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 53
            self.match(labParser.LPAREN)
            self.state = 54
            localctx.name = self.match(labParser.IDENT)
            self.state = 55
            self.type_()
            self.state = 56
            self.match(labParser.RPAREN)
        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class StmtListContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def LPAREN(self):
            return self.getToken(labParser.LPAREN, 0)

        def RPAREN(self):
            return self.getToken(labParser.RPAREN, 0)

        def statement(self, i:int=None):
            if i is None:
                return self.getTypedRuleContexts(labParser.StatementContext)
            else:
                return self.getTypedRuleContext(labParser.StatementContext,i)


        def getRuleIndex(self):
            return labParser.RULE_stmtList

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterStmtList" ):
                listener.enterStmtList(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitStmtList" ):
                listener.exitStmtList(self)




    def stmtList(self):

        localctx = labParser.StmtListContext(self, self._ctx, self.state)
        self.enterRule(localctx, 12, self.RULE_stmtList)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 58
            self.match(labParser.LPAREN)
            self.state = 62
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            while _la==11:
                self.state = 59
                self.statement()
                self.state = 64
                self._errHandler.sync(self)
                _la = self._input.LA(1)

            self.state = 65
            self.match(labParser.RPAREN)
        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class StatementContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser
            self.dest = None # Token
            self.cond = None # ExprContext
            self.thenBranch = None # StmtListContext
            self.elseBranch = None # StmtListContext
            self.body = None # StmtListContext

        def LPAREN(self):
            return self.getToken(labParser.LPAREN, 0)

        def SET(self):
            return self.getToken(labParser.SET, 0)

        def expr(self):
            return self.getTypedRuleContext(labParser.ExprContext,0)


        def RPAREN(self):
            return self.getToken(labParser.RPAREN, 0)

        def IDENT(self):
            return self.getToken(labParser.IDENT, 0)

        def IF(self):
            return self.getToken(labParser.IF, 0)

        def stmtList(self, i:int=None):
            if i is None:
                return self.getTypedRuleContexts(labParser.StmtListContext)
            else:
                return self.getTypedRuleContext(labParser.StmtListContext,i)


        def WHILE(self):
            return self.getToken(labParser.WHILE, 0)

        def RETURN(self):
            return self.getToken(labParser.RETURN, 0)

        def getRuleIndex(self):
            return labParser.RULE_statement

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterStatement" ):
                listener.enterStatement(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitStatement" ):
                listener.exitStatement(self)




    def statement(self):

        localctx = labParser.StatementContext(self, self._ctx, self.state)
        self.enterRule(localctx, 14, self.RULE_statement)
        try:
            self.state = 91
            self._errHandler.sync(self)
            la_ = self._interp.adaptivePredict(self._input,4,self._ctx)
            if la_ == 1:
                self.enterOuterAlt(localctx, 1)
                self.state = 67
                self.match(labParser.LPAREN)
                self.state = 68
                self.match(labParser.SET)
                self.state = 69
                localctx.dest = self.match(labParser.IDENT)
                self.state = 70
                self.expr()
                self.state = 71
                self.match(labParser.RPAREN)
                pass

            elif la_ == 2:
                self.enterOuterAlt(localctx, 2)
                self.state = 73
                self.match(labParser.LPAREN)
                self.state = 74
                self.match(labParser.IF)
                self.state = 75
                localctx.cond = self.expr()
                self.state = 76
                localctx.thenBranch = self.stmtList()
                self.state = 77
                localctx.elseBranch = self.stmtList()
                self.state = 78
                self.match(labParser.RPAREN)
                pass

            elif la_ == 3:
                self.enterOuterAlt(localctx, 3)
                self.state = 80
                self.match(labParser.LPAREN)
                self.state = 81
                self.match(labParser.WHILE)
                self.state = 82
                localctx.cond = self.expr()
                self.state = 83
                localctx.body = self.stmtList()
                self.state = 84
                self.match(labParser.RPAREN)
                pass

            elif la_ == 4:
                self.enterOuterAlt(localctx, 4)
                self.state = 86
                self.match(labParser.LPAREN)
                self.state = 87
                self.match(labParser.RETURN)
                self.state = 88
                self.expr()
                self.state = 89
                self.match(labParser.RPAREN)
                pass


        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class ExprContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def atom(self):
            return self.getTypedRuleContext(labParser.AtomContext,0)


        def funcCall(self):
            return self.getTypedRuleContext(labParser.FuncCallContext,0)


        def getRuleIndex(self):
            return labParser.RULE_expr

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterExpr" ):
                listener.enterExpr(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitExpr" ):
                listener.exitExpr(self)




    def expr(self):

        localctx = labParser.ExprContext(self, self._ctx, self.state)
        self.enterRule(localctx, 16, self.RULE_expr)
        try:
            self.state = 95
            self._errHandler.sync(self)
            token = self._input.LA(1)
            if token in [9, 10, 13, 14, 15]:
                self.enterOuterAlt(localctx, 1)
                self.state = 93
                self.atom()
                pass
            elif token in [11]:
                self.enterOuterAlt(localctx, 2)
                self.state = 94
                self.funcCall()
                pass
            else:
                raise NoViableAltException(self)

        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class AtomContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def IDENT(self):
            return self.getToken(labParser.IDENT, 0)

        def INT(self):
            return self.getToken(labParser.INT, 0)

        def FLOAT(self):
            return self.getToken(labParser.FLOAT, 0)

        def TRUE_T(self):
            return self.getToken(labParser.TRUE_T, 0)

        def FALSE_T(self):
            return self.getToken(labParser.FALSE_T, 0)

        def getRuleIndex(self):
            return labParser.RULE_atom

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterAtom" ):
                listener.enterAtom(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitAtom" ):
                listener.exitAtom(self)




    def atom(self):

        localctx = labParser.AtomContext(self, self._ctx, self.state)
        self.enterRule(localctx, 18, self.RULE_atom)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 97
            _la = self._input.LA(1)
            if not((((_la) & ~0x3f) == 0 and ((1 << _la) & 58880) != 0)):
                self._errHandler.recoverInline(self)
            else:
                self._errHandler.reportMatch(self)
                self.consume()
        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class FuncCallContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser
            self.callee = None # Token

        def LPAREN(self):
            return self.getToken(labParser.LPAREN, 0)

        def RPAREN(self):
            return self.getToken(labParser.RPAREN, 0)

        def IDENT(self):
            return self.getToken(labParser.IDENT, 0)

        def atom(self, i:int=None):
            if i is None:
                return self.getTypedRuleContexts(labParser.AtomContext)
            else:
                return self.getTypedRuleContext(labParser.AtomContext,i)


        def getRuleIndex(self):
            return labParser.RULE_funcCall

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterFuncCall" ):
                listener.enterFuncCall(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitFuncCall" ):
                listener.exitFuncCall(self)




    def funcCall(self):

        localctx = labParser.FuncCallContext(self, self._ctx, self.state)
        self.enterRule(localctx, 20, self.RULE_funcCall)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 99
            self.match(labParser.LPAREN)
            self.state = 100
            localctx.callee = self.match(labParser.IDENT)
            self.state = 104
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            while (((_la) & ~0x3f) == 0 and ((1 << _la) & 58880) != 0):
                self.state = 101
                self.atom()
                self.state = 106
                self._errHandler.sync(self)
                _la = self._input.LA(1)

            self.state = 107
            self.match(labParser.RPAREN)
        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx





