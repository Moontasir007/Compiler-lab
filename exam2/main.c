#include <stdio.h>
#include "parser.tab.h"

extern FILE *yyin;

int main() {
    yyin = stdin;  // Set input to stdin (keyboard)

    printf("Enter a string: ");
    yyparse();

    return 0;
}
