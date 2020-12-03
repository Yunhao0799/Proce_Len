/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton interface for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     OP_LOGICO = 258,
     OP_ARITMETICA = 259,
     NEGACION = 260,
     OP_UNARIO = 261,
     OP_UNI_BIN = 262,
     SINO = 263,
     ID = 264,
     NUMERO = 265,
     INI_BLOQUE = 266,
     FIN_BLOQUE = 267,
     INI_AGREGADO = 268,
     FIN_AGREGADO = 269,
     PUNTOYCOMA = 270,
     OP_ASIGNACION = 271,
     BUCLE_SI = 272,
     BUCLE_MIENTRAS = 273,
     BUCLE_PARA = 274,
     INI_PARENTESIS = 275,
     FIN_PARENTESIS = 276,
     ENTONCES = 277,
     DECL_LISTAS = 278,
     TIPO_VAR = 279,
     COMA = 280,
     DOSPUNTOS = 281,
     MODO_FOR = 282,
     CONSTANTE = 283,
     COMILLAS = 284,
     FINPARA = 285,
     PRINCIPAL = 286,
     ENTRADA = 287,
     SALIDA = 288,
     SENTENCIA_LIST = 289
   };
#endif
/* Tokens.  */
#define OP_LOGICO 258
#define OP_ARITMETICA 259
#define NEGACION 260
#define OP_UNARIO 261
#define OP_UNI_BIN 262
#define SINO 263
#define ID 264
#define NUMERO 265
#define INI_BLOQUE 266
#define FIN_BLOQUE 267
#define INI_AGREGADO 268
#define FIN_AGREGADO 269
#define PUNTOYCOMA 270
#define OP_ASIGNACION 271
#define BUCLE_SI 272
#define BUCLE_MIENTRAS 273
#define BUCLE_PARA 274
#define INI_PARENTESIS 275
#define FIN_PARENTESIS 276
#define ENTONCES 277
#define DECL_LISTAS 278
#define TIPO_VAR 279
#define COMA 280
#define DOSPUNTOS 281
#define MODO_FOR 282
#define CONSTANTE 283
#define COMILLAS 284
#define FINPARA 285
#define PRINCIPAL 286
#define ENTRADA 287
#define SALIDA 288
#define SENTENCIA_LIST 289




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

