%{

    #include <stdlib.h>
    #include <string.h>
    #include <stdio.h>

    int yylex();
    int yylineno;
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
	desconocido
} dTipo;

typedef struct{
	tipoEntrada entrada;
	char nombre[100];
	dTipo tipoDato;
	int esLista;
	unsigned int parametros;
} entradaTS;

int tipotmp=-1;
unsigned int flag=0;
unsigned int n_parametros;
unsigned int n_argumentos;

#define MAX_TS 500

unsigned int TOPE = 0;
unsigned int Subprog;

entradaTS TS[MAX_TS];

int topeBuffer=0;
entradaTS buffer[10];

typedef struct{
	int atributo;
	char lexema[100];
	dTipo tipo;
	int lista;
} atributos;

#define YYSTYPE atributos

/* Fin definicion de la tabla de simbolos */


/* Inicio definicion funciones */

void mostrarTabla(){

    for(int i = 0; i  < TOPE; i ++){
        printf("indice:%d \t-->  ", i);
        if(TS[i].entrada == marca){
            printf("**MARCA** %d, %s, tipoDato %d\n", TS[i].entrada, TS[i].nombre, TS[i].tipoDato);
        }else if (TS[i].entrada == variable)
            printf("tipo entrada: %d \tnombre = '%s' \ttipoDato = %d \n", TS[i].entrada,TS[i].nombre,TS[i].tipoDato);
        else
            printf("tipo entrada: %d \tnombre = '%s' \tn_parametros = %d \n", TS[i].entrada,TS[i].nombre,TS[i].parametros);

    }
    printf("------------------------------------------------\n");
}

void insertarMarca(){    
    TS[TOPE].entrada = marca;
	TOPE ++;
}

void vaciarEntradas(){
	do{
		TOPE --;
	}while(TS[TOPE].entrada != marca);
}

void comprobarDeclarados(char* nuevo){
	unsigned int aux = TOPE-1;

	while(TS[aux].entrada != marca){
		if(strcmp(TS[aux].nombre,nuevo) == 0){
			printf("En linea %d: La variable de nombre '%s' ya esta definida.\n",yylineno, nuevo);
			exit(-1);
		}
		aux --;
	}
}

int comprobarExistencia(atributos* nuevo){
	int aux = TOPE-1;
	while(aux >=0){
		if(strcmp(TS[aux].nombre,(*nuevo).lexema) == 0){
            (*nuevo).tipo=TS[aux].tipoDato;
			return 0;
		}else{
			aux --;
        }
	}

	return 1;
}

void ComprobarNArgs(char* item, int n_args){
    unsigned int aux = TOPE-1;
	while(aux >=0){
		if(strcmp(TS[aux].nombre, item) == 0){
            if(TS[aux].parametros != n_args)
                printf("En linea %d: Numero de argumentos erroneo, se esperaban %d y se encontraron %d.\n", yylineno, TS[aux].parametros, n_args);
            return;
		}else
			aux --;
	}
}

void verificarParametros(){

    while(topeBuffer > 0){
        comprobarDeclarados(buffer[topeBuffer-1].nombre);
        TS[TOPE].entrada = buffer[topeBuffer-1].entrada;
        strcpy(TS[TOPE].nombre, buffer[topeBuffer-1].nombre);
        TS[TOPE].tipoDato = buffer[topeBuffer-1].tipoDato;

        TOPE ++;
        topeBuffer--;
    }

}

void insertarIdentificador(char* id, unsigned int atributo){
	comprobarDeclarados(id);

	TS[TOPE].entrada = variable;
    strcpy(TS[TOPE].nombre, id);
	TS[TOPE].tipoDato = atributo;
	TOPE ++;
}

void insertarProcedimiento(char* id, int nparams){
    comprobarDeclarados(id);

    TS[TOPE].entrada = procedimiento;
    strcpy(TS[TOPE].nombre, id);
    TS[TOPE].parametros = nparams;
    TOPE ++;

    if (nparams>0){
        verificarParametros();
    }
}

