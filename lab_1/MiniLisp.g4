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

statementType: TYPE_INTEGER | TYPE_REAL | TYPE_STRING | TYPE_BOOL;
statementVariableDeclaration: LPAREN KEYWORD_LET ID LITERAL RPAREN;

statement: statementVariableDeclaration;

funcParam: LPAREN ID statementType RPAREN;
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