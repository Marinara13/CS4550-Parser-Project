grammar miniPy;

prog: (line NEWLINE)*;

line
    : assignment 
    ;

assignment
    : VAR ( '=' | '+=' | '-=' | '*=' | '/=' ) expression
    ;

expression
    : expression ( '*' | '/' | '%' ) expression
    | expression ( '+' | '-' ) expression
    | STR
    | CHAR
    | BOO
    | INT
    | FLO
    | VAR
    | array
    ;

array
    : '[' ( ( expression',' )* expression )? ']'
    ;

NEWLINE : ( '\r'? '\n' )+;
INT : [0-9]+;
VAR : [a-z0-9_]+;
STR : '"' .*? '"';
CHAR : '\'' [a-zA-Z] '\'';
FLO : [0-9]+[.][0-9]+;
BOO : ('True'|'False');
SPACE : [ ] -> skip;
