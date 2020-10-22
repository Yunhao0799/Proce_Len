FLAGS = -lfl
FUENTE = practica2.c


programa: limpiar lex compilar

lex: #(FUENTE)
	flex #(FUENTE)

compilar: lex.yy.c
	gcc -lfl -o analizador lex.yy.c

limpiar:
	rm -f lex.yy.c analizador
