grammar miniPy;

expr: assignment
    | expr ('+'|'-'|'*'|'/') expr
    | INT;

INT: [0-9]+;