%{
#include <stdio.h>
%}

%%
"int" { printf("int: Integer\n"); }
[a-zA-Z][a-zA-Z0-9]* { printf("%s: Identifier\n", yytext); }
[0-9]+ { printf("%s: Digit\n", yytext); }
[=] { printf("=: Assignment Operator\n"); }
[+] { printf("+: Plus\n"); }
[;] { printf(";: Semicolon\n"); }
[ \t\n] ; // Ignore whitespace characters
. ;       // Ignore any other characters
%%

int yywrap() { return 1; }
int main()
{
yylex();
return 0;
}
