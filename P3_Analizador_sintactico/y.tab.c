/* original parser id follows */
/* yysccsid[] = "@(#)yaccpar	1.9 (Berkeley) 02/21/93" */
/* (use YYMAJOR/YYMINOR for ifdefs dependent on parser version) */

#define YYBYACC 1
#define YYMAJOR 1
#define YYMINOR 9
#define YYPATCH 20140715

#define YYEMPTY        (-1)
#define yyclearin      (yychar = YYEMPTY)
#define yyerrok        (yyerrflag = 0)
#define YYRECOVERING() (yyerrflag != 0)
#define YYENOMEM       (-2)
#define YYEOF          0
#define YYPREFIX "yy"

#define YYPURE 0

#line 1 "practica3.y"


	#include <stdlib.h>
	#include <string.h>

#line 27 "y.tab.c"

#if ! defined(YYSTYPE) && ! defined(YYSTYPE_IS_DECLARED)
/* Default: YYSTYPE is the semantic value type. */
typedef int YYSTYPE;
# define YYSTYPE_IS_DECLARED 1
#endif

/* compatibility with bison */
#ifdef YYPARSE_PARAM
/* compatibility with FreeBSD */
# ifdef YYPARSE_PARAM_TYPE
#  define YYPARSE_DECL() yyparse(YYPARSE_PARAM_TYPE YYPARSE_PARAM)
# else
#  define YYPARSE_DECL() yyparse(void *YYPARSE_PARAM)
# endif
#else
# define YYPARSE_DECL() yyparse(void)
#endif

/* Parameters sent to lex. */
#ifdef YYLEX_PARAM
# define YYLEX_DECL() yylex(void *YYLEX_PARAM)
# define YYLEX yylex(YYLEX_PARAM)
#else
# define YYLEX_DECL() yylex(void)
# define YYLEX yylex()
#endif

/* Parameters sent to yyerror. */
#ifndef YYERROR_DECL
#define YYERROR_DECL() yyerror(const char *s)
#endif
#ifndef YYERROR_CALL
#define YYERROR_CALL(msg) yyerror(msg)
#endif

extern int YYPARSE_DECL();

