%option noyywrap nodefault yylineno

%{
#include "e1.tab.h"
%}

%%

"//".*                { /* void */ }

const                 { return CONST; }
int                   { return INT; }
return                { return RETURN; }
void                 { return VOID; }


[0-9]+                { return NUM; }
[a-zA-Z][a-zA-Z0-9_]* { return ID; }

"+"                   { return PLUS; }
"-"                   { return MINUS; }
"/"                   { return SLASH; }
"="                   { return EQUAL; }
"*"                   { return MULT; }
"("                   { return CPARENT; }
")"                   { return OPARENT; }
";"                   { return SEMICOLON; }

[ \n\t]+              { /* void */ }

.                     {  fprintf(stdout,"Erros léxicos na linha %d ", yylineno); fprintf(stdout," on char: %s\n", yytext); }  

%%

/* Programa para simples conferência (ad-hoc) da saída yylex() */

int main(int argc, char **argv) {
    int token;
    const int N = 14; // número de classes de tokens: olhar programa .y

    // nomes das classes de token (só serve para mostrar e ajudar a conferir) 
    // array token_name precisa ser ajustado ao incluir outros token codes
    
    char *token_name[14] = {"CONST", "INT", "RETURN","VOID","NUM","ID","PLUS", "MINUS",  "SLASH", "EQUAL", "MULT", "CPARENT", "OPARENT", "SEMICOLON"};

     /*while ((token = yylex())) {
       fprintf(stdout,"token code: %d", token);
       fprintf(stdout,", token class: %s", token_name[token-258]);
       fprintf(stdout,", lexeme: %s\n", yytext);
    }*\

    if (yyparse() == 0) {
                fprintf(stdout, "Verificação Sem erros sintáticos\n");

            } else {
                
                fprintf(stdout, "Foram encontrados Erros\n");
            }

}