grammar miniPy;

prog
    : (line NEWLINE)*
    ;

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
    | CHA
    | BOO
    | INT
    | FLO
    | VAR
    | array
    ;

array
    : '[' ( ( expression',' )* expression )? ']'
    ;

NEWLINE
    : '\r'? '\n'
    ;
INT 
    : [0-9]+
    ;
VAR 
    : [a-zA-Z0-9_]+
    ;
STR 
    : '"' .*? '"'
    ;
CHA 
    : '\'' . '\''
    ;
FLO 
    : INT '.' INT
    ;
BOO : ('True'|'False');
SPACE : [ ] -> skip;