#define ID 257
#define NUMERO 258
#define INI_BLOQUE 259
#define FIN_BLOQUE 260
#define INI_AGREGADO 261
#define FIN_AGREGADO 262
#define PUNTOYCOMA 263
#define OP_ASIGNACION 264
#define BUCLE_SI 265
#define OP_ARITMETICA 266
#define BUCLE_MIENTRAS 267
#define OP_LOGICO 268
#define OP_UNARIO 269
#define BUCLE_PARA 270
#define INI_PARENTESIS 271
#define FIN_PARENTESIS 272
#define SINO 273
#define ENTONCES 274
#define DECL_LISTAS 275
#define OP_UNI_BIN 276
#define TIPO_VAR 277
#define COMA 278
#define DOSPUNTOS 279
#define MODO_FOR 280
#define CONSTANTE 281
#define COMILLAS 282
#define FINPARA 283
#define PRINCIPAL 284
#define ENTRADA 285
#define SALIDA 286
#define NEGACION 287
#define SENTENCIA_LIST 288
#define YYERRCODE 256
typedef short YYINT;
static const YYINT yylhs[] = {                           -1,
    0,    1,    2,    3,    3,    3,    3,    3,    3,    5,
    5,    5,    7,    8,    9,    9,    9,    9,    9,    4,
    4,    4,   11,   11,   11,   11,   12,   12,   12,   12,
    6,    6,    6,    6,    6,    6,   19,   19,   19,   19,
   19,   19,   19,   17,   18,   20,   20,   21,   21,   21,
   21,   23,   23,   14,   24,   24,   24,   24,   24,   16,
   16,   16,   16,   15,   10,   10,   25,   26,   27,   28,
   28,   28,   13,   13,   13,   13,   22,   22,   22,   22,
   22,   22,   22,   22,   22,   22,   29,   30,   30,   30,
};
static const YYINT yylen[] = {                            2,
    2,    3,    3,    2,    2,    2,    1,    1,    1,    2,
    1,    0,    2,    4,    4,    2,    3,    1,    0,    2,
    1,    0,    4,    3,    4,    3,    3,    3,    2,    2,
    1,    1,    1,    2,    2,    2,    1,    1,    1,    2,
    2,    2,    0,    4,    4,    3,    1,    3,    5,    1,
    3,    2,    1,    8,    3,    3,    2,    1,    1,    8,
    6,    6,    8,    5,    1,    1,    1,    2,    4,    1,
    1,    1,    3,    3,    3,    3,    3,    3,    2,    2,
    2,    2,    5,    3,    1,    1,    3,    3,    1,    0,
};
static const YYINT yydefred[] = {                         0,
    0,    0,    0,    0,    0,    1,    2,    0,    0,    0,
    0,    0,   67,    0,    0,    0,    0,    0,    9,   11,
    0,    0,   21,    0,   31,   32,   33,    0,    0,   65,
   66,    0,    0,    0,    0,    0,   68,    0,    0,    3,
    0,    0,    6,   20,    0,   10,   13,    0,    0,    0,
   34,   35,   36,    0,   85,    0,    0,    0,   75,   76,
    0,   18,    0,    0,    0,   59,   58,    0,    0,    0,
    0,    0,   47,    0,   86,    0,    0,    0,   24,   29,
    0,    0,   26,   30,    0,    0,    0,   70,   71,    0,
    0,    0,   14,    0,   16,    0,    0,    0,    0,    0,
    0,    0,   44,    0,   53,    0,   45,    0,   23,   27,
   25,   28,   84,    0,    0,    0,   17,    0,    0,   56,
    0,    0,   64,    0,   46,   52,   51,    0,    0,    0,
   15,    0,    0,    0,    0,    0,    0,    0,    0,   49,
   63,   60,   54,
};
static const YYINT yydgoto[] = {                          2,
    3,    6,   16,   17,   18,   19,   20,   21,   63,   22,
   23,   49,   24,   25,   26,   27,   28,   29,    0,   74,
   77,   61,  106,   70,   30,   31,    0,   92,    0,    0,
};
static const YYINT yysindex[] = {                      -272,
 -258,    0, -208, -244, -180,    0,    0, -226, -215, -198,
 -175, -194,    0, -167, -159, -243, -162, -131,    0,    0,
 -208, -126,    0, -125,    0,    0,    0, -122, -120,    0,
    0,  -79, -231, -250, -248, -101,    0, -103,  -99,    0,
 -162, -131,    0,    0, -107,    0,    0, -170,  -91, -230,
    0,    0,    0, -226,    0,  -73,  -73,  -73,    0,    0,
 -207,    0, -176,  -44,  -72,    0,    0, -248, -248, -257,
  -40,  -27,    0, -169,    0,  -39, -143, -207,    0,    0,
 -117, -156,    0,    0, -207,  -42, -207,    0,    0,  -73,
  -73,  -73,    0, -189,    0,  -54,  -35,  -32, -248,  -36,
 -208,  -41,    0,  -17,    0, -253,    0,  -89,    0,    0,
    0,    0,    0,  -95, -207, -207,    0,  -16, -208,    0,
  -32, -208,    0,  -15,    0,    0,    0,  -39, -207,  -73,
    0,  -31,  -29,  -37, -252, -207, -208, -208, -208,    0,
    0,    0,    0,
};
static const YYINT yyrindex[] = {                         0,
    0,    0,    0,    0,  -13,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0, -146, -133,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0, -116,    0,    0,    0,    0,    0,    0,    0,
 -137, -110,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,  -64,    0,    0,    0,    0,    0,    0,
 -153,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,  -84,    0,    0,
    0,    0,    0,    0, -200,    0, -127,    0,    0,  -77,
  -57,    0,    0,    0,    0,    0,    0,  -24,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,  -56,  -55,    0,    0,    0,    0,
  -23,    0,    0,    0,    0,    0,    0,    0,  -43,    0,
    0, -210, -186,    0,    0,  -53,    0,    0,    0,    0,
    0,    0,    0,
};
static const YYINT yygindex[] = {                         0,
    0,  -21,    0,  229,  234,  235,   -2,  220,    0,  -30,
    8,    0,    9,    0,    0,    0,    0,    0,    0,    0,
    0,  -38,  125,  -33,  242,    0,    0,    0,    0,    0,
};
#define YYTABLESIZE 254
static const YYINT yytable[] = {                         47,
   78,   71,   64,  126,  126,   65,   66,   67,   66,   67,
   99,    1,    4,    8,  100,   46,   40,   85,   86,   87,
   68,    9,   68,   10,   44,   62,   11,    7,  127,  140,
   50,   12,   83,   13,   97,   98,   69,   32,   69,   46,
   60,   14,   15,   12,   33,   13,   62,   84,   44,   62,
    5,  114,  115,  116,   62,   34,   62,   82,   88,   62,
   89,   90,   79,  118,   62,  121,   62,  117,   91,  129,
   61,   79,   35,   61,   62,   62,    8,   79,   61,  123,
   61,   36,   13,   61,    9,   12,   10,   13,   61,   11,
   61,  136,   79,   32,   12,   93,   13,  132,   61,   61,
  133,   94,  103,   38,   14,   15,  111,   80,  104,   73,
    7,   39,   12,    7,   13,  141,  142,  143,    7,    4,
    7,  112,    4,    7,   73,   45,    8,    4,  107,    4,
   48,    8,    4,    8,  108,   81,    8,   51,    7,    7,
   52,    8,   53,    8,   81,  109,   32,    4,    4,    5,
   81,    8,    8,   73,    5,   19,    5,   75,   55,    5,
  110,   19,   72,   33,    5,   81,    5,   75,   55,   56,
  130,   57,   89,   90,    5,    5,   58,   54,   55,   56,
   91,   57,   76,   75,   55,   80,   58,   50,   80,   56,
   80,   57,  128,   50,   80,   56,   58,   57,   74,   96,
   80,   86,   58,   86,   86,   82,   78,   77,   82,   83,
   82,   86,   95,   74,   82,   78,   77,  105,   83,  119,
   82,   78,   77,   88,   83,   89,   90,   99,   48,  113,
  102,  101,   99,   91,   48,   99,  120,  122,  124,  125,
  131,  137,  134,  138,   41,  139,   12,   57,   55,   42,
   43,   59,  135,   37,
};
static const YYINT yycheck[] = {                         21,
   39,   35,   33,  257,  257,  256,  257,  258,  257,  258,
  268,  284,  271,  257,  272,   18,  260,   56,   57,   58,
  271,  265,  271,  267,   17,  257,  270,  272,  282,  282,
   22,  275,  263,  277,   68,   69,  287,  264,  287,   42,
   32,  285,  286,  275,  271,  277,  257,  278,   41,  260,
  259,   90,   91,   92,  265,  271,  267,   49,  266,  270,
  268,  269,  263,   94,  275,   99,  277,  257,  276,  108,
  257,  272,  271,  260,  285,  286,  257,  278,  265,  101,
  267,  257,  277,  270,  265,  275,  267,  277,  275,  270,
  277,  130,  263,  264,  275,  272,  277,  119,  285,  286,
  122,  278,  272,  271,  285,  286,  263,  278,  278,  263,
  257,  271,  275,  260,  277,  137,  138,  139,  265,  257,
  267,  278,  260,  270,  278,  257,  260,  265,  272,  267,
  257,  265,  270,  267,  278,  263,  270,  263,  285,  286,
  263,  275,  263,  277,  272,  263,  264,  285,  286,  260,
  278,  285,  286,  257,  265,  272,  267,  257,  258,  270,
  278,  278,  264,  271,  275,  257,  277,  257,  258,  269,
  266,  271,  268,  269,  285,  286,  276,  257,  258,  269,
  276,  271,  282,  257,  258,  263,  276,  272,  266,  269,
  268,  271,  282,  278,  272,  269,  276,  271,  263,  272,
  278,  266,  276,  268,  269,  263,  263,  263,  266,  263,
  268,  276,  257,  278,  272,  272,  272,  257,  272,  274,
  278,  278,  278,  266,  278,  268,  269,  268,  272,  272,
  258,  272,  268,  276,  278,  268,  272,  274,  280,  257,
  257,  273,  258,  273,   16,  283,  260,  272,  272,   16,
   16,   32,  128,   12,
};
#define YYFINAL 2
#ifndef YYDEBUG
#define YYDEBUG 0
#endif
#define YYMAXTOKEN 288
#define YYUNDFTOKEN 321
#define YYTRANSLATE(a) ((a) > YYMAXTOKEN ? YYUNDFTOKEN : (a))
#if YYDEBUG
static const char *const yyname[] = {

"end-of-file",0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,"ID","NUMERO","INI_BLOQUE",
"FIN_BLOQUE","INI_AGREGADO","FIN_AGREGADO","PUNTOYCOMA","OP_ASIGNACION",
"BUCLE_SI","OP_ARITMETICA","BUCLE_MIENTRAS","OP_LOGICO","OP_UNARIO",
"BUCLE_PARA","INI_PARENTESIS","FIN_PARENTESIS","SINO","ENTONCES","DECL_LISTAS",
"OP_UNI_BIN","TIPO_VAR","COMA","DOSPUNTOS","MODO_FOR","CONSTANTE","COMILLAS",
"FINPARA","PRINCIPAL","ENTRADA","SALIDA","NEGACION","SENTENCIA_LIST",0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,"illegal-symbol",
};
static const char *const yyrule[] = {
"$accept : S",
"S : CAB_PROGRAMA BLOQUE",
"CAB_PROGRAMA : PRINCIPAL INI_PARENTESIS FIN_PARENTESIS",
"BLOQUE : INI_BLOQUE OPCIONES FIN_BLOQUE",
"OPCIONES : OPCIONES DECL_VAR_LOCALES",
"OPCIONES : OPCIONES DECL_PROCEDIMIENTOS",
"OPCIONES : OPCIONES SENTENCIAS",
"OPCIONES : DECL_VAR_LOCALES",
"OPCIONES : DECL_PROCEDIMIENTOS",
"OPCIONES : SENTENCIAS",
"DECL_PROCEDIMIENTOS : DECL_PROCEDIMIENTOS DECL_PROCEDIMIENTO",
"DECL_PROCEDIMIENTOS : DECL_PROCEDIMIENTO",
"DECL_PROCEDIMIENTOS :",
"DECL_PROCEDIMIENTO : CAB_PROCEDIMIENTO BLOQUE",
"CAB_PROCEDIMIENTO : ID INI_PARENTESIS PARAMETRO FIN_PARENTESIS",
"PARAMETRO : PARAMETRO COMA TIPO_DATO ID",
"PARAMETRO : TIPO_DATO ID",
"PARAMETRO : PARAMETRO COMA ID",
"PARAMETRO : ID",
"PARAMETRO :",
"DECL_VAR_LOCALES : DECL_VAR_LOCALES VAR_LOCAL",
"DECL_VAR_LOCALES : VAR_LOCAL",
"DECL_VAR_LOCALES :",
"VAR_LOCAL : TIPO_DATO DECL_MULTIPLE ID PUNTOYCOMA",
"VAR_LOCAL : TIPO_DATO ID PUNTOYCOMA",
"VAR_LOCAL : TIPO_DATO DECL_MULTIPLE ASIGNACION PUNTOYCOMA",
"VAR_LOCAL : TIPO_DATO ASIGNACION PUNTOYCOMA",
"DECL_MULTIPLE : DECL_MULTIPLE ID COMA",
"DECL_MULTIPLE : DECL_MULTIPLE ASIGNACION COMA",
"DECL_MULTIPLE : ID COMA",
"DECL_MULTIPLE : ASIGNACION COMA",
"SENTENCIAS : BUCLE_FOR",
"SENTENCIAS : BUCLE_WHILE",
"SENTENCIAS : SENTENCIA_SI",
"SENTENCIAS : ASIGNACION PUNTOYCOMA",
"SENTENCIAS : SENTENCIA_ENTRADA PUNTOYCOMA",
"SENTENCIAS : SENTENCIA_SALIDA PUNTOYCOMA",
"SENTENCIA_UNICA : BUCLE_FOR",
"SENTENCIA_UNICA : BUCLE_WHILE",
"SENTENCIA_UNICA : SENTENCIA_SI",
"SENTENCIA_UNICA : ASIGNACION PUNTOYCOMA",
"SENTENCIA_UNICA : SENTENCIA_ENTRADA PUNTOYCOMA",
"SENTENCIA_UNICA : SENTENCIA_SALIDA PUNTOYCOMA",
"SENTENCIA_UNICA :",
"SENTENCIA_ENTRADA : ENTRADA INI_PARENTESIS LISTA_VAR FIN_PARENTESIS",
"SENTENCIA_SALIDA : SALIDA INI_PARENTESIS LIST_ESXP_O_CAD FIN_PARENTESIS",
"LISTA_VAR : LISTA_VAR COMA ID",
"LISTA_VAR : ID",
"LIST_ESXP_O_CAD : LIST_ESXP_O_CAD COMA EXPRESION",
"LIST_ESXP_O_CAD : LIST_ESXP_O_CAD COMA COMILLAS CADENA COMILLAS",
"LIST_ESXP_O_CAD : EXPRESION",
"LIST_ESXP_O_CAD : COMILLAS CADENA COMILLAS",
"CADENA : CADENA ID",
"CADENA : ID",
"BUCLE_FOR : BUCLE_PARA ID OP_ASIGNACION NUMERO MODO_FOR NUMERO FINPARA BLOQUE",
"CONDICION : CONDICION OP_LOGICO CONDICION",
"CONDICION : INI_PARENTESIS CONDICION FIN_PARENTESIS",
"CONDICION : NEGACION CONDICION",
"CONDICION : NUMERO",
"CONDICION : ID",
"SENTENCIA_SI : BUCLE_SI INI_PARENTESIS CONDICION FIN_PARENTESIS ENTONCES BLOQUE SINO BLOQUE",
"SENTENCIA_SI : BUCLE_SI INI_PARENTESIS CONDICION FIN_PARENTESIS ENTONCES BLOQUE",
"SENTENCIA_SI : BUCLE_SI INI_PARENTESIS error FIN_PARENTESIS ENTONCES BLOQUE",
"SENTENCIA_SI : BUCLE_SI INI_PARENTESIS error FIN_PARENTESIS ENTONCES BLOQUE SINO BLOQUE",
"BUCLE_WHILE : BUCLE_MIENTRAS INI_PARENTESIS CONDICION FIN_PARENTESIS BLOQUE",
"TIPO_DATO : TIPO_BASICO",
"TIPO_DATO : TIPO_COMPLEJO",
"TIPO_BASICO : TIPO_VAR",
"TIPO_COMPLEJO : DECL_LISTAS TIPO_BASICO",
"CONST : CONSTANTE TIPO_DATO ID PUNTOYCOMA",
"OP_BINARIO : OP_ARITMETICA",
"OP_BINARIO : OP_LOGICO",
"OP_BINARIO : OP_BINARIO",
"ASIGNACION : ID OP_ASIGNACION EXPRESION",
"ASIGNACION : ID OP_ASIGNACION ID",
"ASIGNACION : ID OP_ASIGNACION CAB_PROCEDIMIENTO",
"ASIGNACION : ID OP_ASIGNACION ASIGNACION",
"EXPRESION : EXPRESION OP_BINARIO EXPRESION",
"EXPRESION : EXPRESION OP_UNI_BIN EXPRESION",
"EXPRESION : OP_UNARIO EXPRESION",
"EXPRESION : EXPRESION OP_UNARIO",
"EXPRESION : OP_UNI_BIN EXPRESION",
"EXPRESION : EXPRESION OP_UNI_BIN",
"EXPRESION : EXPRESION OP_UNARIO EXPRESION OP_ARITMETICA EXPRESION",
"EXPRESION : INI_PARENTESIS EXPRESION FIN_PARENTESIS",
"EXPRESION : NUMERO",
"EXPRESION : ID",
"EST_AGREGADO : INI_AGREGADO AGREGADOS FIN_AGREGADO",
"AGREGADOS : EXPRESION COMA AGREGADOS",
"AGREGADOS : EXPRESION",
"AGREGADOS :",

};
#endif

