%{
#include"y.tab.h"
%}

%%
[0-9]+ {return NUM;}
[A-Za-z_][_a-zA-Z0-9]* {return ID;}
[ \t] {;}
\n {return 0;}
. {return yytext[0];}
%%

int yywrap(){
	return 1;
}
