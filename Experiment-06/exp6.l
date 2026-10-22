%{
#include<stdio.h>
#include<stdlib.h>
%}
%%
[0-9]+ {
    int n = atoi(yytext);
    fprintf(yyout, "%X", n);
}
0[xX][0-9a-fA-F]+ {
    int n = 0;
    sscanf(yytext, "%x", &n);
    fprintf(yyout, "%d", n);
}
[ \t\n]+ {fprintf(yyout, "%s", yytext);}
. {fprintf(yyout, "%s", yytext);}
%%
int main()
{
    yyin = fopen("input.txt", "r");
    yyout = fopen("output.txt", "w");
    if (yyin == NULL)
    {
        printf("Cannot open input.txt\n");
        return 1;
    }
    yylex();
    fclose(yyin);
    fclose(yyout);
    printf("Conversion completed. Check output.txt\n");
    return 0;
}
int yywrap()
{
    return 1;
}
