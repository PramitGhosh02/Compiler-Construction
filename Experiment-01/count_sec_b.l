%{
#include <stdio.h>
int count = 0;
%}

%%
"sec-B"     { count++; }
.|\n        {}
%%

int main() {
    printf("Enter a Statement: ");
    yylex();
    printf("Occurrence: %d\n", count);
    return 0;
}

int yywrap() {
    return 1;
}
