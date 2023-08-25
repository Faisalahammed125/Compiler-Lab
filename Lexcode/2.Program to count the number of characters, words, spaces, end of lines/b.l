%{
#include<stdio.h>
int w=0,ch=0,sp=0,l=0;
%}

WORD [^ \t\n,\.:]+
EOL [\n]
SPACE [ ]

%%
{WORD} {w++;ch+=yyleng;}
{EOL}  {l++;}
{SPACE} {sp++;}
.       {ch++;}
%%

int yywrap(){ return 1;}
int main(){
   yylex();
   printf("Number of words : %d\n",w);
   printf("Number of character: %d\n",ch);
   printf("Number of space : %d\n",sp); 
   printf("Number of end of line : %d\n",l);
}
