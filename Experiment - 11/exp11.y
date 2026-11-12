
%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
void yyerror(const char *s);
%}

%token TYPE ID NUM
%token LBRACKET RBRACKET COMMA SEMICOLON INVALID

%%

declaration:
      TYPE variable_list SEMICOLON
      {
          printf("\nValid variable declaration!\n");
      }
      ;

variable_list:
      variable
      | variable_list COMMA variable
      ;

variable:
      ID dimensions
      ;

dimensions:
      /* empty */
      | dimensions LBRACKET NUM RBRACKET
      ;

%%

void yyerror(const char *s)
{
    printf("\nInvalid variable declaration!\n");
}

int main()
{
    printf("Parser for Generic Variable Declaration "
           "with Multidimensional Arrays\n");

    printf("Enter a variable declaration:\n");

    yyparse();

    return 0;
}

