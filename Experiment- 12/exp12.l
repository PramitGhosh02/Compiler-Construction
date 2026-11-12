%{
#include "y.tab.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
%}

%option noyywrap

%%

[0-9]+                  { yylval.str = strdup(yytext); return NUMBER; }
[a-zA-Z_][a-zA-Z0-9_]*  { yylval.str = strdup(yytext); return ID; }

[+\-*/()]               { return yytext[0]; }

[ \t\n]+                ;

.                       { printf("Invalid character: %s\n", yytext); }

%%
