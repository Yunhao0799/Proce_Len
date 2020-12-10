%{

    #include <stdlib.h>
    #include <string.h>

    int yylex();
    void yyerror(const char *s);
%}

/* Inicio definicion precedencia de operadores  */
/* Cuanto mas abajo mas prioritario */

%left OP_OR_LOGICO
%left OP_AND_LOGICO
%left OP_EXOR_LOGICO
%left OP_IGUALDAD_LOGICO
%left OP_ADD_PL_ARITMETICA OP_ADD_MI_ARITMETICA
%left OP_MULT_ARITMETICA
%right OP_LIST_UNARIO NEGACION
%left OP_INCREMENTO
%left OP_DECREMENTO
%nonassoc SINO OP_LIST_ARITMETICA

/* Fin definicion de precedencia de operadores*/


/* Inicio definicion de tokens  */

%token ID NUMERO INI_BLOQUE FIN_BLOQUE INI_AGREGADO FIN_AGREGADO PUNTOYCOMA 
%token OP_ASIGNACION BUCLE_SI BUCLE_MIENTRAS 
%token BUCLE_PARA INI_PARENTESIS FIN_PARENTESIS ENTONCES DECL_LISTAS 
%token TIPO_VAR COMA DOSPUNTOS MODO_FOR CONSTANTE COMILLAS FINPARA PRINCIPAL ENTRADA
%token SALIDA SENTENCIA_LIST

/* Fin definicion de tokens */




%start S
%%
/* Inicio reglas gramaticales */
S : CAB_PROGRAMA BLOQUE;

CAB_PROGRAMA : PRINCIPAL INI_PARENTESIS FIN_PARENTESIS
             | PRINCIPAL error FIN_PARENTESIS {printf(", expected: 'INI_PARENTESIS'\n"); yyerrok;}
             | PRINCIPAL INI_PARENTESIS error {printf(", expected: 'FIN_PARENTESIS'\n"); yyerrok;}
;

BLOQUE : INI_BLOQUE OPCIONES FIN_BLOQUE
       | error OPCIONES FIN_BLOQUE {printf(", expected: 'INI_BLOQUE'\n"); yyerrok;}
       | INI_BLOQUE OPCIONES error {printf(", expected: 'FIN_BLOQUE'\n"); yyerrok;}
;

OPCIONES : OPCIONES DECL_VAR_LOCALES 
         | OPCIONES DECL_PROCEDIMIENTO
         | OPCIONES SENTENCIAS 
         |
;

//DECL_PROCEDIMIENTOS : DECL_PROCEDIMIENTOS DECL_PROCEDIMIENTO
//                    | DECL_PROCEDIMIENTO
//;

DECL_PROCEDIMIENTO : CAB_PROCEDIMIENTO BLOQUE;

CAB_PROCEDIMIENTO : ID INI_PARENTESIS PARAMETRO FIN_PARENTESIS
                  | ID INI_PARENTESIS FIN_PARENTESIS
                  | ID error PARAMETRO FIN_PARENTESIS {printf(", expected: 'INI_PARENTESIS'\n"); yyerrok;}
                  | ID error FIN_PARENTESIS {printf(", expected: 'INI_PARENTESIS'\n"); yyerrok;}
                  | ID INI_PARENTESIS PARAMETRO error {printf(", expected: 'FIN_PARENTESIS'\n"); yyerrok;}
                  | ID INI_PARENTESIS error {printf(", expected: 'FIN_PARENTESIS'\n"); yyerrok;}
;

PARAMETRO : PARAMETRO COMA TIPO_DATO ID
          | TIPO_DATO ID
//          |
;

DECL_VAR_LOCALES : VAR_LOCAL
                 | CONSTANTE VAR_LOCAL
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
           | EXPRESION PUNTOYCOMA
           | SENTENCIA_LIST ID PUNTOYCOMA
           | ID SENTENCIA_LIST PUNTOYCOMA
           | PROCEDIMIENTO PUNTOYCOMA

;

SENTENCIA_ENTRADA : ENTRADA INI_PARENTESIS LISTA_VAR FIN_PARENTESIS 
                  | ENTRADA error LISTA_VAR FIN_PARENTESIS {printf(", expected: 'INI_PARENTESIS'\n"); yyerrok;}
                  | ENTRADA INI_PARENTESIS LISTA_VAR error {printf(", expected: 'FIN_PARENTESIS'\n"); yyerrok;}
		  | ENTRADA INI_PARENTESIS error error {printf(", expected: 'LISTA_VAR'\n"); yyerrok;}
;

SENTENCIA_SALIDA : SALIDA INI_PARENTESIS LIST_ESXP_O_CAD FIN_PARENTESIS 
                 | SALIDA error LIST_ESXP_O_CAD FIN_PARENTESIS {printf(", expected: 'INI_PARENTESIS'\n"); yyerrok;}
                 | SALIDA INI_PARENTESIS LIST_ESXP_O_CAD error {printf(", expected: 'FIN_PARENTESIS'\n"); yyerrok;}
;

LISTA_VAR : LISTA_VAR COMA ID
          | ID
;

LIST_ESXP_O_CAD : LIST_ESXP_O_CAD COMA EXPRESION
                | LIST_ESXP_O_CAD COMA COMILLAS CADENA COMILLAS
                | EXPRESION
                | COMILLAS CADENA COMILLAS
;

CANTIDAD_CODIGO : BLOQUE 
		  | SENTENCIAS
;

CADENA : CADENA ID
       | ID
;

BUCLE_FOR : BUCLE_PARA ID OP_ASIGNACION NUMERO MODO_FOR NUMERO FINPARA CANTIDAD_CODIGO;

