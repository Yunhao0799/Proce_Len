FLAGS = -lfl

programa: limpiar lex compilar

lex: ./practica2.c
	flex practica2.c

compilar: ./lex.yy.c
	gcc -lfl -o analizador lex.yy.c

limpiar:
	rm -f lex.yy.c analizador
