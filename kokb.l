%{
#include <stdio.h>
#include <stdlib.h>
int errorLineCounter = 1;
%}

%%
"exit"                  { printf("EXIT_COMMAND\n"); }
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
"=="                    { printf("EQUALS\n"); }
"!="                    { printf("NOT_EQUALS\n"); }
"&&"                    { printf("AND\n"); }
"||"                    { printf("OR\n"); }
"!"                     { printf("NOT\n"); }
"("                     { printf("LPAREN\n"); }
")"                     { printf("RPAREN\n"); }
"{"                     { printf("LBRACE\n"); }
"}"                     { printf("RBRACE\n"); }
"["                     { printf("LBRACKET\n"); }
"]"                     { printf("RBRACKET\n"); }
"if"                    { printf("IF\n"); }
"else"                  { printf("ELSE\n"); }
"else if"               { printf("ELSEIF\n"); }
"while"                 { printf("WHILE\n"); }
"true"                  { printf("TRUE\n"); }
"false"                 { printf("FALSE\n"); }

"def"                   { printf("FUNCTION_DEF\n"); }

[a-z][a-zA-Z0-9_]*      { printf("IDENTIFIER: %s\n", yytext); }
[-]?[1-9][0-9]*|0       { printf("NUMBER: %s\n", yytext); }
[-]?[0-9]*\.[0-9]+      { printf("FLOAT: %s\n", yytext); }
["].*["]                { 
                          char* str = malloc(yyleng - 1);
                          strncpy(str, yytext + 1, yyleng - 2);
                          str[yyleng - 2] = '\0';
                          printf("STRING: %s\n", str);
                          free(str);
                        }
[\/][\/].*              { printf("COMMENT\n"); }
[\n]                    { errorLineCounter++; }
[ \t]+                  /* skip whitespace */
[\r\n]+                 { errorLineCounter++; } /* skip empty lines */
.                       { printf("ERROR: unexpected character '%s' at line %d\n", yytext, errorLineCounter); }
%%

int yywrap(void) {
    return 1;
}