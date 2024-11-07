grammar miniPy;

prog: (expr NEWLINE)*;

expr: expr ('+'|'-'|'*'|'/') expr
    | expr ('='|'+='|'-='|'*='|'/=') expr
    | INT
    | VARNAME;

NEWLINE : [\r\n]+;
INT: [0-9]+;
VARNAME: [a-z]+; 
SPACE: [ \t] -> skip;