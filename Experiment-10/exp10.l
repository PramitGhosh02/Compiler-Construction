%{
#include "y.tab.h"
#include <stdio.h>
#include <stdlib.h>
%}

%option noyywrap

%%

"for"                       { return FOR; }
"int"|"float"|"char"|"double" { return TYPE; }
"<="                        { return LE; }
">="                        { return GE; }
"=="                        { return EQ; }
"!="                        { return NE; }
"&&"                        { return AND; }
"||"                        { return OR; }
"++"                        { return INC; }
"--"                        { return DEC; }
"+="                        { return ADD_ASSIGN; }
"-="                        { return SUB_ASSIGN; }
"*="                        { return MUL_ASSIGN; }
"/="                        { return DIV_ASSIGN; }
[0-9]+(\.[0-9]+)?           { return NUM; }
[a-zA-Z_][a-zA-Z0-9_]*      { return ID; }
[ \t\r\n]+                  ; /* Ignore whitespace */
.                           { return yytext[0]; }

%%
