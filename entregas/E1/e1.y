/* 
 * Template de programa bison para a linguagem E1.
 * Serve apenas para definir tokens associados ao analisador léxico implentado com flex.
 * Executar  'bison -d e1.y' para gerar arquivos e1.tab.c e e1.tab.h.
 */

%{
/* includes, C defs */

#include <stdio.h>

void yyerror(const char* msg) {
      fprintf(stderr, "%s\n", msg);
}

int yylex();
%}

/* declare tokens */

%token CONST
%token INT
%token RETURN
%token VOID
%token NUM
%token ID
%token PLUS
%token MINUS
%token SLASH
%token EQUAL
%token MULT
%token CPARENT
%token OPARENT
%token SEMICOLON


%%

program: 
/* void */

%%