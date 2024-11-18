/*Lex program to recognize and count the number of identifiers in a given input*/
/*Definition section*/
%{
	#include<stdio.h>
	int keyword = 0, scmt = 0, mcmt = 0, op = 0, id =0, flag = 0, key = 0,symbol = 0, string = 0, inumber = 0, fnumber = 0;
	
%}

/*rules section*/
%%

if|else|printf|return|main|int|double|include|stdio.h {keyword++; printf("\'%s\'",yytext);}
"#"|";"|"("|")"|"{"|"}"|"," {symbol++; printf("\'%s\'",yytext);}

"/*" {if(flag==0) flag++;}
"*/" {if(flag==1) flag=0; mcmt++; }

"//".*"\n" {if(flag==0) scmt++; }

[a-zA-Z_][a-zA-Z0-9_]* {if(flag==0) id++; printf("\'%s\'",yytext);}
[+-]?[0-9]+ {if(flag==0) inumber++; printf("\'%s\'",yytext);}
[+-]?[0-9]+"."[0-9]+ {if(flag==0) fnumber++; printf("\'%s\'",yytext);}

"+"|"-"|"*"|"/"|"%"|"=="|"<="|">="|">"|"<"|"=" {if(flag==0) op++; printf("\'%s\'",yytext);}

"\"".*"\"" {string++; printf("\'%s\'",yytext);}

. {}
%%

int main()
{
	yyin = fopen("input.c","r");

	yylex();
	printf("Number of Keyword is %d\n",keyword);
	printf("Number of single line comment is %d\n",scmt);
	printf("Number of multiline comment is %d\n",mcmt);
	printf("Number of operator is %d\n",op);
	printf("Number of symbol is %d\n",symbol);
	printf("Number of string is %d\n",string);
	printf("Number of id is %d\n",id);
	printf("Number of int number is %d\n",inumber);
	printf("Number of float number is %d\n",fnumber);

	printf("Total Number of tokens is %d\n",keyword+op+symbol+string+id+inumber+fnumber);

	return 0;
}
int yywrap()
{
return 1;
}