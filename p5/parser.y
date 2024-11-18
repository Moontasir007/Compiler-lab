%{
    #include<stdio.h>
    extern int yylex();
    void yyerror(char *s);
%}




%%

start: ;

%%

void yyerror(char *s){
    fprintf(stderr, "error: %s\n", s);
}

int main(){
    yyparse();
    printf("\nValid\n");
    return 0;
}