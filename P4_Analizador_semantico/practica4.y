%{

    #include <stdlib.h>
    #include <string.h>
    #include <stdio.h>

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
	lista,
	desconocido
} dTipo;

typedef struct{
	tipoEntrada entrada;
	char nombre[100];
	dTipo tipoDato;
	unsigned int parametros;
} entradaTS;

unsigned int tipotmp=0;
unsigned int flag=0;

#define MAX_TS 500

unsigned int TOPE = 0;
unsigned int Subprog;

entradaTS TS[MAX_TS];

typedef struct{
	int atributo;
	char lexema[100];
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
	}while(TS[TOPE].entrada != marca);
}

void verificarDescononocidos(unsigned int atributo){
	unsigned int aux = TOPE-1;
	
	while(TS[aux].tipoDato == desconocido){
		TS[aux].tipoDato = atributo;
		aux --;
	}	
	
}

void comprobarDeclarados(char* nuevo){
	unsigned int aux = TOPE-1;

	while(TS[aux].entrada != marca){
		if(strcmp(TS[aux].nombre,nuevo) == 0){
			printf("La variable de nombre '%s' ya esta definida.\n",nuevo);
			exit(-1);
		}
		aux --;
	}
	
}

int comprobarExistencia(atributos* nuevo){
	unsigned int aux = TOPE-1;

	while(TS[aux].entrada != marca){
		if(strcmp(TS[aux].nombre,(*nuevo).lexema) == 0){
            (*nuevo).tipo=TS[aux].tipoDato;

			return 0;
		}else
			aux --;
	}

	return 1;
	
}

void insertarIdentificador(char* id, unsigned int atributo){
	comprobarDeclarados(id);

	TS[TOPE].entrada = variable;
    strcpy(TS[TOPE].nombre, id);
	TS[TOPE].tipoDato = atributo;
	TOPE ++;
}

void insertarDesconocido(char* id){
	comprobarDeclarados(id);
		
	TS[TOPE].entrada = variable;
        strcpy(TS[TOPE].nombre, id);
	TS[TOPE].tipoDato = tipotmp;
	TOPE ++;
}

int buscarTipo(char* nuevo){
	unsigned int aux = TOPE-1;

	while(TS[aux].entrada != marca){
		if(strcmp(TS[aux].nombre,nuevo) == 0){
			return TS[aux].tipoDato;
		}
		aux --;
	}
}