SENTENCIA_SI : BUCLE_SI INI_PARENTESIS EXPRESION FIN_PARENTESIS ENTONCES CANTIDAD_CODIGO SINO CANTIDAD_CODIGO
             | BUCLE_SI INI_PARENTESIS EXPRESION FIN_PARENTESIS ENTONCES CANTIDAD_CODIGO
	     | BUCLE_SI INI_PARENTESIS EXPRESION FIN_PARENTESIS error CANTIDAD_CODIGO {printf(", expected: 'ENTONCES'\n"); yyerrok;}
	     | BUCLE_SI INI_PARENTESIS error FIN_PARENTESIS ENTONCES CANTIDAD_CODIGO {printf(", expected: 'EXPRESION'\n"); yyerrok;}
;

BUCLE_WHILE : BUCLE_MIENTRAS INI_PARENTESIS EXPRESION FIN_PARENTESIS CANTIDAD_CODIGO
            | BUCLE_MIENTRAS error EXPRESION FIN_PARENTESIS CANTIDAD_CODIGO {printf(", expected: 'INI_PARENTESIS'\n"); yyerrok;}
            | BUCLE_MIENTRAS INI_PARENTESIS EXPRESION error CANTIDAD_CODIGO {printf(", expected: 'FIN_PARENTESIS'\n"); yyerrok;}
;

TIPO_DATO : TIPO_BASICO
          | TIPO_COMPLEJO
;

TIPO_BASICO : TIPO_VAR;

TIPO_COMPLEJO : DECL_LISTAS TIPO_VAR;
		| DECL_LISTAS error {printf(", expected: 'TIPO_VAR'\n"); yyerrok;}

ASIGNACION : ID OP_ASIGNACION EXPRESION
           | ID error EXPRESION {printf(", expected: 'OP_ASIGNACION'\n"); yyerrok;}
           | ID OP_ASIGNACION ASIGNACION
           | ID error ASIGNACION {printf(", expected: 'OP_ASIGNACION'\n"); yyerrok;}
           | ID OP_ASIGNACION EST_AGREGADO
           | ID error EST_AGREGADO {printf(", expected: 'OP_ASIGNACION'\n"); yyerrok;}
;

EXPRESION : EXPRESION OP_ADD_MI_ARITMETICA EXPRESION
          | EXPRESION OP_ADD_MI_ARITMETICA error {printf(", expected: 'EXPRESION'\n"); yyerrok;}
          | EXPRESION OP_ADD_PL_ARITMETICA EXPRESION
          | EXPRESION OP_ADD_PL_ARITMETICA error {printf(", expected: 'EXPRESION'\n"); yyerrok;}
          | EXPRESION OP_MULT_ARITMETICA EXPRESION
          | EXPRESION OP_MULT_ARITMETICA error {printf(", expected: 'EXPRESION'\n"); yyerrok;}
	      | EXPRESION OP_LIST_ARITMETICA EXPRESION
          | EXPRESION OP_LIST_ARITMETICA error {printf(", expected: 'EXPRESION'\n"); yyerrok;}
          | EXPRESION OP_AND_LOGICO EXPRESION 
          | EXPRESION OP_AND_LOGICO error {printf(", expected: 'EXPRESION'\n"); yyerrok;}
          | EXPRESION OP_OR_LOGICO EXPRESION
          | EXPRESION OP_OR_LOGICO error {printf(", expected: 'EXPRESION'\n"); yyerrok;}
          | EXPRESION OP_EXOR_LOGICO EXPRESION
          | EXPRESION OP_EXOR_LOGICO error {printf(", expected: 'EXPRESION'\n"); yyerrok;}
          | EXPRESION OP_IGUALDAD_LOGICO EXPRESION
          | EXPRESION OP_IGUALDAD_LOGICO error {printf(", expected: 'EXPRESION'\n"); yyerrok;}
          | NEGACION EXPRESION
          | OP_UNARIO ID
          | ID OP_UNARIO
	      | OP_ADD_MI_ARITMETICA ID
	      | ID OP_DECREMENTO EXPRESION
          | ID OP_INCREMENTO ID OP_LIST_ARITMETICA EXPRESION
          | INI_PARENTESIS EXPRESION FIN_PARENTESIS
          | INI_PARENTESIS EXPRESION error {printf(", expected: 'FIN_PARENTESIS'\n"); yyerrok;}
          | NUMERO
          | ID
;

PROCEDIMIENTO : ID INI_PARENTESIS ARGUMENTOS FIN_PARENTESIS
              | ID INI_PARENTESIS ARGUMENTOS error {printf(", expected: 'FIN_PARENTESIS'\n"); yyerrok;}
              | ID INI_PARENTESIS FIN_PARENTESIS
              | ID INI_PARENTESIS error {printf(", expected: 'FIN_PARENTESIS'\n"); yyerrok;}
;

ARGUMENTOS : ARGUMENTOS COMA ID
           | ID
;

EST_AGREGADO : INI_AGREGADO AGREGADOS FIN_AGREGADO
             | error AGREGADOS FIN_PARENTESIS {printf(", expected: 'INI_AGREGADO'\n"); yyerrok;}
		     | INI_AGREGADO FIN_AGREGADO
             | error FIN_AGREGADO {printf(", expected: 'INI_AGREGADO'\n"); yyerrok;}
;

AGREGADOS : EXPRESION COMA AGREGADOS
          | EXPRESION
;

OP_UNARIO : OP_INCREMENTO | OP_LIST_UNARIO | OP_DECREMENTO
;

/* Fin reglas gramaticales */

%%


// #include "error.y"
#include "lex.yy.c"

int main (int argc, char** argv) {

    yyparse();

}

void yyerror(const char* s){
    printf("\033[1;31m%s\033[0m en linea %d: unexpected %s", s, yylineno , yytext);
}