void insertarParametro(char* id, unsigned int atributo, int lista){
    buffer[topeBuffer].entrada = variable;
    strcpy(buffer[topeBuffer].nombre, id);
    buffer[topeBuffer].tipoDato = atributo;
    buffer[topeBuffer].esLista = lista;
    topeBuffer ++;
}


/* Fin definicion funciones */

%}

%define parse.error verbose

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

CAB_PROGRAMA : PRINCIPAL INI_PARENTESIS FIN_PARENTESIS
             | PRINCIPAL error FIN_PARENTESIS {yyerrok;}
             | PRINCIPAL INI_PARENTESIS error {yyerrok;}
;

BLOQUE : INI_BLOQUE {insertarMarca(0);}
	OPCIONES 
	FIN_BLOQUE {vaciarEntradas();}
       | error OPCIONES FIN_BLOQUE {yyerrok;}
    //   | INI_BLOQUE OPCIONES error {yyerrok;}
;

OPCIONES : OPCIONES DECL_VAR_LOCALES 
         | OPCIONES DECL_PROCEDIMIENTO
         | OPCIONES SENTENCIAS 
         |
;

DECL_PROCEDIMIENTO : CAB_PROCEDIMIENTO BLOQUE;


CAB_PROCEDIMIENTO : ID INI_PARENTESIS PARAMETRO FIN_PARENTESIS  {insertarProcedimiento($1.lexema, n_parametros); n_parametros=0;}
                  | ID INI_PARENTESIS FIN_PARENTESIS            {insertarIdentificador($1.lexema, 0);}
                  | ID error PARAMETRO FIN_PARENTESIS           {printf(", expected: 'INI_PARENTESIS'\n"); yyerrok;}
                  | ID error FIN_PARENTESIS                     {printf(", expected: 'INI_PARENTESIS'\n"); yyerrok;}
                  | ID INI_PARENTESIS PARAMETRO error           {printf(", expected: 'FIN_PARENTESIS'\n"); yyerrok;}
                  | ID INI_PARENTESIS error                     {printf(", expected: 'FIN_PARENTESIS'\n"); yyerrok;}
;

PARAMETRO : PARAMETRO COMA TIPO_DATO ID {n_parametros++;insertarParametro($4.lexema, $3.tipo, $3.lista);}
          | TIPO_DATO ID                {n_parametros++;insertarParametro($2.lexema, $1.tipo, $1.lista);}
;

DECL_VAR_LOCALES : VAR_LOCAL
                 | CONSTANTE VAR_LOCAL
;

VAR_LOCAL : TIPO_DATO DECL_MULTIPLE ID PUNTOYCOMA           {insertarIdentificador($3.lexema, $1.tipo);tipotmp=-1;}
          | TIPO_DATO ID PUNTOYCOMA                         {insertarIdentificador($2.lexema, $1.tipo);tipotmp=-1;}
          | TIPO_DATO DECL_MULTIPLE ASIGNACION PUNTOYCOMA   {tipotmp=-1;}
          | TIPO_DATO ASIGNACION PUNTOYCOMA                 {tipotmp=-1;}
;

DECL_MULTIPLE : DECL_MULTIPLE ID COMA               {insertarIdentificador($2.lexema, tipotmp);}
              | DECL_MULTIPLE ASIGNACION COMA       {  }
              | ID COMA                             {insertarIdentificador($1.lexema, tipotmp); }
              | ASIGNACION COMA                     {  }
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
                  | ENTRADA error LISTA_VAR FIN_PARENTESIS {yyerrok;}
                  | ENTRADA INI_PARENTESIS LISTA_VAR error {yyerrok;}
                  | ENTRADA INI_PARENTESIS error error {yyerrok;}
;

SENTENCIA_SALIDA : SALIDA INI_PARENTESIS LIST_ESXP_O_CAD FIN_PARENTESIS 
                 | SALIDA error LIST_ESXP_O_CAD FIN_PARENTESIS {yyerrok;}
                 | SALIDA INI_PARENTESIS LIST_ESXP_O_CAD error {yyerrok;}
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

