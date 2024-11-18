/*Lex program to recognize and count the number of identifiers in a given input*/
/*Definition section*/
%{
	#include<stdio.h>
	int keyword = 0, scmt = 0, mcmt = 0, op = 0, flag = 0, key = 0,symbol = 0;
	
%}

/*rules section*/
%%
include {key++;}
if|else|printf|return|main|int {keyword++;}
"#"|";"|"("|")"|"{"|"}"|"," {symbol++;}

"/*" {if(flag==0) flag++;}
"*/" {if(flag==1) flag=0; mcmt++;}
"//".*"\n" {if(flag==0) scmt++;}

"+"|"-"|"*"|"/"|"%"|"=="|"<="|">="|">"|"<" {if(flag==0) op++;}

. {}
%%

int main()
{
	yyin = fopen("input.c","r");

	yylex();
	printf("Number of Keyword is %d\n",keyword+(key*2));
	printf("Number of single line comment is %d\n",scmt);
	printf("Number of multiline comment is %d\n",mcmt);
	printf("Number of operator is %d\n",op-(2*key));
	printf("Number of symbol is %d\n",symbol);

	return 0;
}
int yywrap()
{
return 1;
}