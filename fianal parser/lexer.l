%option noyywrap
%{
#include "parser.tab.h" // Include the token definitions from parser file
%}

%%

"+"    { return PLUS; }
"*"    { return TIMES; }
"("    { return LPAREN; }
")"    { return RPAREN; }
"id"   { return ID; }
"\n"   { /* Ignore newlines */ }
[ \t]  { /* Ignore whitespace */ }
.      { /* Ignore any other character */ }

%%