int      yydebug;
int      yynerrs;

int      yyerrflag;
int      yychar;
YYSTYPE  yyval;
YYSTYPE  yylval;

/* define the initial stack-sizes */
#ifdef YYSTACKSIZE
#undef YYMAXDEPTH
#define YYMAXDEPTH  YYSTACKSIZE
#else
#ifdef YYMAXDEPTH
#define YYSTACKSIZE YYMAXDEPTH
#else
#define YYSTACKSIZE 10000
#define YYMAXDEPTH  10000
#endif
#endif

#define YYINITSTACKSIZE 200

typedef struct {
    unsigned stacksize;
    YYINT    *s_base;
    YYINT    *s_mark;
    YYINT    *s_last;
    YYSTYPE  *l_base;
    YYSTYPE  *l_mark;
} YYSTACKDATA;
/* variables for the parser stack */
static YYSTACKDATA yystack;
#line 175 "practica3.y"



#include "error.y"
#include "lex.yy.c"

int main (int argc, char** argv) {

	yyparse();

}
#line 405 "y.tab.c"

#if YYDEBUG
#include <stdio.h>		/* needed for printf */
#endif

#include <stdlib.h>	/* needed for malloc, etc */
#include <string.h>	/* needed for memset */

/* allocate initial stack or double stack size, up to YYMAXDEPTH */
static int yygrowstack(YYSTACKDATA *data)
{
    int i;
    unsigned newsize;
    YYINT *newss;
    YYSTYPE *newvs;

    if ((newsize = data->stacksize) == 0)
        newsize = YYINITSTACKSIZE;
    else if (newsize >= YYMAXDEPTH)
        return YYENOMEM;
    else if ((newsize *= 2) > YYMAXDEPTH)
        newsize = YYMAXDEPTH;

    i = (int) (data->s_mark - data->s_base);
    newss = (YYINT *)realloc(data->s_base, newsize * sizeof(*newss));
    if (newss == 0)
        return YYENOMEM;

    data->s_base = newss;
    data->s_mark = newss + i;

    newvs = (YYSTYPE *)realloc(data->l_base, newsize * sizeof(*newvs));
    if (newvs == 0)
        return YYENOMEM;

    data->l_base = newvs;
    data->l_mark = newvs + i;

    data->stacksize = newsize;
    data->s_last = data->s_base + newsize - 1;
    return 0;
}