void mostrarTabla(){

	for(int i = 0; i  < TOPE; i ++){
		if(TS[i].entrada == marca){
			printf("%d\n", TS[i].entrada);
		}else
			printf("%d nombre = '%s' tipoDato = %d \n", TS[i].entrada,TS[i].nombre,TS[i].tipoDato);
	}
	printf("------------------------------------------------\n");
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
%token SALIDA SENTENCIA_LIST TRUE FALSE

/* Fin definicion de tokens */




%start S
%%
/* Inicio reglas gramaticales */
S : CAB_PROGRAMA BLOQUE;

CAB_PROGRAMA : PRINCIPAL INI_PARENTESIS FIN_PARENTESIS {insertarMarca();}
             | PRINCIPAL error FIN_PARENTESIS {printf(", expected: 'INI_PARENTESIS'\n"); yyerrok;}
             | PRINCIPAL INI_PARENTESIS error {printf(", expected: 'FIN_PARENTESIS'\n"); yyerrok;}
;

BLOQUE : INI_BLOQUE
	OPCIONES 
	FIN_BLOQUE {vaciarEntradas();}
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
;

DECL_VAR_LOCALES : VAR_LOCAL
                 | CONSTANTE VAR_LOCAL
;

VAR_LOCAL : TIPO_DATO DECL_MULTIPLE ID PUNTOYCOMA {insertarIdentificador($3.lexema, $1.tipo);}
          | TIPO_DATO ID PUNTOYCOMA {insertarIdentificador($2.lexema, $1.tipo);}
          | TIPO_DATO DECL_MULTIPLE ASIGNACION PUNTOYCOMA {insertarIdentificador($3.lexema, $1.tipo);}
          | TIPO_DATO ASIGNACION PUNTOYCOMA {insertarIdentificador($2.lexema, $1.tipo);}
;

DECL_MULTIPLE : DECL_MULTIPLE ID COMA {insertarDesconocido($2.lexema);}
              | DECL_MULTIPLE ASIGNACION COMA {insertarDesconocido($2.lexema);}
              | ID COMA {insertarDesconocido($1.lexema);}
              | ASIGNACION COMA {insertarDesconocido($1.lexema);}
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

SENTENCIA_SI : BUCLE_SI INI_PARENTESIS EXPRESION FIN_PARENTESIS ENTONCES CANTIDAD_CODIGO SINO CANTIDAD_CODIGO {if($3.tipo != bool){printf("Expresión no booleana en línea %d.\n",yylineno);exit(-1);}}
             | BUCLE_SI INI_PARENTESIS EXPRESION FIN_PARENTESIS ENTONCES CANTIDAD_CODIGO {if($3.tipo != bool){printf("Expresión no booleana en línea %d.\n",yylineno);exit(-1);}}
;


BUCLE_WHILE : BUCLE_MIENTRAS INI_PARENTESIS EXPRESION FIN_PARENTESIS CANTIDAD_CODIGO {if($3.tipo != bool){printf("Expresión no booleana en línea %d.\n",yylineno);exit(-1);}} 
            | BUCLE_MIENTRAS error EXPRESION FIN_PARENTESIS CANTIDAD_CODIGO {printf(", expected: 'INI_PARENTESIS'\n"); yyerrok;}
            | BUCLE_MIENTRAS INI_PARENTESIS EXPRESION error CANTIDAD_CODIGO {printf(", expected: 'FIN_PARENTESIS'\n"); yyerrok;}
;

TIPO_DATO : TIPO_BASICO {$$.tipo = $1.tipo;}
          | TIPO_COMPLEJO {$$.tipo = $1.tipo;}
;

TIPO_BASICO : TIPO_VAR; {if (flag==1){ flag=0;} else{tipotmp=$$.tipo = $1.tipo;}}

TIPO_COMPLEJO : DECL_LISTAS TIPO_VAR; {tipotmp= $$.tipo = lista;flag=1;}

ASIGNACION : ID OP_ASIGNACION EXPRESION {if($1.tipo != $3.tipo){printf("Asignacion de tipos invalida en la linea %d. %d  %d\n",yylineno,$1.tipo , $3.tipo);exit(-1);};}
           | ID error EXPRESION {printf(", expected: 'OP_ASIGNACION'\n"); yyerrok;}
           | ID OP_ASIGNACION ASIGNACION {if($1.tipo != $3.tipo){printf("Asignacion de tipos invalida en la linea %d.\n",yylineno);exit(-1);};}
           | ID error ASIGNACION {printf(", expected: 'OP_ASIGNACION'\n"); yyerrok;}
           | ID OP_ASIGNACION EST_AGREGADO {if($1.tipo != $3.tipo){printf("Asignacion de tipos invalida en la linea %d.\n",yylineno);exit(-1);};}
           | ID error EST_AGREGADO {printf(", expected: 'OP_ASIGNACION'\n"); yyerrok;}
;

EXPRESION : EXPRESION OP_ADD_MI_ARITMETICA EXPRESION {if($1.tipo == $3.tipo){$$.tipo = $1.tipo;}else{printf("Operacion de tipos incompatibles en linea %d\n",yylineno);exit(-1);}}
          | EXPRESION OP_ADD_MI_ARITMETICA error {printf(", expected: 'EXPRESION'\n"); yyerrok;}
          | EXPRESION OP_ADD_PL_ARITMETICA EXPRESION {if($1.tipo == $3.tipo){$$.tipo = $1.tipo;}else{printf("Operacion de tipos incompatibles en linea %d\n",yylineno);exit(-1);}}
          | EXPRESION OP_ADD_PL_ARITMETICA error {printf(", expected: 'EXPRESION'\n"); yyerrok;}
          | EXPRESION OP_MULT_ARITMETICA EXPRESION {if($1.tipo == $3.tipo){$$.tipo = $1.tipo;}else{printf("Operacion de tipos incompatibles en linea %d\n",yylineno);exit(-1);}}
          | EXPRESION OP_MULT_ARITMETICA error {printf(", expected: 'EXPRESION'\n"); yyerrok;}
          | EXPRESION OP_LIST_ARITMETICA EXPRESION {if($1.tipo == $3.tipo){$$.tipo = $1.tipo;}else{printf("Operacion de tipos incompatibles en linea %d\n",yylineno);exit(-1);}}
          | EXPRESION OP_LIST_ARITMETICA error {printf(", expected: 'EXPRESION'\n"); yyerrok;}
          | EXPRESION OP_AND_LOGICO EXPRESION  {if($1.tipo == bool && $3.tipo == bool){$$.tipo = bool;}else{$$.tipo=desconocido;}}
          | EXPRESION OP_AND_LOGICO error {printf(", expected: 'EXPRESION'\n"); yyerrok;}
          | EXPRESION OP_OR_LOGICO EXPRESION {if($1.tipo == bool && $3.tipo == bool){$$.tipo = bool;}else{$$.tipo=desconocido;}}
          | EXPRESION OP_OR_LOGICO error {printf(", expected: 'EXPRESION'\n"); yyerrok;}
          | EXPRESION OP_EXOR_LOGICO EXPRESION {if($1.tipo == bool && $3.tipo == bool){$$.tipo = bool;}else{printf("Expresion logica erronea en linea %d.\n",yylineno);exit(-1);}}
          | EXPRESION OP_EXOR_LOGICO error {printf(", expected: 'EXPRESION'\n"); yyerrok;}
          | EXPRESION OP_IGUALDAD_LOGICO EXPRESION {if($1.tipo == $3.tipo){$$.tipo = bool;}else{$$.tipo=desconocido;}}
          | EXPRESION OP_IGUALDAD_LOGICO error {printf(", expected: 'EXPRESION'\n"); yyerrok;}
          | NEGACION EXPRESION {if($2.tipo == bool){$$.tipo = bool;}else{$$.tipo=desconocido;}}
          | OP_UNARIO ID {$$.tipo = $2.tipo;}
          | ID OP_UNARIO {$$.tipo = $1.tipo;}
          | OP_ADD_MI_ARITMETICA ID {$$.tipo = $2.tipo;}
          | OP_ADD_MI_ARITMETICA NUMERO {$$.tipo = $2.tipo;}
          | ID OP_DECREMENTO EXPRESION
          | ID OP_INCREMENTO ID OP_LIST_ARITMETICA EXPRESION
          | INI_PARENTESIS EXPRESION FIN_PARENTESIS {$$.tipo = $2.tipo;}
          | INI_PARENTESIS EXPRESION error {printf(", expected: 'FIN_PARENTESIS'\n"); yyerrok;}
          | NUMERO {$$.tipo = $1.tipo;}
          | LOGICO {$$.tipo = $1.tipo;}
          | ID {if(comprobarExistencia(&$1) == 1){printf("Uso de variable '%s' no definida en linea %d.\n",$1.lexema,yylineno);exit(-1);}else{$$.tipo = $1.tipo;printf("tipo ID %d\n",$1.tipo );}}
;

PROCEDIMIENTO : ID INI_PARENTESIS ARGUMENTOS FIN_PARENTESIS
              | ID INI_PARENTESIS ARGUMENTOS error {printf(", expected: 'FIN_PARENTESIS'\n"); yyerrok;}
              | ID INI_PARENTESIS FIN_PARENTESIS
              | ID INI_PARENTESIS error {printf(", expected: 'FIN_PARENTESIS'\n"); yyerrok;}
;

ARGUMENTOS : ARGUMENTOS COMA ID
          | ID
;

EST_AGREGADO : INI_AGREGADO AGREGADOS FIN_AGREGADO {$$.tipo = $2.tipo;}
             | error AGREGADOS FIN_PARENTESIS {printf(", expected: 'INI_AGREGADO'\n"); yyerrok;}
	     | INI_AGREGADO FIN_AGREGADO
             | error FIN_AGREGADO {printf(", expected: 'INI_AGREGADO'\n"); yyerrok;}
;

AGREGADOS : EXPRESION COMA AGREGADOS {if($1.tipo != $3.tipo){printf("Mezcla de tipos en agregado de linea %d.\n",yylineno); exit(-1);}else{$$.tipo = $1.tipo;}}
          | EXPRESION {$$.tipo = $1.tipo;}
;

OP_UNARIO : OP_INCREMENTO | OP_LIST_UNARIO | OP_DECREMENTO
;

NUMERO : REAL {$$.tipo = real;}
	 | ENTERO{$$.tipo = entero;}
;

LOGICO : TRUE {$$.tipo = bool;}
	 | FALSE {$$.tipo = bool;}
;

/* Fin reglas gramaticales */

%%


// #include "error.y"
#include "lex.yy.c"

int main (int argc, char** argv) {

    yyparse();

}

void yyerror(const char* s){
    printf("\033[1;31m%s\033[0m en linea %d:  %s", s, yylineno , yytext);
}