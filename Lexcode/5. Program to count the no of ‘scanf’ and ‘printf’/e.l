%{
#include<stdio.h>
int sc=0,pf=0;
%}

%%
"scanf" { fprintf(yyout,"readf"); sc++; }
"printf" { fprintf(yyout,"writef"); pf++; }
%%

int yywrap() { return 1; }

int main()
{
yylex();
printf("No. of scanf: %d\n",sc);
printf("No. of printf: %d\n",pf);

}