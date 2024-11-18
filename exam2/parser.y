%{
#include <stdio.h>
int yylex(void);
void yyerror(const char *s);
%}

%start S
%token a b

%%

S: a B { printf("Valid\n"); }
 | b A { printf("Valid\n"); }
 ;

A: a { printf("Valid\n"); }
 | a S { printf("Valid\n"); }
 | b A A { printf("Valid\n"); }
 ;

B: b { printf("Valid\n"); }
 | b S { printf("Valid\n"); }
 | a B B { printf("Valid\n"); }
 ;

%%

int main() {
    yyparse();
    return 0;
}

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}