#if YYPURE || defined(YY_NO_LEAKS)
static void yyfreestack(YYSTACKDATA *data)
{
    free(data->s_base);
    free(data->l_base);
    memset(data, 0, sizeof(*data));
}
#else
#define yyfreestack(data) /* nothing */
#endif

#define YYABORT  goto yyabort
#define YYREJECT goto yyabort
#define YYACCEPT goto yyaccept
#define YYERROR  goto yyerrlab

int
YYPARSE_DECL()
{
    int yym, yyn, yystate;
#if YYDEBUG
    const char *yys;

    if ((yys = getenv("YYDEBUG")) != 0)
    {
        yyn = *yys;
        if (yyn >= '0' && yyn <= '9')
            yydebug = yyn - '0';
    }
#endif

    yynerrs = 0;
    yyerrflag = 0;
    yychar = YYEMPTY;
    yystate = 0;

#if YYPURE
    memset(&yystack, 0, sizeof(yystack));
#endif

    if (yystack.s_base == NULL && yygrowstack(&yystack) == YYENOMEM) goto yyoverflow;
    yystack.s_mark = yystack.s_base;
    yystack.l_mark = yystack.l_base;
    yystate = 0;
    *yystack.s_mark = 0;

yyloop:
    if ((yyn = yydefred[yystate]) != 0) goto yyreduce;
    if (yychar < 0)
    {
        if ((yychar = YYLEX) < 0) yychar = YYEOF;
#if YYDEBUG
        if (yydebug)
        {
            yys = yyname[YYTRANSLATE(yychar)];
            printf("%sdebug: state %d, reading %d (%s)\n",
                    YYPREFIX, yystate, yychar, yys);
        }
#endif
    }
    if ((yyn = yysindex[yystate]) && (yyn += yychar) >= 0 &&
            yyn <= YYTABLESIZE && yycheck[yyn] == yychar)
    {
#if YYDEBUG
        if (yydebug)
            printf("%sdebug: state %d, shifting to state %d\n",
                    YYPREFIX, yystate, yytable[yyn]);
#endif
        if (yystack.s_mark >= yystack.s_last && yygrowstack(&yystack) == YYENOMEM)
        {
            goto yyoverflow;
        }
        yystate = yytable[yyn];
        *++yystack.s_mark = yytable[yyn];
        *++yystack.l_mark = yylval;
        yychar = YYEMPTY;
        if (yyerrflag > 0)  --yyerrflag;
        goto yyloop;
    }
    if ((yyn = yyrindex[yystate]) && (yyn += yychar) >= 0 &&
            yyn <= YYTABLESIZE && yycheck[yyn] == yychar)
    {
        yyn = yytable[yyn];
        goto yyreduce;
    }
    if (yyerrflag) goto yyinrecovery;

    YYERROR_CALL("syntax error");

    goto yyerrlab;

yyerrlab:
    ++yynerrs;

yyinrecovery:
    if (yyerrflag < 3)
    {
        yyerrflag = 3;
        for (;;)
        {
            if ((yyn = yysindex[*yystack.s_mark]) && (yyn += YYERRCODE) >= 0 &&
                    yyn <= YYTABLESIZE && yycheck[yyn] == YYERRCODE)
            {
#if YYDEBUG
                if (yydebug)
                    printf("%sdebug: state %d, error recovery shifting\
 to state %d\n", YYPREFIX, *yystack.s_mark, yytable[yyn]);
#endif
                if (yystack.s_mark >= yystack.s_last && yygrowstack(&yystack) == YYENOMEM)
                {
                    goto yyoverflow;
                }
                yystate = yytable[yyn];
                *++yystack.s_mark = yytable[yyn];
                *++yystack.l_mark = yylval;
                goto yyloop;
            }
            else
            {
#if YYDEBUG
                if (yydebug)
                    printf("%sdebug: error recovery discarding state %d\n",
                            YYPREFIX, *yystack.s_mark);
#endif
                if (yystack.s_mark <= yystack.s_base) goto yyabort;
                --yystack.s_mark;
                --yystack.l_mark;
            }
        }
    }
    else
    {
        if (yychar == YYEOF) goto yyabort;
#if YYDEBUG
        if (yydebug)
        {
            yys = yyname[YYTRANSLATE(yychar)];
            printf("%sdebug: state %d, error recovery discards token %d (%s)\n",
                    YYPREFIX, yystate, yychar, yys);
        }
#endif
        yychar = YYEMPTY;
        goto yyloop;
    }

yyreduce:
#if YYDEBUG
    if (yydebug)
        printf("%sdebug: state %d, reducing by rule %d (%s)\n",
                YYPREFIX, yystate, yyn, yyrule[yyn]);
#endif
    yym = yylen[yyn];
    if (yym)
        yyval = yystack.l_mark[1-yym];
    else
        memset(&yyval, 0, sizeof yyval);
    switch (yyn)
    {
    }
    yystack.s_mark -= yym;
    yystate = *yystack.s_mark;
    yystack.l_mark -= yym;
    yym = yylhs[yyn];
    if (yystate == 0 && yym == 0)
    {
#if YYDEBUG
        if (yydebug)
            printf("%sdebug: after reduction, shifting from state 0 to\
 state %d\n", YYPREFIX, YYFINAL);
#endif
        yystate = YYFINAL;
        *++yystack.s_mark = YYFINAL;
        *++yystack.l_mark = yyval;
        if (yychar < 0)
        {
            if ((yychar = YYLEX) < 0) yychar = YYEOF;
#if YYDEBUG
            if (yydebug)
            {
                yys = yyname[YYTRANSLATE(yychar)];
                printf("%sdebug: state %d, reading %d (%s)\n",
                        YYPREFIX, YYFINAL, yychar, yys);
            }
#endif
        }
        if (yychar == YYEOF) goto yyaccept;
        goto yyloop;
    }
    if ((yyn = yygindex[yym]) && (yyn += yystate) >= 0 &&
            yyn <= YYTABLESIZE && yycheck[yyn] == yystate)
        yystate = yytable[yyn];
    else
        yystate = yydgoto[yym];
#if YYDEBUG
    if (yydebug)
        printf("%sdebug: after reduction, shifting from state %d \
to state %d\n", YYPREFIX, *yystack.s_mark, yystate);
#endif
    if (yystack.s_mark >= yystack.s_last && yygrowstack(&yystack) == YYENOMEM)
    {
        goto yyoverflow;
    }
    *++yystack.s_mark = (YYINT) yystate;
    *++yystack.l_mark = yyval;
    goto yyloop;

yyoverflow:
    YYERROR_CALL("yacc stack overflow");

yyabort:
    yyfreestack(&yystack);
    return (1);

yyaccept:
    yyfreestack(&yystack);
    return (0);
}
