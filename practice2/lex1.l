/*Lex program to recognize and count the number of identifiers in a given input*/
/*Definition section*/
%{
	#include<stdio.h>
	int others = 0;
	int keyword = 0;
	int integer = 0;
	float Float = 0;
	int id = 0;
%}

/*rules section*/
%%
"int"|"double"|"float"|"char"|"do"|"while"|"main"|"return"|"printf"|"scanf"|"include"|"stdio.h" {
keyword++;
printf("\'%s\' ",yytext);
}

[a-zA-Z_][a-zA-Z0-9_]* {
id++;
printf("\'%s\' ",yytext);
}

[+-]?[0-9]+ {
integer++;
printf("\'%s\'",yytext);
}

[+-]?[0-9]+"."[0-9]+ {
Float++;
printf("\'%s\'",yytext);
}

. {}
%%

int main()
{
	yyin = fopen("input.c","r");

	yylex();
	printf("Number of Keyword is %d\n",keyword);
	printf("Number of identifier is %d\n",id);
	printf("Number of integer is %d\n",integer);
	printf("Number of Float is %d\n",Float);

	return 0;
}
int yywrap()
{
return 1;
}