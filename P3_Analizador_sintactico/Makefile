programa: limpiar yacc lex compilar

yacc: ./practica3.y
	byacc -d practica3.y 

lex: ./practica2.l ./y.tab.h
	flex practica2.l

compilar: ./lex.yy.c ./y.tab.c
	gcc -o analizador -lfl y.tab.c

limpiar:
	rm -f  y.tab.c y.tab.h lex.yy.c analizador
