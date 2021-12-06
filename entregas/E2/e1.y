/* 
 * Template de programa bison para a linguagem E1.
 * Serve apenas para definir tokens associados ao analisador léxico implentado com flex.
 * Executar  'bison -d e1.y' para gerar arquivos e1.tab.c e e1.tab.h.
 */

%{
/* includes, C defs */

#include stdio.h

extern int yylineno;
extern char* yytext;

void yyerror(const char* msg) 
      fprintf(stderr, "Erro Lexico na linha: %d char: %s\n", yylineno, yytext);
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


program : declaration-list compound-stmt
;

declaration-list : declaration-list declaration | declaration
;

declaration : var-declaration | const-declaration 
;
var-declaration : type-specifier ID SEMICOLON
;
type-specifier : INT | VOID
;
const-declaration : CONST type-specifier ID  NUM SEMICOLON
;


compound-stmt :  local-declarations statement-list         // ERRATA: com chaves
;
local-declarations : local-declarations var-declaration |  /* empty */
;
statement-list : statement-list statement | /* empty */
;
statement : expression-stmt | return-stmt
;
expression-stmt : expression SEMICOLON | SEMICOLON
;
return-stmt : RETURN SEMICOLON | RETURN expression SEMICOLON
;


expression : ID  additive-expression
;
additive-expression : additive-expression addop term | term
;

addop : PLUS | MINUS
;

term : term mulop factor | factor
;

mulop : MULT | SLASH
;

factor : OPARENT expression CPARENT | ID | NUM
;