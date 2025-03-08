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
"=="                    { return EQUALS; }
"!="                    { return NOT_EQUALS; }
"&&"                    { return AND; }
"||"                    { return OR; }
"!"                     { return NOT; }
"("                     { return LPAREN; }
")"                     { return RPAREN; }
"{"                     { return LBRACE; }
"}"                     { return RBRACE; }
"["                     { return LBRACKET; }
"]"                     { return RBRACKET; }
"if"                    { return IF; }
"else"                  { return ELSE; }
"else if"               { return ELSEIF; }
"while"                 { return WHILE; }
[a-z][a-zA-Z0-9_]*      { yylval.id = yytext[0]; return IDENTIFIER; }
[-]?[1-9][0-9]*|0       { yylval.num = atoi(yytext); return NUMBER; }
["].*["]                {
                          char* str = malloc(yyleng - 2); 
                          strncpy(str, yytext + 1, yyleng - 2);
                          yylval.str = str;
                          return STRING;
                        }
[\/][\/].*              { return (COMMENT); }      
[\n]                    { errorLineCounter++; }

[ \t]+          /* skip whitespace */
[\r\n]+         /* skip empty lines */ { errorLineCounter++; }
.                       { yyerror ("unexpected character"); }  

%%

int yywrap(void) {
    return 1;
}
