FLAGS = -lfl
OS_FLAG :=
ifneq ($(OS),Windows_NT)
	UNAME_S := $(shell uname -s)
	ifneq ($(UNAME_S),Darwin)
		OSFLAG += -lfl
	endif
endif

programa: limpiar lex compilar

lex: ./practica2.l
	flex practica2.l

compilar: ./lex.yy.c
	gcc -o $(OS_FLAG) analizador lex.yy.c


limpiar:
	rm -f lex.yy.c analizador
