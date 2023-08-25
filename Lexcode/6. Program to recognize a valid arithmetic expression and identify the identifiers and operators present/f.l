%{
#include <stdio.h>
#include <string.h>
int operators_count = 0, operands_count = 0, valid = 1, top = -1, l = 0, j = 0;
char operands[10][10], operators[10][10], stack[100];
%}
%%
"(" {
	top++;
	stack[top] = '(';
}
"{" {
	top++;
	stack[top] = '{';
}
"[" {
	top++;
	stack[top] = '[';
}
")" {
	if (stack[top] != '(') {
		valid = 0;	
	}
	else if(operands_count>0 && (operands_count-operators_count)!=1){
		valid=0;
	}
	else{
		top--;
		operands_count=1;
		operators_count=0;
	}
}
"}" {
	if (stack[top] != '{') {
		valid = 0;	
	}
	else if(operands_count>0 && (operands_count-operators_count)!=1){
		valid=0;
	}
	else{
		top--;
		operands_count=1;
		operators_count=0;
	}
}
"]" {
	if (stack[top] != '[') {
		valid = 0;
	}
	else if(operands_count>0 && (operands_count-operators_count)!=1){
		valid=0;
	}
	else{
		top--;
		operands_count=1;
		operators_count=0;
	}
		
}
"+"|"-"|"*"|"/" {
	operators_count++;
	strcpy(operators[l], yytext);
	l++;
}
[0-9]+|[a-zA-Z][a-zA-Z0-9_]* {
	operands_count++;
	strcpy(operands[j], yytext);
	j++;
}

\n {
  if(operands_count>0 && (operands_count-operators_count)!=1){
		valid=0;
  }
  if (valid == 1 && top == -1) {
      printf("\nValid Expression\n");
      
      printf("Operators:\n");
      for(int k=0;k<l;k++) {
           printf("%s\n",operators[k]);
      }
      printf("Operands:\n");
      for(int k=0;k<j;k++) {
           printf("%s\n",operands[k]);
      }
  }
  else
      printf("\nInvalid Expression\n");
  valid = 1, top = -1;
  l = 0, j = 0;
  operators_count=0, operands_count=0;
}
%%


int yywrap()
{
	return 1;
}
int main()
{
	int k;
	yylex();

	return 0;
}
