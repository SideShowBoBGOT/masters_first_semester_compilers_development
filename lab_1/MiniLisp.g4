grammar MiniLisp;

ID : [a-zA-Z] [a-zA-Z0-9_]* ;
fragment DIGIT : [0-9];

BOOL_LIT
  : 'true'
  | 'false'
  ;

REAL_LIT
  : DIGIT+ '.' DIGIT*
  | '.' DIGIT+
  ;

INT_LIT
  : DIGIT+
  ;

STRING_LIT
  : '"' ( ~["\\\r\n] | '\\' . )* '"'
  ;

WS : [ \t\r\n]+ -> skip ;
