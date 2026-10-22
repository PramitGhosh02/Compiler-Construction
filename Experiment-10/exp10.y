%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int yylex(void);
int yyerror(const char *s);

int temp_count = 1;

char* new_temp(void) {
    char *temp = (char*)malloc(16);
    snprintf(temp, 16, "t%d", temp_count++);
    return temp;
}
%}

%union {
    char *str;
}

%token <str> NUMBER ID
%type <str> expr

%left '+' '-'
%left '*' '/'

%%

lines:
      lines line
    |
    ;

line:
      '\n'
    | ID '=' expr '\n' {
        printf("Three-Address Code:\n%s = %s\n\n", $1, $3);
        temp_count = 1;
    }
    | expr '\n' {
        printf("Three-Address Code Result in: %s\n\n", $1);
        temp_count = 1;
    }
    | error '\n' {
        yyerrok;
    }
    ;

expr:
      expr '+' expr {
        char *t = new_temp();
        printf("%s = %s + %s\n", t, $1, $3);
        $$ = t;
    }
    | expr '-' expr {
        char *t = new_temp();
        printf("%s = %s - %s\n", t, $1, $3);
        $$ = t;
    }
    | expr '*' expr {
        char *t = new_temp();
        printf("%s = %s * %s\n", t, $1, $3);
        $$ = t;
    }
    | expr '/' expr {
        char *t = new_temp();
        printf("%s = %s / %s\n", t, $1, $3);
        $$ = t;
    }
    | '(' expr ')' {
        $$ = $2;
    }
    | '-' expr %prec '*' {
        char *t = new_temp();
        printf("%s = -%s\n", t, $2);
        $$ = t;
    }
    | ID {
        $$ = $1;
    }
    | NUMBER {
        $$ = $1;
    }
    ;

%%

int main(void) {
    printf("Intermediate Code Generator (Three-Address Code)\n");
    printf("Enter expression or assignment (e.g., a = b + c * d):\n");
    yyparse();
    return 0;
}

int yyerror(const char *s) {
    printf("Syntax Error: %s\n", s);
    return 0;
}
