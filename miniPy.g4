grammar miniPy;

prog: (line NEWLINE)*;

line: operation 
    | assignment 
    | both;

operation: add 
    | sub 
    | mul 
    | div 
    | mod;

assignment: equ 
    | addequ 
    | subequ 
    | mulequ 
    | divequ;

both: variable ('+='|'-='|'*='|'/='|'=') variable ('+'|'-'|'*'|'/'|'%') variable;

variable: VAR | STR | INT | FLO | BOO;

add: variable ('+') variable;

sub: variable ('-') variable;

mul: variable ('*') variable;

div: variable ('/') variable;

mod: variable ('%') variable;

equ: variable ('=') variable;

addequ: variable ('+=') variable;

subequ: variable ('-=') variable;

mulequ: variable ('*=') variable;

divequ: variable ('/=') variable;

NEWLINE : [\n]+;
VAR : [a-z0-9_]+;
STR : '"' .*? '"';
INT : [0-9]+;
FLO : [0-9]+[.][0-9]+;
BOO : ('True'|'False');
SPACE : [ ] -> skip;