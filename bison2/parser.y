%{
#include <stdio.h>
#include <stdlib.h>
void yyerror( char *);
int yylex(void);
%}

%union {
    char *str;
}

%token <str> ID
%start start


%%
start: statement { printf("Parsing is successfull\n"); };
statement:
    ID B | ID A
    ;
A:ID| ID statement | ID A P;
P:A;
B:ID| ID statement | ID B Q;
Q:B;

%%
void yyerror( char *s) {
    fprintf(stderr, "%s\n", s);
}
int main() {
    freopen ("sentence.txt", "r", stdin);  //sentence.txt holds the expression
    yyparse();
}