SENTENCIA_SI : BUCLE_SI INI_PARENTESIS EXPRESION FIN_PARENTESIS
                ENTONCES CANTIDAD_CODIGO
                SINO CANTIDAD_CODIGO                            {if($3.tipo != bool){printf("En linea %d: Expresión no booleana.\n",yylineno);exit(-1);}}
             | BUCLE_SI INI_PARENTESIS EXPRESION FIN_PARENTESIS 
                ENTONCES CANTIDAD_CODIGO                        {if($3.tipo != bool){printf("En linea %d: Expresión no booleana.\n",yylineno);exit(-1);}}
	     | BUCLE_SI INI_PARENTESIS EXPRESION FIN_PARENTESIS error CANTIDAD_CODIGO {yyerrok;}
	     | BUCLE_SI INI_PARENTESIS error FIN_PARENTESIS ENTONCES CANTIDAD_CODIGO {yyerrok;}
;

BUCLE_WHILE : BUCLE_MIENTRAS INI_PARENTESIS EXPRESION FIN_PARENTESIS CANTIDAD_CODIGO {if($3.tipo != bool){printf("En linea %d: Expresión no booleana.\n",yylineno);}} 
            | BUCLE_MIENTRAS error EXPRESION FIN_PARENTESIS CANTIDAD_CODIGO {yyerrok;}
            | BUCLE_MIENTRAS INI_PARENTESIS EXPRESION error CANTIDAD_CODIGO {yyerrok;}
;

TIPO_DATO : TIPO_BASICO     {$$.tipo = $1.tipo; $$.lista = $1.lista;}
          | TIPO_COMPLEJO   {$$.tipo = $1.tipo; $$.lista = $1.lista;}
;

TIPO_BASICO : TIPO_VAR {tipotmp=$$.tipo = $1.tipo; $$.lista = 0;}
;

TIPO_COMPLEJO : DECL_LISTAS TIPO_VAR {tipotmp= $$.tipo = $1.tipo; $$.lista = 1;}
;

ASIGNACION : ID OP_ASIGNACION EXPRESION     {
                                                if (tipotmp == -1){//buscamos el elemento
                                                    if(comprobarExistencia(&$1) == 1){
                                                        printf("Error en linea %d: Uso de variable '%s' no definida.\n",yylineno, $1.lexema);
                                                    }else{
                                                        $$.tipo = $1.tipo;
                                                    }
                                                }else{//no existe aun, estamos en la declaracion
                                                    insertarIdentificador($1.lexema, tipotmp);
                                                }
                                                if($1.tipo != $3.tipo && $1.lista != $3.lista){
                                                    printf("Error en linea %d: Asignacion de tipos invalida. %d  %d\n",yylineno,$1.tipo , $3.tipo);
                                                }
                                            }
           | ID OP_ASIGNACION ASIGNACION    {
                                                if (tipotmp == -1){//buscamos el elemento
                                                    if(comprobarExistencia(&$1) == 1){
                                                        printf("Error en linea %d: Uso de variable '%s' no definida.\n",yylineno, $1.lexema);
                                                    }else{
                                                        $$.tipo = $1.tipo;
                                                    }
                                                }else{//no existe aun, estamos en la declaracion
                                                    insertarIdentificador($1.lexema, tipotmp);
                                                }
                                                if($1.tipo != $3.tipo && $1.lista != $3.lista){
                                                    printf("Error en linea %d: Asignacion de tipos invalida. %d  %d\n",yylineno,$1.tipo , $3.tipo);
                                                }
                                            }
           | ID OP_ASIGNACION EST_AGREGADO  {
                                                if (tipotmp == -1){//buscamos el elemento
                                                    if(comprobarExistencia(&$1) == 1){
                                                        printf("Error en linea %d: Uso de variable '%s' no definida.\n",yylineno, $1.lexema);
                                                    }else{
                                                        $$.tipo = $1.tipo;
                                                    }
                                                }else{//no existe aun, estamos en la declaracion
                                                    insertarIdentificador($1.lexema, tipotmp);
                                                }
                                                if($1.tipo != $3.tipo){
                                                    printf("Error en linea %d: Asignacion de tipos invalida. %d  %d\n",yylineno,$1.tipo , $3.tipo);
                                                }
						if($1.lista != 1){
							printf("Error en linea %d: Asignacion de agregado a variable simple. %d  %d\n",yylineno,$1.tipo , $3.tipo);
						}
                                            }
           | ID error EXPRESION {yyerrok;}
           | ID error ASIGNACION {yyerrok;}
           | ID error EST_AGREGADO {yyerrok;}
