%{
#include <stdio.h>
#include <stdlib.h>

int yylex(void);
void yyerror(const char *s);
%}

%token FOR TYPE ID NUM
%token LE GE EQ NE AND OR INC DEC
%token ADD_ASSIGN SUB_ASSIGN MUL_ASSIGN DIV_ASSIGN

%right '=' ADD_ASSIGN SUB_ASSIGN MUL_ASSIGN DIV_ASSIGN
%left OR
%left AND
%left EQ NE
%left '<' '>' LE GE
%left '+' '-'
%left '*' '/' '%'
%right '!'
%left INC DEC

%%

program:
    for_loop
    ;

for_loop:
    FOR '(' init ';' condition ';' update ')' body
    {
        printf("\nValid FOR loop statement!\n");
    }
    ;

init:
      /* empty */
    | TYPE declarator_list
    | expr_list
    ;

declarator_list:
      declarator
    | declarator_list ',' declarator
    ;

declarator:
      ID
    | ID '=' expr
    ;

condition:
      /* empty */
    | expr
    ;

update:
      /* empty */
    | expr_list
    ;

expr_list:
      expr
    | expr_list ',' expr
    ;

expr:
      ID
    | NUM
    | ID '=' expr
    | ID ADD_ASSIGN expr
    | ID SUB_ASSIGN expr
    | ID MUL_ASSIGN expr
    | ID DIV_ASSIGN expr
    | expr '+' expr
    | expr '-' expr
    | expr '*' expr
    | expr '/' expr
    | expr '%' expr
    | expr '<' expr
    | expr '>' expr
    | expr LE expr
    | expr GE expr
    | expr EQ expr
    | expr NE expr
    | expr AND expr
    | expr OR expr
    | '!' expr
    | ID INC
    | ID DEC
    | INC ID
    | DEC ID
    | '(' expr ')'
    ;

body:
      stmt
    ;

block:
      '{' '}'
    | '{' stmt_list '}'
    ;

stmt_list:
      stmt
    | stmt_list stmt
    ;

stmt:
      TYPE declarator_list ';'
    | expr ';'
    | for_loop
    | block
    | ';'
    ;
%%

void yyerror(const char *s)
{
    printf("\nInvalid FOR loop statement!\n");
}

int main(void)
{
    printf("       FOR Loop Parser - Experiment 10       \n");
    printf("Enter a FOR loop statement:\n");

    yyparse();
    return 0;
}
