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
    5,    7,    8,    9,    9,    9,    9,    9,    4,    4,
    4,   11,   11,   11,   11,   12,   12,   12,   12,    6,
    6,    6,    6,    6,    6,    6,    6,    6,   19,   19,
   19,   19,   19,   19,   19,   17,   18,   20,   20,   21,
   21,   21,   21,   23,   23,   14,   24,   24,   16,   16,
   15,   10,   10,   26,   27,   25,   28,   28,   28,   13,
   13,   13,   13,   22,   22,   22,   22,   22,   22,   22,
   22,   22,   22,   29,   30,   30,   30,
};
static const YYINT yylen[] = {                            2,
    2,    3,    3,    2,    2,    2,    1,    1,    1,    2,
    0,    2,    4,    4,    2,    3,    1,    0,    2,    1,
    0,    4,    3,    4,    3,    3,    3,    2,    2,    1,
    1,    1,    1,    2,    2,    1,    2,    0,    1,    1,
    1,    1,    2,    2,    0,    4,    4,    3,    1,    3,
    5,    1,    3,    2,    1,    8,    3,    3,    8,    6,
    5,    1,    1,    1,    2,    4,    1,    1,    1,    3,
    3,    3,    3,    3,    3,    2,    2,    2,    2,    5,
    3,    1,    1,    3,    3,    1,    0,
};
static const YYINT yydefred[] = {                         0,
    0,    0,    0,    0,    0,    1,    2,    0,    0,    0,
    0,    0,   64,    0,    0,   36,    0,    0,    0,    0,
    0,   20,   33,   30,   31,   32,    0,    0,   62,   63,
    0,    0,    0,    0,   65,    0,    0,    3,    0,    0,
    0,   19,    0,   10,    0,    0,    0,    0,    0,   34,
   35,    0,   70,   72,   73,    0,    0,    0,    0,   49,
    0,   83,   82,    0,    0,    0,    0,    0,    0,    0,
   12,   23,   28,    0,    0,   25,   29,    0,    0,    0,
    0,   46,    0,    0,    0,    0,   55,    0,   47,    0,
   67,   68,    0,    0,    0,   17,    0,    0,   22,   26,
   24,   27,    0,   57,   58,    0,   61,    0,   48,   81,
   54,   53,    0,    0,    0,    0,    0,   13,    0,   15,
    0,    0,    0,    0,    0,   16,    0,    0,    0,    0,
   51,    0,   14,   66,   59,   56,
};
static const YYINT yydgoto[] = {                          2,
    3,   16,   17,   18,   19,   46,   44,   45,   97,   21,
   22,   48,   23,   24,   25,   26,   27,   28,    0,   61,
   68,   69,   88,   57,  105,   29,   30,   95,    0,    0,
};
static const YYINT yysindex[] = {                      -270,
 -227,    0, -206, -212, -155,    0,    0, -201, -215, -198,
 -166, -182,    0, -138, -134,    0, -189, -264, -132, -121,
 -110,    0,    0,    0,    0,    0, -142, -123,    0,    0,
  -54, -264, -264, -112,    0, -103,  -83,    0, -264, -132,
 -121,    0, -114,    0, -206, -121, -180,  -98, -184,    0,
    0, -242,    0,    0,    0, -106, -105, -100,  -75,    0,
 -149,    0,    0,  -60,  -60,  -60,  -70, -127,  -42, -249,
    0,    0,    0, -146, -150,    0,    0, -170,  -94, -206,
  -73,    0,  -52,  -42,  -51,  -42,    0, -236,    0,  -80,
    0,    0,  -60,  -60,  -60,    0, -102,  -35,    0,    0,
    0,    0, -264,    0,    0, -206,    0,  -26,    0,    0,
    0,    0,  -70,  -42,  -38,  -42,  -42,    0, -216,    0,
  -22,  -81,  -47, -234,  -60,    0,  -20,  -23, -206, -206,
    0,  -42,    0,    0,    0,    0,
};
static const YYINT yyrindex[] = {                         0,
    0,    0,    0,    0,  -19,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0, -250, -117, -226,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0, -151, -104,
 -208,    0,    0,    0,    0, -136,    0,    0,    0,    0,
    0, -220,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,  -93,  -88,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,  -78,    0,  -77,    0,    0,    0,    0,
    0,    0, -179,  -58,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,  -66,    0,  -59,  -49,    0,    0,    0,
    0, -185,    0,    0,    0,    0,    0,    0,    0,    0,
    0,  -39,    0,    0,    0,    0,
};
static const YYINT yygindex[] = {                         0,
    0,   -3,    0,  225,  226,    7,    0,  213,    0,  -65,
  -14,    0,  -15,    0,    0,    0,    0,    0,    0,    0,
    0,  -63,  132,  214,    0,  234,    0,    0,    0,    0,
};
#define YYTABLESIZE 247
static const YYINT yytable[] = {                          6,
   84,   85,   86,   42,   98,   49,    7,   96,    7,    7,
   12,   20,   13,    1,    7,   55,    7,   56,   56,    7,
  111,   31,  111,   41,   42,   12,  114,   13,   70,  115,
  116,  117,   75,    9,    7,    7,   71,  121,   71,   71,
  126,   71,   71,    4,   71,  112,   71,  131,    9,   71,
    9,    6,    5,  127,   71,   32,   71,   71,   12,    7,
   13,  132,   31,  104,   71,   71,    6,    8,    6,    5,
   38,   60,   33,   60,   60,    9,  107,   10,   76,   60,
   11,   60,   72,   31,   60,   12,   77,   13,   77,   60,
   34,   60,   77,   77,   13,   14,   15,   73,   77,   60,
   60,    8,  122,    5,   12,    4,   13,    4,    4,    9,
  103,   10,  101,    4,   11,    4,   99,   31,    4,   12,
   50,   13,   82,   37,   43,  135,  136,  102,   83,   14,
   15,  100,   36,    4,    4,    8,   37,    5,   37,   51,
   37,    8,    8,    9,   89,   10,   47,    8,   11,    8,
   90,   59,    8,   60,    5,    5,   70,    8,   74,    8,
    5,   78,    5,   14,   15,    5,   79,    8,    8,  118,
    5,   80,    5,   62,   63,  119,   62,   63,   52,  106,
    5,    5,   81,   18,   52,   64,   87,   65,   64,   18,
   65,  129,   66,   76,   78,   66,   62,   63,   67,   76,
   78,  113,   52,   53,  109,   50,  108,   79,   64,   79,
   65,   50,   75,   79,   91,   66,   92,   93,   75,   79,
  110,  120,   74,   91,   94,   92,   93,  125,   74,   92,
   93,  123,   80,   94,  128,  130,  133,   94,   80,  134,
   11,   39,   40,   54,  124,   35,   58,
};
static const YYINT yycheck[] = {                          3,
   64,   65,   66,   18,   70,   21,  257,  257,  259,  260,
  275,    5,  277,  284,  265,   31,  267,   32,   33,  270,
  257,  264,  257,   17,   39,  275,   90,  277,  271,   93,
   94,   95,   48,  260,  285,  286,  257,  103,  259,  260,
  257,   45,  263,  271,  265,  282,  267,  282,  275,  270,
  277,  260,  259,  119,  275,  271,  277,  278,  275,  272,
  277,  125,  264,   78,  285,  286,  275,  257,  277,  259,
  260,  257,  271,  259,  260,  265,   80,  267,  263,  265,
  270,  267,  263,  264,  270,  275,  266,  277,  268,  275,
  257,  277,  272,  278,  277,  285,  286,  278,  278,  285,
  286,  257,  106,  259,  275,  257,  277,  259,  260,  265,
  281,  267,  263,  265,  270,  267,  263,  264,  270,  275,
  263,  277,  272,  260,  257,  129,  130,  278,  278,  285,
  286,  278,  271,  285,  286,  257,  271,  259,  275,  263,
  277,  259,  260,  265,  272,  267,  257,  265,  270,  267,
  278,  264,  270,  257,  259,  260,  271,  275,  257,  277,
  265,  268,  267,  285,  286,  270,  272,  285,  286,  272,
  275,  272,  277,  257,  258,  278,  257,  258,  272,  274,
  285,  286,  258,  272,  278,  269,  257,  271,  269,  278,
  271,  273,  276,  272,  272,  276,  257,  258,  282,  278,
  278,  282,  257,  258,  257,  272,  280,  266,  269,  268,
  271,  278,  272,  272,  266,  276,  268,  269,  278,  278,
  272,  257,  272,  266,  276,  268,  269,  266,  278,  268,
  269,  258,  272,  276,  257,  283,  257,  276,  278,  263,
  260,   17,   17,   31,  113,   12,   33,
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
"SENTENCIAS : ASIGNACION",
"SENTENCIAS : SENTENCIA_ENTRADA PUNTOYCOMA",
"SENTENCIAS : SENTENCIA_SALIDA PUNTOYCOMA",
"SENTENCIAS : BLOQUE",
"SENTENCIAS : SENTENCIAS SENTENCIAS",
"SENTENCIAS :",
"SENTENCIA_UNICA : BUCLE_FOR",
"SENTENCIA_UNICA : BUCLE_WHILE",
"SENTENCIA_UNICA : SENTENCIA_SI",
"SENTENCIA_UNICA : ASIGNACION",
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
"CONDICION : VAR_LOCAL OP_LOGICO VAR_LOCAL",
"CONDICION : VAR_LOCAL OP_LOGICO CONST",
"SENTENCIA_SI : BUCLE_SI INI_PARENTESIS CONDICION FIN_PARENTESIS ENTONCES BLOQUE SINO BLOQUE",
"SENTENCIA_SI : BUCLE_SI INI_PARENTESIS CONDICION FIN_PARENTESIS ENTONCES BLOQUE",
"BUCLE_WHILE : BUCLE_MIENTRAS INI_PARENTESIS CONDICION FIN_PARENTESIS BLOQUE",
"TIPO_DATO : TIPO_BASICO",
"TIPO_DATO : TIPO_COMPLEJO",
"TIPO_BASICO : TIPO_VAR",
"TIPO_COMPLEJO : DECL_LISTAS TIPO_BASICO",
"CONST : CONSTANTE TIPO_DATO ID PUNTOYCOMA",
"OP_BINARIO : OP_ARITMETICA",
"OP_BINARIO : OP_LOGICO",
"OP_BINARIO : OP_BINARIO",
"ASIGNACION : ID OP_ASIGNACION NUMERO",
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
#line 172 "practica3.y"



#include "error.y"
#include "lex.yy.c"

int main (int argc, char** argv) {

	yyparse();

}
#line 397 "y.tab.c"

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
