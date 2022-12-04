%{
#include <stdio.h>
%}
HEADER 		"#include"[" "]*"<"[a-z]+".h>"
DIGIT		[0-9]+
IDENTIFIER	[a-zA-Z][a-zA-Z0-9]* 
KEYWORD		"int"|"long"|"char"|"float"|"double"|"if"|"else"|"while"|"do"|"goto"|"struct"|"void"|"short"|"for"|"break"|"continue"
OPERATOR		"+"|"="|"-"|"/"|">"|"<"|">="|"<="|"=="|"!="|"%"|"*"|"++"|"--"|"^"|"+="|"-="
SPECIAL		","|";"|"#"|"("|")"|"["|"]"|"{"|"}"|"."|"!"|"$"|"%"|"^"|"&"|"*"|":"|"~"|"'"|"`"|"?"

%%
{HEADER}		printf("Header		:	%s\n",yytext);
[\n\t" "]*
{KEYWORD} 	printf("Keywords	:	%s\n",yytext);
{IDENTIFIER}	printf("Identifiers	:	%s\n",yytext);
{DIGIT} 		printf("Constants			:	%s\n",yytext);
{OPERATOR} 	printf("Operators	:	%s\n",yytext);
{SPECIAL} 	printf("Special Chars	:	%s\n",yytext);
\".*\" 		printf("String		:	%s\n",yytext);
%%
void main(){
yyin=fopen("file.txt","r");
yylex();
}
int yywrap()
{
return 1;
}