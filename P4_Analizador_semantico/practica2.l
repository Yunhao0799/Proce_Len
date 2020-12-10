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
{COMENTARIO_UNA_LINEA}      		num_lineas++;
\n                          		num_lineas++;
\r					;
"sube hasta"   				{yyval.atributo = 0; return MODO_FOR;}
"baja hasta"   				{yyval.atributo = 1; return MODO_FOR;}

"bool"					{yyval.atributo = 0; return TIPO_VAR;}
"caracter"				{yyval.atributo = 1; return TIPO_VAR;}
"real"					{yyval.atributo = 2; return TIPO_VAR;}
"entero"				{yyval.atributo = 3; return TIPO_VAR;}

"&&"					{yyval.atributo = 0; return OP_AND_LOGICO;}
"y"					{yyval.atributo = 1; return OP_AND_LOGICO;}

"||"					{yyval.atributo = 0; return OP_OR_LOGICO;}
"o"					{yyval.atributo = 1; return OP_OR_LOGICO;}

"xor"					return OP_EXOR_LOGICO;

"=="					{yyval.atributo = 0; return OP_IGUALDAD_LOGICO;}
"!="				    	{yyval.atributo = 1; return OP_IGUALDAD_LOGICO;}

"no"				    	{yyval.atributo = 0; return NEGACION;}
"!"			    	    	{yyval.atributo = 1; return NEGACION;}

"--"			    		return OP_DECREMENTO;
"-"				        return OP_ADD_MI_ARITMETICA;
"++"					return OP_INCREMENTO;
"+"			    	    	return OP_ADD_PL_ARITMETICA;
"**"			    		{yyval.atributo = 0; return OP_LIST_ARITMETICA;}
"*"			        	{yyval.atributo = 0; return OP_MULT_ARITMETICA;}

"/"				        {yyval.atributo = 1; return OP_MULT_ARITMETICA;}
"%"		        		{yyval.atributo = 2; return OP_MULT_ARITMETICA;}
"@"				        {yyval.atributo = 1; return OP_LIST_ARITMETICA;}
"#"	        			{yyval.atributo = 0; return OP_LIST_UNARIO;}
"?"			        	{yyval.atributo = 1; return OP_LIST_UNARIO;}

"<<"				       	{yyval.atributo = 0; return SENTENCIA_LIST;}
">>"		    			{yyval.atributo = 1; return SENTENCIA_LIST;}
"$"				        {yyval.atributo = 2; return SENTENCIA_LIST;}
"lista de"             			return DECL_LISTAS;
[ \t]                  			;
"("                    			return INI_PARENTESIS;
")"                   			return FIN_PARENTESIS;
"{"                    			return INI_BLOQUE;
"}"                    			return FIN_BLOQUE;
"["                    			return INI_AGREGADO;
"]"                    			return FIN_AGREGADO;
";"                    			return PUNTOYCOMA;
","                    			return COMA;
":"                    			return DOSPUNTOS;
"sino"                     		return SINO;
"si"                  			return BUCLE_SI;
"entonces"            			return ENTONCES;
"para"                 			return BUCLE_PARA;
"mientras"             			return BUCLE_MIENTRAS;
"haz"					return FINPARA;
"constante"	    			return CONSTANTE;
"'"				        return COMILLAS;
"principal"				return PRINCIPAL;
"leer"  				return ENTRADA;
"escribir"  				return SALIDA;

"="|":="              			return OP_ASIGNACION;
{ENTERO}           			{yyval.atributo = 0; return NUMERO;}
{REAL}      				{yyval.atributo = 1; return NUMERO;}
{IDENTIFICADOR}        			return ID;


.                           		printf("\033[1;31mError:  \033[0m Simbolo erroneo: '%s' en linea: %d\n", yytext, num_lineas);

%%
