%{
#include<stdio.h>
int nc=0;
%}

%%
"/*"[a-zA-Z0-9\n\t ]*"*/"  {nc++;}
"//"[a-zA-Z0-9\t ]*"\n"    {nc++;}
%%

int yywrap() { return 1; }

int main()
{
yylex();
printf("number of comments: %d\n",nc);
}