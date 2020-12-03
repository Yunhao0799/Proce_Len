#include <stdio.h>

void yyerror(char* s){
	extern int num_lineas;
    printf("Error: %s in line %d\n", s, num_lineas);
}