%{
    #include <stdio.h>
%}
DATE ([0-9]{1,2}[" "]*"/"[" "]*){2}[0-9]{4}[" "]*
SEM ["I"|"V"]*|[" "]*
SPECIAL ":"|"."|","
DIGITS [0-9]
SMALL [a-z]
CAPITAL [A-Z]
%{
    int wcount=0,spcount=0,dcount=0,lcount=0,scount=0,qcount=0,ccount=0;
%}
%%
[\t" "] {wcount++;}
{DATE}  printf("Date of examination :     %s\n",yytext);
{SPECIAL} {spcount++;}
{SEM}  printf("Semester :     %s\n",yytext);
{SMALL} {scount++;}
{CAPITAL} {ccount++;}
{DIGITS} {dcount++;}
\n {lcount++,wcount++;}
"?" {qcount++,spcount++;}
%%
void main(){
yyin=fopen("file.txt","r");
yylex();
printf("Number of Qs :   %d\n",qcount);
printf("Word count  :   %d\n",wcount);
printf("Line count  :   %d\n",lcount);
printf("Small char count :   %d\n",scount);
printf("Capital char count :   %d\n",ccount);
printf("Digit count :   %d\n",dcount++);
printf("Special character count :   %d\n",spcount);
}
int yywrap()
{
return 1;
}