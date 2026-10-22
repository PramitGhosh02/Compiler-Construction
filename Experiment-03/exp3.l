%{
#include<stdio.h>

int word = 0;
int number = 0;
%}

%%

[Aa][a-zA-Z]*/[^a-zA-Z]    { word++; }

[0-9]+(\.[0-9]+)?([eE][+-]?[0-9]+)?    { number++; }

[a-zA-Z]+    {}

.|\n    {}

%%

int main()
{
    printf("Enter the text:\n");
    yylex();

    printf("\nWords starting with A or a = %d\n", word);
    printf("Numbers = %d\n", number);

    return 0;
}

int yywrap()
{
    return 1;
}
