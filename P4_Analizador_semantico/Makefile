FLAGS = -lfl
OS_FLAG :=
YACC_VERSION := yacc
ifneq ($(OS),Windows_NT)
	UNAME_S := $(shell uname -s)
	ifneq ($(UNAME_S),Darwin)
		OSFLAG += -lfl
		YACC_VERSION := yacc
	endif
endif

programa: limpiar yacc lex compilar

yacc: ./practica4.y
	$(YACC_VERSION) -v -d practica4.y 

lex: ./practica2.l ./y.tab.h
	flex -l practica2.l

compilar: ./lex.yy.c ./y.tab.c
	gcc -o analizador $(OS_FLAG) y.tab.c

limpiar:
	rm -f  y.tab.c y.tab.h lex.yy.c analizador y.output
