%{
#include <stdio.h>
#include <stdlib.h>

int errorLineCounter = 1;
%}


%%

"exit"		              { printf("EXIT_COMMAND\n"); }
";"                     { printf("SEMICOLON\n"); }
"print"                 { printf("PRINT\n"); }
"+"                     { printf("PLUS\n"); }
"-"                     { printf("MINUS\n"); }
"*"                     { printf("MULTIPLY\n"); }
"/"                     { printf("DIVIDE\n"); }
"^"                     { printf("POWER\n"); }
"="                     { printf("ASSIGN\n"); }
"%"                     { printf("MODULE\n"); }
"++"                    { printf("INCREMENT\n"); }
"--"                    { printf("DECREMENT\n"); }
"<"                     { printf("LESS_THAN\n"); }
">"                     { printf("GREATER_THAN\n"); }
">="                    { printf("GREATER_THAN_OR_EQUAL\n"); }
"<="                    { printf("LESS_THAN_OR_EQUAL\n"); }

%%