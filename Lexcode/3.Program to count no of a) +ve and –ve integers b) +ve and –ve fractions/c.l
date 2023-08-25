%{
#include<stdio.h>
int posint=0,negint=0,posfrac=0,negfrac=0;
%}

DIGIT [0-9]

%%
[+]?{DIGIT}+            {posint++;}
[-]{DIGIT}+             {negint++;}
[+]?{DIGIT}*[.]{DIGIT}+ {posfrac++;}
[-]{DIGIT}*[.]{DIGIT}+  {negfrac++;}
%%

int yywrap(){ return 1;}
int main()
{
   yylex();
   printf("Number of positive integers: %d\n",posint);
   printf("Number of positive integers with fractions: %d\n",posfrac);
   printf("Number of negative integers: %d\n",negint);
   printf("Number of negative integers with fractions: %d\n",negfrac);
}
