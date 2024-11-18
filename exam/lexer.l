%{
#include "parser.tab.h"
%}

%%

"a"     { return a; }
"b"     { return b; }
.       { /* Ignore any other characters */ }

%%

int yywrap() {
    return 1;
}
