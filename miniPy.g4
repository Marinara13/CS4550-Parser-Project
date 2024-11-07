grammar miniPy;

prog: (expr NEWLINE)*;

expr: (operation | assignment);

operation: (add | sub | mul | div | mod);

assignment: (equ | addequ | subequ | mulequ | divequ);

variable: VAR STR INT FLO BOO;

add: variable ('+') variable
    | INT
    | FLO
    | VAR;

sub: variable ('-') variable
    | INT
    | FLO
    | VAR;

mul: variable ('*') variable
    | INT
    | FLO
    | VAR;

div: variable ('/') variable
    | INT
    | FLO
    | VAR;

mod: variable ('%') variable
    | INT
    | FLO
    | VAR;

equ: variable ('=') variable
    | VAR
    | STR
    | INT
    | FLO
    | BOO;

addequ: variable ('+=') variable
    | INT
    | FLO
    | VAR;

subequ: variable ('-=') variable
    | INT
    | FLO
    | VAR;

mulequ: variable ('*=') variable
    | INT
    | FLO
    | VAR;

divequ: variable ('/=') variable
    | INT
    | FLO
    | VAR;

NEWLINE : [\r\n]+;
fragment NUM : [0-9];
VAR : [a-z0-9_]+;
STR : '"20"';
INT : NUM+;
FLO : NUM+ [.,] NUM+;
BOO : ('True'|'False');
SPACE : [ \t] -> skip;