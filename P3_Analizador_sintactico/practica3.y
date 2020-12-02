%{

	#include <stdlib.h>
	#include <string.h>

%}

/* Inicio definicion precedencia de operadores  */
/* Cuanto mas abajo mas prioritario */



/* Fin definicion de precedencia de operadores*/


/* Inicio definicion de tokens  */

%token ID NUMERO INI_BLOQUE FIN_BLOQUE INI_AGREGADO FIN_AGREGADO PUNTOYCOMA 
%token OP_ASIGNACION BUCLE_SI OP_ARITMETICA BUCLE_MIENTRAS OP_LOGICO OP_UNARIO
%token BUCLE_PARA INI_PARENTESIS FIN_PARENTESIS SINO ENTONCES DECL_LISTAS OP_UNI_BIN
%token TIPO_VAR COMA DOSPUNTOS MODO_FOR CONSTANTE COMILLAS FINPARA PRINCIPAL ENTRADA
%token SALIDA NEGACION SENTENCIA_LIST

/* Fin definicion de tokens */




%start S
%%
/* Inicio reglas gramaticales */
S : ID











/* Fin reglas gramaticales */

%%


#include "error.y"
#include "lex.yy.c"

int main (int argc, char** argv) {

	yyparse();

}
