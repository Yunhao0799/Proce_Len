FLAGS = -lfl
OS_FLAG :=
ifneq ($(OS),Windows_NT)
	UNAME_S := $(shell uname -s)
	ifneq ($(UNAME_S),Darwin)
		OSFLAG += -lfl
	endif
endif

programa: limpiar lex compilar

lex: ./practica2.c
	flex practica2.c

compilar: ./lex.yy.c
	gcc -o $(OS_FLAG) analizador lex.yy.c


limpiar:
	rm -f lex.yy.c analizador
