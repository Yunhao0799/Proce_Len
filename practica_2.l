%{

#include <stdlib.h>
#include <string.h>
#include "tokens.h"

int num_lineas = 1;

%}

/* --- Inicio declaraciones Flex --- */

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
LLEGADAFOR ("sube hasta" | "baja hasta")

/* --- Fin declaraciones Flex ---*/


%%
{COMENTARIO_UNA_LINEA}      num_lineas++;
\n                          num_lineas++;
[ \t]                       ;
"("                         printf("lexema = '%s', token = 'INI_PARENTESIS'\n", yytext);    return INI_PARENTESIS;
")"                         printf("lexema = '%s', token = 'FIN_PARENTESIS'\n", yytext);    return FIN_PARENTESIS;
"{"                         printf("lexema = '%s', token = 'INI_BLOQUE'\n", yytext);        return INI_BLOQUE;
"}"                         printf("lexema = '%s', token = 'FIN_BLOQUE'\n", yytext);        return FIN_BLOQUE;
"["                         printf("lexema = '%s', token = 'INI_AGREGADO'\n", yytext);      return INI_AGREGADO;
"]"                         printf("lexema = '%s', token = 'FIN_AGREGADO'\n", yytext);      return FIN_AGREGADO;
";"                         printf("lexema = '%s', token = 'PUNTOYCOMA'\n", yytext);        return PUNTOYCOMA;
"="                         printf("lexema = '%s', token = 'OP_ASIGNACION'\n", yytext);     return OP_ASIGNACION;
"sino"                      printf("lexema = '%s', token = 'BUCLE_SI'\n", yytext);          return BUCLE_SI;
"para"                      printf("lexema = '%s', token = 'BUCLE_PARA'\n", yytext);        return BUCLE_PARA;
"mientras"                  printf("lexema = '%s', token = 'BUCLE_MIENTRAS'\n", yytext);    return BUCLE_MIENTRAS;
"entonces"                  printf("lexema = '%s', token = 'ENTONCES'\n", yytext);          return ENTONCES;
"lista de"                  printf("lexema = '%s', token = 'DECL_LISTAS'\n", yytext);       return DECL_LISTAS;
":"							printf("lexema = '%s', token = 'DOSPUNTOS'\n", yytext);         return DOSPUNTOS;
","							printf("lexema = '%s', token = 'COMA'\n", yytext); 		        return COMA;
"haz"						printf("lexema = '%s', token = 'FINFOR'\n", yytext);  	        return FINFOR;
"constante"					printf("lexema = '%s', token = 'CONSTANTE'\n", yytext);         return CONSTANTE;
"""							printf("lexema = '%s', token = 'INICOMILLAS'\n", yytext);       return INICOMILLAS;
"""							printf("lexema = '%s', token = 'FINCOMILLAS'\n", yytext);       return FINCOMILLAS;

{OPE_ARITMETICA}            printf("lexema = '%s', token = 'OP_ARITMETICA'\n", yytext);     return OP_ARITMETICA;
{OPE_LOGICO}                printf("lexema = '%s', token = 'OP_LOGICO'\n", yytext);         return OP_LOGICO;
{OPE_UNARIO}                printf("lexema = '%s', token = 'OP_UNARIO'\n", yytext);         return OP_UNARIO;
{TIPO_VARIABLE}             printf("lexema = '%s', token = 'TIPO_VAR'\n", yytext);          return TIPO_VAR;
({ENTERO}|{REAL})           printf("lexema = '%s', token = 'NUMERO'\n", yytext);            return NUMERO;
{IDENTIFICADOR}             printf("lexema = '%s', token = 'ID'\n", yytext);                return ID;
{LLEGADAFOR}				printf("lexema = '%s', token = 'LLEGADAFOR'\n", yytext);        return LLEGADAFOR;


.                           printf("\033[1;31mError:  \033[0m Simbolo erroneo: '%s' en linea: %d\n", yytext, num_lineas);

%%

int main (int argc, char** argv) {

    // Esta parte se encarga de leer el fichero de entrada, token por token 

	if (argc <= 1) {
        printf("\nError: falta archivo a leer\n");
		exit(-1);
	}

    yyin = fopen(argv[1], "r");

    if (yyin == NULL) {

        printf ("\nError abriendo el archivo %s\n", argv[1]);

        exit (-1);

    }

	int siguiente_token = yylex();

	while (siguiente_token != 0) {
		siguiente_token = yylex();
	}

	exit(1);

}