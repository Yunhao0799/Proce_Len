%{

	#include <stdlib.h>
	#include <string.h>
	#include "y.tab.h"

%}

/* Inicio definicion precedencia de operadores  */
/* Cuanto mas abajo mas prioritario */

%left SUM

/* Fin definicion de precedencia de operadores*/


/* Inicio definicion de tokens  */

%token ID

/* Fin definicion de tokens */




%start principal
%%
/* Inicio reglas gramaticales */











/* Fin reglas gramaticales */

%%




#include "lex.yy.c"
#include "error.y"

int main (int argc, char** argv) {

	yyparse();

}
