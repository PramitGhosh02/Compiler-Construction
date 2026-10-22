%{
#include<stdio.h>
int count = 0;
%}
%%
.*\.[Cc][Oo][Mm][ \t]*\n    {count++;}
.*\n                        ;
%%
int main()
{
    yyin = fopen("input.txt", "r");
    if (yyin == NULL)
    {
        printf("Cannot open input.txt\n");
        return 1;
    }
    yylex();
    printf("Lines ending with .com or .COM = %d\n", count);
    fclose(yyin);
    return 0;
}
int yywrap()
{
    return 1;
}
