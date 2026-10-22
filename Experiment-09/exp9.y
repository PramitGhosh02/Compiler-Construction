%{
#include<stdio.h>
#include<stdlib.h>
#include<math.h>

int yylex();
int yyerror(char *s);

%}

%union
{
    double value;
}

%token <value> NUMBER
%token INC DEC

%type <value> expr

%left '+' '-'
%left '*' '/' '%'
%right '^'
%right UMINUS UPLUS
%left INC DEC

%%

input:
      input line
    |
    ;

line:
      '\n'
    | expr '\n'       {printf("Result = %.2lf\n",$1);}
    | error '\n'      {printf("Invalid Expression\n"); yyerrok;}
    ;

expr:
      NUMBER                         {$$ = $1;}
    | '(' expr ')'                   {$$ = $2;}
    | expr '+' expr                 {$$ = $1 + $3;}
    | expr '-' expr                 {$$ = $1 - $3;}
    | expr '*' expr                 {$$ = $1 * $3;}
    | expr '/' expr                 {$$ = $1 / $3;}
    | expr '%' expr                 {$$ = fmod($1,$3);}
    | expr '^' expr                 {$$ = pow($1,$3);}
    | '+' expr %prec UPLUS          {$$ = $2;}
    | '-' expr %prec UMINUS         {$$ = -$2;}
    | expr INC                      {$$ = $1 + 1;}
    | expr DEC                      {$$ = $1 - 1;}
    ;

%%

int main()
{
    printf("Desk Calculator\n");
    printf("Enter expression:\n");

    yyparse();

    return 0;
}

int yyerror(char *s)
{
    return 0;
}
