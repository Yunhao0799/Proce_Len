%{

    #include <stdlib.h>
    #include <string.h>

    int yylex();
    void yyerror(const char *s);

/* Inicio definicion de la tabla de simbolos */

typedef enum{
	marca,
	procedimiento,
	variable,
	parametro_formal
} tipoEntrada;

typedef enum{
	bool,
	caracter,
	real,
	entero,
	lista
} dTipo;

typedef struct{
	tipoEntrada entrada;
	char* nombre;
	dTipo tipoDato;
	unsigned int parametros;
} entradaTS;

#define MAX_TS 500

unsigned int TOPE = 0;
unsigned int Subprog;

entradaTS TS[MAX_TS];

typedef struct{
	int atributo;
	char* lexema;
	dTipo tipo;
} atributos;

#define YYSTYPE atributos

/* Fin definicion de la tabla de simbolos */


/* Inicio definicion funciones */

void insertarMarca(){
	TS[TOPE].entrada = marca;
	TOPE ++;
}

void vaciarEntradas(){
	do{
		TOPE --;
	}while(TS[TOPE].entrada != marca && TOPE > 0);
}

void insertarIdentificador(char* id, unsigned int atributo){
	TS[TOPE].entrada = variable;
	TS[TOPE].nombre = id;
	TS[TOPE].tipoDato = atributo;
	TOPE ++;
}

/* Fin definicion funciones */

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

%token ID ENTERO REAL INI_BLOQUE FIN_BLOQUE INI_AGREGADO FIN_AGREGADO PUNTOYCOMA 
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

BLOQUE : INI_BLOQUE {printf("Pone Marca.\n"); insertarMarca();}
	OPCIONES 
	FIN_BLOQUE {printf("Reduce marcas.\n"); vaciarEntradas();}
       | error OPCIONES FIN_BLOQUE {printf(", expected: 'INI_BLOQUE'\n"); yyerrok;}
       | INI_BLOQUE OPCIONES error {printf(", expected: 'FIN_BLOQUE'\n"); yyerrok;}
;


OPCIONES : OPCIONES DECL_VAR_LOCALES 
         | OPCIONES DECL_PROCEDIMIENTO
         | OPCIONES SENTENCIAS 
         |
;

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

VAR_LOCAL : TIPO_DATO DECL_MULTIPLE ID PUNTOYCOMA {printf("Añade variable.\n"); insertarIdentificador($3.lexema, $1.tipo);}
          | TIPO_DATO ID PUNTOYCOMA {printf("Añade variable.\n"); insertarIdentificador($2.lexema, $1.tipo);}
          | TIPO_DATO DECL_MULTIPLE ASIGNACION PUNTOYCOMA {printf("Añade variable.\n"); insertarIdentificador($3.lexema, $1.tipo);}
          | TIPO_DATO ASIGNACION PUNTOYCOMA {printf("Añade variable.\n"); insertarIdentificador($2.lexema, $1.tipo);}
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
;

SENTENCIA_ENTRADA : ENTRADA INI_PARENTESIS LISTA_VAR FIN_PARENTESIS 
                  | ENTRADA error LISTA_VAR FIN_PARENTESIS {printf(", expected: 'INI_PARENTESIS'\n"); yyerrok;}
                  | ENTRADA INI_PARENTESIS LISTA_VAR error {printf(", expected: 'FIN_PARENTESIS'\n"); yyerrok;}
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

//CONDICION : CONDICION OP_AND_LOGICO CONDICION 
//          | CONDICION OP_OR_LOGICO CONDICION
//          | CONDICION OP_EXOR_LOGICO CONDICION
//          | CONDICION OP_IGUALDAD_LOGICO CONDICION
//          | INI_PARENTESIS CONDICION FIN_PARENTESIS
//          | NEGACION CONDICION
//          | EXPRESION
;

SENTENCIA_SI : BUCLE_SI INI_PARENTESIS EXPRESION FIN_PARENTESIS ENTONCES CANTIDAD_CODIGO SINO CANTIDAD_CODIGO
             | BUCLE_SI INI_PARENTESIS EXPRESION FIN_PARENTESIS ENTONCES CANTIDAD_CODIGO
;


BUCLE_WHILE : BUCLE_MIENTRAS INI_PARENTESIS EXPRESION FIN_PARENTESIS CANTIDAD_CODIGO
            | BUCLE_MIENTRAS error EXPRESION FIN_PARENTESIS CANTIDAD_CODIGO {printf(", expected: 'INI_PARENTESIS'\n"); yyerrok;}
            | BUCLE_MIENTRAS INI_PARENTESIS EXPRESION error CANTIDAD_CODIGO {printf(", expected: 'FIN_PARENTESIS'\n"); yyerrok;}
;

TIPO_DATO : TIPO_BASICO {$$.tipo = $1.tipo;}
          | TIPO_COMPLEJO {$$.tipo = $1.tipo;}
;

TIPO_BASICO : TIPO_VAR; {$$.tipo = $1.tipo;}

TIPO_COMPLEJO : DECL_LISTAS TIPO_VAR; {$$.tipo = lista;}

//OP_BINARIO : OP_ARITMETICA
//           | OP_LOGICO
//;

ASIGNACION : ID OP_ASIGNACION EXPRESION {$$.lexema = $1.lexema;}
           | ID error EXPRESION {printf(", expected: 'OP_ASIGNACION'\n"); yyerrok;}
           | ID OP_ASIGNACION ASIGNACION {$$.lexema = $1.lexema;}
           | ID error ASIGNACION {printf(", expected: 'OP_ASIGNACION'\n"); yyerrok;}
           | ID OP_ASIGNACION EST_AGREGADO {$$.lexema = $1.lexema;}
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
          | PROCEDIMIENTO 
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

//OP_LOGICO : OP_AND_LOGICO | OP_OR_LOGICO | OP_EXOR_LOGICO
//          | OP_IGUALDAD_LOGICO 
//;
//OP_ARITMETICA : OP_ADD_PL_ARITMETICA | OP_MULT_ARITMETICA | OP_ADD_MI_ARITMETICA
//;

OP_UNARIO : OP_INCREMENTO | OP_LIST_UNARIO | OP_DECREMENTO
;

NUMERO : REAL | ENTERO;

/* Fin reglas gramaticales */

%%


// #include "error.y"
#include "lex.yy.c"

int main (int argc, char** argv) {

    yyparse();

}

void yyerror(const char* s){
    printf("\033[1;31m%s\033[0m en linea %d:  %s\n", s, yylineno , yytext);
}