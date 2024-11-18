%{
    #include<stdio.h>
%}

%%
[a-zA-Z][a-zA-Z0-9]* {printf("Token: Identifier \'%s\'\n",yytext);}
"("|")"|";" {printf("Token: Symbol \'%s\'\n",yytext);}
"+"|"-"|"*"|"/"|"%" {printf("Token: operator \'%s\'\n",yytext);}
"=" {printf("Token: Assignment \'%s\'\n",yytext);}
[0-9]+ {printf("Token: Number \'%s\'\n",yytext);}
. {}
%%

int yywrap(void) {
    return 1;
}

int main() {
    yylex();
    return 0;
}