;

EXPRESION : EXPRESION OP_ADD_MI_ARITMETICA EXPRESION            {
                                                                    if($1.tipo == $3.tipo && ($1.lista == 0 || $3.lista == 0)){
                                                                        $$.tipo = $1.tipo;
									if($1.lista == 1)
										$$.lista = $1.lista;
									else
										$$.lista = $3.lista;
									
                                                                    }else{
                                                                        printf("Error en linea %d: Operacion de tipos incompatibles en '-'. Tipos:%d y %d \n",yylineno, $1.tipo, $3.tipo);
                                                                    }
                                                                }
          | EXPRESION OP_ADD_MI_ARITMETICA error                {printf(", expected: 'EXPRESION'\n"); yyerrok;}
          | EXPRESION OP_ADD_PL_ARITMETICA EXPRESION            {
                                                                    if($1.tipo == $3.tipo && ($1.lista == 0 || $3.lista == 0)){
                                                                        $$.tipo = $1.tipo;
									if($1.lista == 1)
										$$.lista = $1.lista;
									else
										$$.lista = $3.lista;
									
                                                                    }else{
                                                                        printf("Error en linea %d: Operacion de tipos incompatibles en '-'. Tipos:%d y %d \n",yylineno, $1.tipo, $3.tipo);
                                                                    }
                                                                }
          | EXPRESION OP_ADD_PL_ARITMETICA error                {printf(", expected: 'EXPRESION'\n"); yyerrok;}
          | EXPRESION OP_MULT_ARITMETICA EXPRESION              {
                                                                    if($1.tipo == $3.tipo && ($1.lista == 0 || $3.lista == 0)){
                                                                        $$.tipo = $1.tipo;
									if($1.lista == 1)
										$$.lista = $1.lista;
									else
										$$.lista = $3.lista;
									
                                                                    }else{
                                                                        printf("Error en linea %d: Operacion de tipos incompatibles en '-'. Tipos:%d y %d \n",yylineno, $1.tipo, $3.tipo);
                                                                    }
                                                                }
          | EXPRESION OP_MULT_ARITMETICA error                  {printf(", expected: 'EXPRESION'\n"); yyerrok;}
          | EXPRESION OP_LIST_ARITMETICA EXPRESION              {   
                                                                    if($1.tipo == $3.tipo && $1.lista = 1 && $3.lista == 1 && $2.atributo == 0){
                                                                        $$.tipo = $1.tipo;
									$$.lista = $1.lista;
                                                                    }else{
                                                                        printf("Error en linea %d: Operacion de tipos incompatibles en operador '**' \n",yylineno);
                                                                    }

								    if($3.tipo == entero && $1.lista = 1 && $3.lista == 0 && $2.atributo == 1){
                                                                        $$.tipo = $1.tipo;
									$$.lista = 0;
                                                                    }else{
                                                                        printf("Error en linea %d: Operacion de tipos incompatibles en operador '@' \n",yylineno);
                                                                    }
                                                                }
          | EXPRESION OP_LIST_ARITMETICA error                  {printf(", expected: 'EXPRESION'\n"); yyerrok;}
          | EXPRESION OP_AND_LOGICO EXPRESION                   {
                                                                    if($1.tipo == bool && $3.tipo == bool){
                                                                        $$.tipo = bool;
                                                                    }else{
                                                                        $$.tipo=desconocido;
                                                                    }
                                                                }
          | EXPRESION OP_AND_LOGICO error                       {printf(", expected: 'EXPRESION'\n"); yyerrok;}
          | EXPRESION OP_OR_LOGICO EXPRESION                    {
                                                                    if($1.tipo == bool && $3.tipo == bool){
                                                                        $$.tipo = bool;
                                                                    }else{
                                                                        $$.tipo=desconocido;
                                                                    }
                                                                }
          | EXPRESION OP_OR_LOGICO error                        {printf(", expected: 'EXPRESION'\n"); yyerrok;}
          | EXPRESION OP_EXOR_LOGICO EXPRESION                  {
                                                                    if($1.tipo == bool && $3.tipo == bool && $1.lista == 0 && $3.lista == 0){
                                                                        $$.tipo = bool;
									$$.lista = 0;
                                                                    }else{
									$$.tipo=desconocido;
                                                                    }
                                                                }
          | EXPRESION OP_EXOR_LOGICO error                      {printf(", expected: 'EXPRESION'\n"); yyerrok;}
          | EXPRESION OP_IGUALDAD_LOGICO EXPRESION              {   
                                                                    if($1.tipo == $3.tipo && $1.lista == 0 && $3.lista == 0){
                                                                        $$.tipo = bool;
									$$.lista = 0;
                                                                    }else{
                                                                        $$.tipo=desconocido;
                                                                    }
                                                                }
          | EXPRESION OP_IGUALDAD_LOGICO error                  {printf(", expected: 'EXPRESION'\n"); yyerrok;}
          | NEGACION EXPRESION                                  {
                                                                    if($2.tipo == bool && $2.lista == 0){
                                                                        $$.tipo = bool;
                                                                    }else{
                                                                        $$.tipo=desconocido;
                                                                    }
                                                                }
          | OP_UNARIO ID                                        {
                                                                    if(comprobarExistencia(&$2) == 1){
                                                                        printf("Error en linea %d: Uso de variable '%s' no definida.\n",yylineno, $2.lexema);
                                                                    }else{
									if(((strcmp($1.lexema,(char*)('?')) == 0) || (strcmp($1.lexema,(char*)('#')) == 0)) && $2.lista == 1){
                                                                        	$$.tipo = $2.tipo;
										$$.lista = 0;
									}else{
										printf("Error en linea %d: Uso incorrecto de operador '%s'.\n",yylineno, $1.lexema);
									}
                                                                    }
                                                                }
          | ID OP_UNARIO                                        {
                                                                    if(comprobarExistencia(&$1) == 1){
                                                                        printf("Error en linea %d: Uso de variable '%s' no definida.\n",yylineno, $1.lexema);
                                                                    }else{
									if(((strcmp($1.lexema,(char*)('?')) == 0) || (strcmp($1.lexema,(char*)('#')) == 0)))
										printf("Error en linea %d: Uso incorrecto de operador '%s'.\n",yylineno, $1.lexema);
									else{
                                                                        	$$.tipo = $1.tipo;
										$$.lista = 0;
									}
                                                                    }
                                                                }
          | OP_ADD_MI_ARITMETICA ID                             {
                                                                    if(comprobarExistencia(&$2) == 1){
                                                                        printf("Error en linea %d: Uso de variable '%s' no definida.\n",yylineno, $2.lexema);
                                                                    }else{
                                                                        $$.tipo = $2.tipo;
									$$.lista = $2.lista;
                                                                    }
                                                                }

          | OP_ADD_MI_ARITMETICA NUMERO {$$.tipo = $2.tipo;}    
          | ID OP_DECREMENTO EXPRESION                          {
                                                                    if(comprobarExistencia(&$1) == 1){
                                                                        printf("Error en linea %d: Uso de variable '%s' no definida.\n",yylineno, $1.lexema);
                                                                    }else{
									if($1.lista == 1 && $3.tipo == entero && $3.lista == 0){
                                                                        	$$.tipo = $1.tipo;
										$$.lista = $1.lista;
									}else
										printf("Error en linea %d: Operacion de tipos incompatibles en '--'. Requiere lista y entero. \n",yylineno);
                                                                    }
                                                                }

          | ID OP_INCREMENTO EXPRESION OP_LIST_ARITMETICA EXPRESION    {
                                                                    if(comprobarExistencia(&$1) == 1){
                                                                        printf("Error en linea %d: Uso de variable '%s' no definida.\n",yylineno, $1.lexema);
                                                                    }else{
									if($1.lista == 1 && $3.tipo == $1.tipo && $3.lista == 0 && $4.tipo == 1 && $5.tipo == entero && $5.lista == 0){
                                                                        	$$.tipo = $1.tipo;
										$$.lista = $1.lista;
									}else
										printf("Error en linea %d: incorrecto de operador ternario.\n",yylineno);
                                                                    }
                                                                }

          | INI_PARENTESIS EXPRESION FIN_PARENTESIS             {$$.tipo = $2.tipo; $$.lista = $2.lista;}
          | INI_PARENTESIS EXPRESION error {yyerrok;}
          | NUMERO {$$.tipo = $1.tipo;}
          | LOGICO {$$.tipo = $1.tipo;}
          | ID                                                  {
                                                                    if(comprobarExistencia(&$1) == 1){
                                                                        printf("Error en linea %d: Uso de variable '%s' no definida.\n",yylineno, $1.lexema);
                                                                    }else{
                                                                        $$.tipo = $1.tipo;
									$$.lista = $1.lista;
                                                                    }
                                                                }
