%{
#include<stdio.h>
#include<string.h>
int id=0;
char ans[50][50];
%}

%%
[a-zA-Z_][a-zA-Z0-9_]* { strcpy(ans[id], yytext); id++; }
.+ { }
\n { }
%%
int yywrap() { return 1; }

int main ()
{
//yyin=fopen(argv[1],"r");
yylex();
printf("Valid identifiers are\n");
for(int k=0; k < id; k++){
   printf("%s\n",ans[k]);
}
printf("No of identifiers = %d\n",id);
}