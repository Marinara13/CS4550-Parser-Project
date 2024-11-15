grammar miniPy;

prog
    : line (NEWLINE+ line)* EOF
    ;

line
    : assignment
    | conditional
    | '\t'+
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
    : if_block (NEWLINE elif_block)* (NEWLINE else_block)?
    ;

if_block
    : 'if' condition ':' NEWLINE ('\t' line? NEWLINE)* '\t' line
    ;

elif_block
    : ('elif' condition ':' NEWLINE ('\t' line? NEWLINE)* '\t' line)+
    ;

else_block
    : 'else' ':' NEWLINE ('\t' line? NEWLINE)* '\t' line
    ;

condition
    : expression comparison_op expression
    | condition logical_op condition
    | 'not' condition
    | '(' condition ')'
    | expression
    ;

array
    : '[' ( ( expression ',' )* expression )? ']'
    ;

NEWLINE
    : '\r'? '\n'
    ;

INT 
    : '-'? [0-9]+
    ;

VAR 
    : [a-zA-Z_][a-zA-Z0-9_]*
    ;

STR 
    : '"' ( ~["\\] | '\\' . )* '"'
    ;

CHA 
    : '\'' . '\''
    ;

FLO 
    : '-'? INT '.' INT
    ;

BOO 
    : ('True' | 'False')
    ;

SPACE 
    : [ ] -> skip
    ;