;

PROCEDIMIENTO : ID INI_PARENTESIS ARGUMENTOS FIN_PARENTESIS     {
                                                                    if(comprobarExistencia(&$1) == 1){
                                                                        printf("Error en linea %d: Procedimiento '%s' no definido.\n",yylineno, $1.lexema);
                                                                    }else{
                                                                        ComprobarNArgs($1.lexema, n_argumentos);
                                                                    }
                                                                }
              | ID INI_PARENTESIS FIN_PARENTESIS                {
                                                                    if(comprobarExistencia(&$1) == 1){
                                                                        printf("Error en linea %d: Procedimiento '%s' no definido.\n",yylineno, $1.lexema);
                                                                    }else{
                                                                        ComprobarNArgs($1.lexema, 0);
                                                                    }
                                                                }
              | ID INI_PARENTESIS ARGUMENTOS error {yyerrok;}
              | ID INI_PARENTESIS error {yyerrok;}
;

ARGUMENTOS : ARGUMENTOS COMA ID     {n_argumentos++;}
          | ID                      {n_argumentos=1;}
;

EST_AGREGADO : INI_AGREGADO AGREGADOS FIN_AGREGADO {$$.tipo = $2.tipo;}
             | error AGREGADOS FIN_PARENTESIS {yyerrok;}
             | INI_AGREGADO FIN_AGREGADO
             | error FIN_AGREGADO {yyerrok;}
;

AGREGADOS : EXPRESION COMA AGREGADOS {if($1.tipo != $3.tipo){printf("Error en linea %d: Mezcla de tipos en agregado.\n",yylineno);}else{$$.tipo = $1.tipo;}}
          | EXPRESION {if($1.lista == 1){printf("Error en linea %d: No se pueden emplear listas en los agregados.\n",yylineno);}else{$$.tipo = $1.tipo;}}
;

OP_UNARIO : OP_INCREMENTO | OP_LIST_UNARIO | OP_DECREMENTO {strcpy($$.lexema, $1.lexema);}
;

NUMERO : REAL {$$.tipo = real;}
       | ENTERO{$$.tipo = entero;}
;

LOGICO : TRUE {$$.tipo = bool;}
       | FALSE {$$.tipo = bool;}
;
/* Fin reglas gramaticales */

%%

#include "lex.yy.c"

int main (int argc, char** argv) {

    yyparse();

}

void yyerror(const char* s){
    printf("\033[1;31m%s en linea %d.\n\033[0m", s, yylineno);
}