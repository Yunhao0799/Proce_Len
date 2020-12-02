%{

#include <stdlib.h>
#include <string.h>
#include "y.tab.h"

int num_lineas = 1;

%}

%option noyywrap

/* --- Inicio declaraciones Flex --- */

LETRA[a-zA-Z]
DIGITO[0-9]
ENTERO {DIGITO}+
REAL {ENTERO}.{ENTERO}
IDENTIFICADOR {LETRA}({DIGITO}|{LETRA})*
COMENTARIO_UNA_LINEA ("//".*"\n")

/* --- Fin declaraciones Flex ---*/


%%
{COMENTARIO_UNA_LINEA}      num_lineas++;
\n                          num_lineas++;
\r							;
"sube hasta"   				return MODO_FOR;
"baja hasta"   				return MODO_FOR;
"bool"					return TIPO_VAR;
"caracter"				return TIPO_VAR;
"real"					return TIPO_VAR;
"entero"				return TIPO_VAR;
"&&"					return OP_LOGICO;
"||"					return OP_LOGICO;
"y"					return OP_LOGICO;
"o"					return OP_LOGICO;
"xor"					return OP_LOGICO;
"=="					return OP_LOGICO;
"!="					return OP_LOGICO;
"no"					return NEGACION;
"!"					return NEGACION;
"--"					return OP_UNI_BIN;
"-"					return OP_UNI_BIN;
"++"					return OP_UNARIO;
"+"					return OP_ARITMETICA;
"**"					return OP_ARITMETICA;
"*"					return OP_ARITMETICA;
"/"					return OP_ARITMETICA;
"%"					return OP_ARITMETICA;
"@"					return OP_ARITMETICA;
"#"					return OP_UNARIO;
"?"					return OP_UNARIO;
"<<"					return SENTENCIA_LIST;
">>"					return SENTENCIA_LIST;
"$"					return SENTENCIA_LIST;
"lista de"                  		return DECL_LISTAS;
[ \t]                       		;
"("                         		return INI_PARENTESIS;
")"                         		return FIN_PARENTESIS;
"{"                         		return INI_BLOQUE;
"}"                         		return FIN_BLOQUE;
"["                         		return INI_AGREGADO;
"]"                         		return FIN_AGREGADO;
";"                         		return PUNTOYCOMA;
","                         		return COMA;
":"                         		return DOSPUNTOS;
"sino"                      		return SINO;
"si"                        		return BUCLE_SI;
"entonces"                  		return ENTONCES;
"para"                      		return BUCLE_PARA;
"mientras"                  		return BUCLE_MIENTRAS;
"haz"					return FINPARA;
"constante"				return CONSTANTE;
"'"					return COMILLAS;
"principal"				return PRINCIPAL;
"leer"					return ENTRADA;
"escribir"				return SALIDA;

"="|":="                    		return OP_ASIGNACION;
{REAL}					return NUMERO;
{ENTERO}           			return NUMERO;
{IDENTIFICADOR}             		return ID;


.                           		printf("\033[1;31mError:  \033[0m Simbolo erroneo: '%s' en linea: %d\n", yytext, num_lineas);

%%
