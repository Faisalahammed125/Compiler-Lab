%{
#include<stdio.h>
int vowels=0;
int cons=0;
%}

%%
[aeiouAEIOU] {vowels++;}
[a-zA-Z] {cons++;}
\n  { 
      printf("No of vowels=%d\nNo of consonants=%d\n",vowels,cons); 
      vowels=0,cons=0;
    }
%%

int yywrap() { return 1; }
int main()
{
yylex();
}
