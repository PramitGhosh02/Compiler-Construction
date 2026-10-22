%{
#include<stdio.h>
#include<stdlib.h>

int yylex();
int yyerror(char *s);

int power(int a, int b)
{
    int result = 1;

    while(b > 0)
    {
        result = result * a;
        b--;
    }

    return result;
}
%}

%token NUMBER
%token INC DEC

%%

stmt: stmt expr '\n' {printf("Result: %d\n",$2);}
    |
    ;

expr: NUMBER          {$$ = $1;}
    | expr expr '+'   {$$ = $1 + $2;}
    | expr expr '-'   {$$ = $1 - $2;}
    | expr expr '*'   {$$ = $1 * $2;}
    | expr expr '/'   {$$ = $1 / $2;}
    | expr expr '^'   {$$ = power($1, $2);}
    | expr INC        {$$ = $1 + 1;}
    | expr DEC        {$$ = $1 - 1;}
    ;

%%

int main()
{
    printf("Enter postfix expression:\n");
    yyparse();

    return 0;
}

int yyerror(char *s)
{
    printf("Invalid Expression\n");
    return 0;
}
