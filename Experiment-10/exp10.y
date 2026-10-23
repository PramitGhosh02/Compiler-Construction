%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
int yyerror(char *s);
%}

%token FOR INT INC DEC NUM ID
%token EQ LE GE

%%

program:
        for_statement
        ;

for_statement:
        FOR '(' initialization ';' condition ';' update ')' statement
        ;

initialization:
        INT ID '=' NUM
        | ID '=' NUM
        ;

condition:
        ID '<' NUM
        | ID '>' NUM
        | ID LE NUM
        | ID GE NUM
        | ID EQ NUM
        ;

update:
        ID INC
        | ID DEC
        ;

statement:
        ';'
        | '{' '}'
        ;

%%

int main()
{
    printf("Enter FOR loop statement:\n");

    if(yyparse() == 0)
        printf("Valid FOR loop\n");

    return 0;
}

int yyerror(char *s)
{
    printf("Invalid FOR loop\n");
    return 0;
}
