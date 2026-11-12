
%{
#include "y.tab.h"
%}

%%

"int"|"float"|"char"|"double"  { return TYPE; }

[a-zA-Z_][a-zA-Z0-9_]*          { return ID; }

[0-9]+                          { return NUM; }

"["                             { return LBRACKET; }
"]"                             { return RBRACKET; }
","                             { return COMMA; }
";"                             { return SEMICOLON; }

[ \t\n]+                        ;

.                               { return INVALID; }

%%

int yywrap()
{
    return 1;
}
