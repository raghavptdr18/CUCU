%{
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
extern FILE* yyin;
extern FILE* yyout;
FILE* Parser ;
int yylex();
int yyparse();
void yyerror(char const *);
int main()
{
   
    Parser= fopen("Parser.txt","w");
    yyin=fopen("Sample1.cu","r");
    yyout=fopen("Lexer.txt","w");
    yyparse();
    return 0;
}
%}



%union{
        int a ;
        char* s;
}

%token TYPEINT
%token TYPECHAR
%token INTEGER
%token ID
%token MAIN 
%token WHILE
%token IF
%token RETURN
%token COMMA
%token SEMI

%%
 
program : var_dec   {fprintf(Parser,"\n variable declaration ");}
        | func_dec  {fprintf(Parser,"\n function declaration ");}
        | func_def
		| var_dec program
		| func_def program
		| expr 
		| assign 
		| stmt 
		| expr program
		| assign program
		| stmt program
        ;

var_dec : TYPECHAR ID SEMI  {fprintf(Parser,"\n variable declaration ");}
        | TYPEINT ID SEMI   {fprintf(Parser,"\n variable declaration ");}
	| TYPECHAR ID '=' expr SEMI 
	| TYPEINT ID '=' expr SEMI
    | assign
        ;

func_dec : TYPECHAR ID '(' func_arg ')' ';' {fprintf(Parser,"\n function declaration ");}
         | TYPEINT ID '(' func_arg ')' ';'  {fprintf(Parser,"\n function declaration ");}
         ;

func_def : TYPECHAR ID '(' func_arg ')'  func_body 
         | TYPEINT ID '(' func_arg ')'  func_body
         |TYPECHAR ID '(' func_arg ')'  func_body func_def
         | TYPEINT ID '(' func_arg ')'  func_body func_def
         |
         ;

func_arg : TYPECHAR ID   {fprintf(Parser,"\n function argument ");}
          | TYPECHAR ID COMMA func_arg {fprintf(Parser,"\n function argument ");}
          | TYPEINT ID  {fprintf(Parser,"\n function declaration ");}
          | TYPEINT ID COMMA func_arg {fprintf(Parser,"\n function declaration ");}
          |
          ;

func_body : stmt  {fprintf(Parser,"\n Function Body");}
         | '{' stmtlist '}'
         | func_def
         | assign
         |
	 ;
stmtlist : stmt 
         | stmtlist stmt
         | assign
         |
         ;

assign:  ID '=' expr {fprintf(Parser,"Assign Operator = '='\n");} 	

stmt : IF '(' expr ')' stmt
     | WHILE '(' expr ')' stmt
     | RETURN expr SEMI
     | expr
     | COMMA stmt COMMA
     | '[' stmt ']'
     | '{' stmt '}'
     | stmt
     | var_dec
     | func_dec
     | assign
     ;

 

expr:           expr '+' TERM  {fprintf(Parser,"Plus Operator = '+'\n");} 
|               expr '-' TERM   {fprintf(Parser,"Minus Operator = '-'\n");} 
|               TERM
|   assign
;

TERM:           TERM '*' FACTOR  {fprintf(Parser,"Multiply Operator = ''\n");} 
|               TERM '/' FACTOR      {fprintf(Parser,"Divide Operator = '/'\n");} 
|               FACTOR
| assign
;

FACTOR:     ID          
|           INTEGER         
|           '(' expr ')'   
|	    ID '(' ')'
| assign   
; 
%%