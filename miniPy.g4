grammar miniPy;

prog
    : (line NEWLINE)*
    ;

line
    : assignment 
    | conditional
    ;

assignment
    : VAR ( '=' | '+=' | '-=' | '*=' | '/=' ) expression
    ;

comparison_op
    : '==' | '!=' | '>' | '>=' | '<' | '<='
    ;

logical_op
    : 'and' | 'or'
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

conditional
    : 'if' condition ':' (line NEWLINE)+ (elif_block | else_block | elif_block else_block)?
    ;

elif_block
    : ('elif' condition ':' (line NEWLINE)+)+
    ;

else_block
    : 'else' ':' (line NEWLINE)+
    ;

condition
    : expression comparison_op expression
    | expression logical_op expression
    | 'not' condition
    | '(' condition ')'
    ;

array
    : '[' ( ( expression',' )* expression )? ']'
    ;

NEWLINE 
    : ( '\r'? '\n' )+
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
