/*lex program to recognize and count the number of identifiers in a given input*/
/*definition section*/
%option noyywrap
%{
    #include "parser.tab.h"
%}

/*rules section*/
%%
"a"|"b" {
    return ID;
}

[ \t]   ;   /* skip whitespace */



%%

