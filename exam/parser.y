%{
#include <stdio.h>
%}

%start S
%token a b

%%

S: a B | b A;

A: a | a S | b A A;

B: b | b S | a B B;

%%

int main() {
    yyparse();
    return 0;
}

int yywrap() {
    return 1;
}

int yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
    return 0;
}
