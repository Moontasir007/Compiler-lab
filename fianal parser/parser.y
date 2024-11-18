%{
#include <stdio.h>
extern int yylex();
void yyerror(const char *);

%}

%token ID PLUS TIMES LPAREN RPAREN
%left PLUS
%left TIMES

%%

program: E { printf("Parsing successful!\n"); }
       ;

E: T E_prime
  ;

E_prime: PLUS T E_prime
       | /* Epsilon */
       ;

T: F T_prime
  ;

T_prime: TIMES F T_prime
       | /* Epsilon */
       ;

F: LPAREN E RPAREN
  | ID
  ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Parser error: %s\n", s);
}

int main() {
    yyparse();
    return 0;
}
