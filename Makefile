FLAGS = -lfl
FUENTE = fuente.c


programa: limpiar lex compilar

lex: #(FUENTE)
	flex #(FUENTE)

compilar: lex.yy.c
	gcc -lfl -o ejecutable lex.yy.c

limpiar:
	rm -f lex.yy.c ejecutable