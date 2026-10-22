%{
#include<stdio.h>
#include<stdlib.h>
#include"y.tab.h"
%}

%%

[0-9]+(\.[0-9]+)?      {yylval.value = atof(yytext); return NUMBER;}

"++"                   {return INC;}
"--"                   {return DEC;}

[+\-*/%^]              {return yytext[0];}

"("                    {return '(';}
")"                    {return ')';}

[ \t]                  {;}
\n                     {return '\n';}

.                      {return yytext[0];}

%%

int yywrap()
{
    return 1;
}
