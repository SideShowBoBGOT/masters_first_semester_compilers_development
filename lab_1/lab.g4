grammar lab;

WS: [ \t\r\n]+ -> skip;

TYPE: TYPE_INTEGER | TYPE_REAL | TYPE_STRING | TYPE_BOOL;

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

statement
  : statementVariableDeclaration
  | statementIf
  | statementWhile
  | expressionFunctionCall
  ;

functionCallArgument: LITERAL | ID | expressionFunctionCall;
expressionFunctionCall: LPAREN ID functionCallArgument* RPAREN;
statementVariableDeclaration: LPAREN KEYWORD_LET ID functionCallArgument RPAREN;
statementsList: LPAREN statement* RPAREN;
statementIf: LPAREN KEYWORD_IF expressionFunctionCall statementsList statementsList RPAREN;
statementWhile: LPAREN KEYWORD_WHILE expressionFunctionCall statementsList RPAREN;

funcParam: LPAREN ID TYPE RPAREN;
funcParamList: funcParam+;
funcDef: LPAREN KEYWORD_FN ID LPAREN funcParamList? RPAREN statementsList RPAREN;

program: funcDef+;

LITERAL: LITERAL_BOOL | LITERAL_REAL | LITERAL_INTEGER | LITERAL_STRING;
LITERAL_BOOL: 'true' | 'false';
LITERAL_REAL: DIGIT+ '.' DIGIT* | '.' DIGIT+;
LITERAL_INTEGER: DIGIT+;
LITERAL_STRING: '"' ( ~["\\\r\n] | '\\' . )* '"';

ID : [a-zA-Z_+\-*/^<>=]+;
fragment DIGIT : [0-9];