#include <stdio.h>

void yyerror(char* s){
    printf("Error: %s\n", s);
}