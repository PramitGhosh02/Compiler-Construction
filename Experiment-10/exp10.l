%{
#include "y.tab.h"
%}

%%

"for"                   {return FOR;}
"int"                   {return INT;}
"++"                    {return INC;}
"--"                    {return DEC;}

[0-9]+                  {return NUM;}
[A-Za-z_][A-Za-z0-9_]*  {return ID;}

"=="                    {return EQ;}
"<="                    {return LE;}
">="                    {return GE;}

[=;()+\-*/<>]           {return yytext[0];}

[ \t\n]                 ;

.                       {return yytext[0];}

%%

int yywrap()
{
    return 1;
}
