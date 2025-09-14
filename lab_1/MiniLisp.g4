grammar MiniLisp;

WS : [ \t\r\n]+ -> skip ;

TYPE_INTEGER: 'int';
TYPE_REAL: 'real';
TYPE_STRING: 'string';
TYPE_BOOL: 'bool';
KEYWORD_FN: 'fn';
KEYWORD_LET: 'let';
KEYWORD_IF: 'if';
KEYWORD_WHILE: 'while';
LPAREN: '(';
RPAREN: ')';



TYPE: TYPE_INTEGER | TYPE_REAL | TYPE_STRING | TYPE_BOOL;

expressionFunctionCall: LPAREN ID+ RPAREN;

statementVariableDeclaration: LPAREN KEYWORD_LET ID LITERAL RPAREN;
statementIfBranch: LPAREN statement* RPAREN;
statementIf: LPAREN KEYWORD_IF expressionFunctionCall statementIfBranch statementIfBranch RPAREN;

statement
  : statementVariableDeclaration
  | statementIf
  | expressionFunctionCall
  ;

funcParam: LPAREN ID TYPE RPAREN;
funcParamList: funcParam+;
funcDef: LPAREN KEYWORD_FN ID LPAREN funcParamList? RPAREN LPAREN statement+ RPAREN RPAREN;



program: funcDef;

LITERAL: LITERAL_BOOL | LITERAL_REAL | LITERAL_INTEGER | LITERAL_STRING;
LITERAL_BOOL: 'true' | 'false';
LITERAL_REAL: DIGIT+ '.' DIGIT* | '.' DIGIT+;
LITERAL_INTEGER: DIGIT+;
LITERAL_STRING: '"' ( ~["\\\r\n] | '\\' . )* '"';

ID : [a-zA-Z] [a-zA-Z0-9_]* ;
fragment DIGIT : [0-9];