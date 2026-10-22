%{
#include <stdio.h>
int count = 0;
%}

%%
"//".*      { count++; }
.|\n        { ECHO; }
%%

int main() {
    printf("Enter a Statement: ");
    yylex();
    printf("\nOccurrence of comments: %d\n", count);
    return 0;
}

int yywrap() {
    return 1;
}
