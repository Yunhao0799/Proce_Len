%{
#include <stdlib.h>
#include <string.h>
#include "tokens.h"

int num_lineas = 1;
%}

/* --- Inicio declaraciones Flex --- */
%x ml_comment

LETRA[a-zA-Z]
DIGITO[0-9]
ENTERO {DIGITO}+
REAL {ENTERO}.{ENTERO}
IDENTIFICADOR {LETRA}({DIGITO}|{LETRA})*
OPE_ARITMETICA ("+"|"-"|"*"|"/"|"%"|"@"|"--")
OPE_LOGICO ("&&"|"||"|"y"|"o"|"xor")
OPE_UNARIO ("++"|"--"|"#"|"?"|"**"|"<<"|">>"|"$")
COMENTARIO_UNA_LINEA "//".*"\n"
TIPO_VARIABLE ("bool"|"caracter"|"real"|"entero")
OPE_UNI_BIN ("no"|"!"|"-")

/* --- Fin declaraciones Flex ---*/


%%
{COMENTARIO_UNA_LINEA}      num_lineas++;
\n                          num_lineas++;
[ \t]                       ;
"("                         return INI_PARENTESIS;
")"                         return FIN_PARENTESIS;
"{"                         return INI_BLOQUE;
"}"                         return FIN_BLOQEU;
"["                         return INI_AGREGADO;
"]"                         return FIN_AGREGAD;
";"                         return PUNTOYCOMA;
"="                         return OP_ASIGNACION;
"sino"                      return BUCLE_SI;
"para"                      return BUCLE_PARA;
"mientras"                  return BUCLE_MIENTRAS;
"entonces"                  return ENCONCES;
"lista de"                  return DECL_LISTAS;


{OPE_ARITMETICA}            return OP_ARITMETICA;
{OPE_LOGICO}                return OP_LOGICO;
{OPE_UNARIO}                return OP_UNARIO;
{TIPO_VARIABLE}             return TIPO_VAR;
({ENTERO}|{REAL})           return NUMERO;
{IDENTIFICADOR}             return ID;


.                           printf("Simbolo erroneo: '%s' en linea: %d\n", yytext, numlinea);

%%