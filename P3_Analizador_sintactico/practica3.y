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




%START S
%%
/* Inicio reglas gramaticales */
S : CAB_PROGRAMA BLOQUE;

CAB_PROGRAMA : PRINCIPAL INI_PARENTESIS FIN_PARENTESIS;

BLOQUE : INI_BLOQUE OPCIONES FIN_BLOQUE
;

OPCIONES : OPCIONES DECL_VAR_LOCALES 
		| OPCIONES DECL_PROCEDIMIENTOS
		| OPCIONES SENTENCIAS 
		| DECL_VAR_LOCALES 
		| DECL_PROCEDIMIENTOS
		| SENTENCIAS
;

DECL_PROCEDIMIENTOS : DECL_PROCEDIMIENTOS DECL_PROCEDIMIENTO
			| DECL_PROCEDIMIENTO
			|
;

DECL_PROCEDIMIENTO : CAB_PROCEDIMIENTO BLOQUE;

CAB_PROCEDIMIENTO : ID INI_PARENTESIS PARAMETRO FIN_PARENTESIS;

PARAMETRO : PARAMETRO COMA TIPO_DATO ID
		  | TIPO_DATO ID
		  | PARAMETRO COMA ID
		  | ID
		  |
;

DECL_VAR_LOCALES : DECL_VAR_LOCALES VAR_LOCAL
				 | VAR_LOCAL
				 |
;

VAR_LOCAL : TIPO_DATO DECL_MULTIPLE ID PUNTOYCOMA
		| TIPO_DATO ID PUNTOYCOMA
		| TIPO_DATO DECL_MULTIPLE ASIGNACION PUNTOYCOMA
		| TIPO_DATO ASIGNACION PUNTOYCOMA
;

DECL_MULTIPLE : DECL_MULTIPLE ID COMA
			  | DECL_MULTIPLE ASIGNACION COMA
			  | ID COMA
			  | ASIGNACION COMA
;

SENTENCIAS : BUCLE_FOR
		   | BUCLE_WHILE
		   | SENTENCIA_SI
		   | ASIGNACION PUNTOYCOMA
		   | SENTENCIA_ENTRADA PUNTOYCOMA
		   | SENTENCIA_SALIDA PUNTOYCOMA
;

SENTENCIA_UNICA : BUCLE_FOR
		   | BUCLE_WHILE
		   | SENTENCIA_SI
		   | ASIGNACION PUNTOYCOMA
		   | SENTENCIA_ENTRADA PUNTOYCOMA
		   | SENTENCIA_SALIDA PUNTOYCOMA
		   |
;

SENTENCIA_ENTRADA : ENTRADA INI_PARENTESIS LISTA_VAR FIN_PARENTESIS ;

SENTENCIA_SALIDA : SALIDA INI_PARENTESIS LIST_ESXP_O_CAD FIN_PARENTESIS ;

LISTA_VAR : LISTA_VAR COMA ID
          | ID
;

LIST_ESXP_O_CAD : LIST_ESXP_O_CAD COMA EXPRESION
				| LIST_ESXP_O_CAD COMA COMILLAS CADENA COMILLAS
				| EXPRESION
				| COMILLAS CADENA COMILLAS
;

CADENA : CADENA ID
	   | ID
;

BUCLE_FOR : BUCLE_PARA ID OP_ASIGNACION NUMERO MODO_FOR NUMERO FINPARA BLOQUE;

CONDICION : CONDICION OP_LOGICO CONDICION 
		  | INI_PARENTESIS CONDICION FIN_PARENTESIS
		  | NEGACION CONDICION
		  | NUMERO
		  | ID
;

SENTENCIA_SI : BUCLE_SI INI_PARENTESIS CONDICION FIN_PARENTESIS ENTONCES BLOQUE SINO BLOQUE
		| BUCLE_SI INI_PARENTESIS CONDICION FIN_PARENTESIS ENTONCES BLOQUE
		| BUCLE_SI INI_PARENTESIS error FIN_PARENTESIS ENTONCES BLOQUE
		| BUCLE_SI INI_PARENTESIS error FIN_PARENTESIS ENTONCES BLOQUE SINO BLOQUE
;

BUCLE_WHILE : BUCLE_MIENTRAS INI_PARENTESIS CONDICION FIN_PARENTESIS BLOQUE;

TIPO_DATO : TIPO_BASICO
          | TIPO_COMPLEJO
;

TIPO_BASICO : TIPO_VAR;

TIPO_COMPLEJO : DECL_LISTAS TIPO_BASICO;

CONST : CONSTANTE TIPO_DATO ID PUNTOYCOMA;

OP_BINARIO : OP_ARITMETICA
		   | OP_LOGICO
		   | OP_BINARIO
;

ASIGNACION : ID OP_ASIGNACION EXPRESION
		| ID OP_ASIGNACION ID
		| ID OP_ASIGNACION CAB_PROCEDIMIENTO 
		| ID OP_ASIGNACION ASIGNACION
;

EXPRESION : EXPRESION OP_BINARIO EXPRESION
		  | EXPRESION OP_UNI_BIN EXPRESION
		  | OP_UNARIO EXPRESION
		  | EXPRESION OP_UNARIO
		  | OP_UNI_BIN EXPRESION
		  | EXPRESION OP_UNI_BIN
		  | EXPRESION OP_UNARIO EXPRESION OP_ARITMETICA EXPRESION
		  | INI_PARENTESIS EXPRESION FIN_PARENTESIS
		  | NUMERO
		  | ID
;

EST_AGREGADO : INI_AGREGADO AGREGADOS FIN_AGREGADO

AGREGADOS : EXPRESION COMA AGREGADOS
		  | EXPRESION
		  |
;


/* Fin reglas gramaticales */

%%


#include "error.y"
#include "lex.yy.c"

int main (int argc, char** argv) {

	yyparse();

}
