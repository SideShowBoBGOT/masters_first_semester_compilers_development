// antlr4-parse lab_1/lab.g4 program -tree lab_1/example.txt
grammar lab;

program
  : toplevel* EOF
  ;

toplevel
  : LPAREN FN name=IDENT retType=type funcArgs varDecls stmtList RPAREN
  ;

type
  : INT_T
  | FLOAT_T
  | BOOL_T
  ;

funcArgs
  : LPAREN (argPair+)? RPAREN
  ;

varDecls
  : funcArgs
  ;

argPair
  : LPAREN name=IDENT type RPAREN
  ;

stmtList
  : LPAREN statement* RPAREN
  ;

statement
  : LPAREN SET dest=IDENT expr RPAREN
  | LPAREN IF cond=expr thenBranch=stmtList elseBranch=stmtList RPAREN
  | LPAREN WHILE cond=expr body=stmtList RPAREN
  | LPAREN RETURN expr RPAREN
  ;

expr
  : atom
  | funcCall
  ;

atom
  : IDENT
  | INT
  | FLOAT
  | TRUE_T
  | FALSE_T
  ;

funcCall
  : LPAREN callee=IDENT (atom)* RPAREN
  ;

FN      : 'fn' ;
SET     : 'set' ;
IF      : 'if' ;
WHILE   : 'while' ;
RETURN  : 'return' ;
INT_T   : 'int' ;
FLOAT_T : 'float' ;
BOOL_T  : 'bool' ;
TRUE_T  : 'true' ;
FALSE_T : 'false' ;
LPAREN  : '(' ;
RPAREN  : ')' ;
FLOAT   : [+\-]? DIGITS '.' DIGITS ;
INT     : [+\-]? DIGITS ;
fragment DIGITS : [0-9]+ ;
IDENT
  : [a-zA-Z!$%&*/:<=>?^_~] [a-zA-Z!$%&*/:<=>?^_~0-9]*
  | [+\-]
  ;
WS      : [ \t\r\n]+ -> skip ;
