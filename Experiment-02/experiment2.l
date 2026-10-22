%{
#include <stdio.h>

extern FILE *yyin;

int comments = 0;
int keywords = 0;
int identifiers = 0;
int words = 0;
int lines = 0;
int spaces = 0;
%}

letter      [A-Za-z_]
digit       [0-9]
id          {letter}({letter}|{digit})*

%%

"//".*                                  { comments++; }

"auto"|"break"|"case"|"char"|"const"|"continue"|"default"|"do"|"double"|"else"|"enum"|"extern"|"float"|"for"|"goto"|"if"|"int"|"long"|"register"|"return"|"short"|"signed"|"sizeof"|"static"|"struct"|"switch"|"typedef"|"union"|"unsigned"|"void"|"volatile"|"while"  {
                                            keywords++;
                                            words++;
                                        }

{id}                                   {
                                            identifiers++;
                                            words++;
                                        }

{digit}+                               {
                                            words++;
                                        }

[ \t]+                                 {
                                            spaces += yyleng;
                                        }

\n                                     {
                                            lines++;
                                        }

.                                      ;

%%

int yywrap(void)
{
    return 1;
}

int main(void)
{
    yyin = fopen("input.c", "r");

    if (yyin == NULL)
    {
        printf("Cannot open input.c\n");
        return 1;
    }

    yylex();

    printf("\nRESULT\n");
    printf("Comments    : %d\n", comments);
    printf("Keywords    : %d\n", keywords);
    printf("Identifiers : %d\n", identifiers);
    printf("Words       : %d\n", words);
    printf("Lines       : %d\n", lines);
    printf("Spaces      : %d\n", spaces);

    fclose(yyin);
    return 0;
}
