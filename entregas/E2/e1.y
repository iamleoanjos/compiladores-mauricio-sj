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

void yyerror(const char* msg) {
      fprintf(stderr, "Erro Lexico na linha: %d char: %s\n, yylineno, yytext);
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


program : declarationMINUSlist compoundMINUSstmt

declarationMINUSlist : declarationMINUSlist declaration | declaration

declaration : varMINUSdeclaration | constMINUSdeclaration 

varMINUSdeclaration : typeMINUSspecifier ID ; 

typeMINUSspecifier : INT | VOID

constMINUSdeclaration : CONST typeMINUSspecifier ID  NUM ;



compoundMINUSstmt : { localMINUSdeclarations statementMINUSlist }        // ERRATA: com chaves

localMINUSdeclarations : localMINUSdeclarations varMINUSdeclaration |  /* empty */

statementMINUSlist : statementMINUSlist statement | /* empty */

statement : expressionMINUSstmt | returnMINUSstmt

expressionMINUSstmt : expression ; | ;

returnMINUSstmt : return ; | return expression ;



expression : ID  additiveMINUSexpression

additiveMINUSexpression : additiveMINUSexpression addop term | term

addop : PLUS | MINUS

term : term mulop factor | factor

mulop : MULT | SLASH

factor : ( expression ) | ID | NUM