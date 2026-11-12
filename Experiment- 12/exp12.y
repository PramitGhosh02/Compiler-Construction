 %{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int yylex();
void yyerror(const char *s);

int tempCount = 1;

char* newTemp()
{
    char *temp = malloc(20);
    sprintf(temp, "t%d", tempCount++);
    return temp;
}
%}

%union {
    char *str;
}

%token <str> ID NUMBER
%type <str> expr

%left '+' '-'
%left '*' '/'
%right UMINUS

%%

input:
      expr
      {
          printf("\nIntermediate Code Generated Successfully.\n");
      }
      ;

expr:
      expr '+' expr
      {
          $$ = newTemp();
          printf("%s = %s + %s\n", $$, $1, $3);
      }
    | expr '-' expr
      {
          $$ = newTemp();
          printf("%s = %s - %s\n", $$, $1, $3);
     }
    | expr '*' expr
      {
          $$ = newTemp();
          printf("%s = %s * %s\n", $$, $1, $3);
      }
    | expr '/' expr
      {
          $$ = newTemp();
          printf("%s = %s / %s\n", $$, $1, $3);
      }
    | '-' expr %prec UMINUS
      {
          $$ = newTemp();
          printf("%s = -%s\n", $$, $2);
      }
    | '(' expr ')'
      {
          $$ = $2;
      }
    | ID
      {
          $$ = $1;
      }
    | NUMBER
      {
          $$ = $1;
      }
    ;

%%

void yyerror(const char *s)
{
    printf("Invalid arithmetic expression: %s\n", s);
}

int main()
{
    printf("Intermediate Code Generator for Arithmetic Expression\n");
    printf("Enter an arithmetic expression:\n");
    yyparse();
    return 0;
}
