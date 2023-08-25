%{
#include<stdio.h>
int is_compound=0;
%}

%%
[ \t\n][Aa][Nn][Dd][ \t\n] { is_compound = 1; }
[ \t\n][Oo][Rr][ \t\n] { is_compound = 1; }
[ \t\n][Bb][Uu][Tt][ \t\n] { is_compound = 1; }
. {}
%%

int yywrap() { return 1; }

int main()
{
  yylex(); 
  if(is_compound == 1) {
      printf("Sentence is compound\n");
  }
  else {
      printf("Sentence is compound\n");
  }
}