%{
#include <stdio.h>
#include "y.tab.h"
char pl = '(';
char pr = ')';
char lc = '{';
char rc = '}';
void yyerror(char* s){
    fprintf(stderr, "Error: %s\n", s);
}
%}

%%
"main" {
    yylval.s=strdup(yytext);
    fprintf(yyout,"KEYWORD : main\n");
    return MAIN;
}

"int" {
    
    fprintf(yyout,"\nTYPE : INT ");yylval.s=strdup(yytext);
    return TYPEINT;
    }
"char*" {
   
    fprintf(yyout,"\nTYPE : CHAR "); yylval.s=strdup(yytext);
    return TYPECHAR;
    }
"while" {
    yylval.s=strdup(yytext);
    fprintf(yyout,"\nKEYWORD : while");
    return WHILE;
}
"if" {
    yylval.s=strdup(yytext);
    fprintf(yyout,"\nKEYWORD : if");
    return IF;
}
"return" {
    fprintf(yyout,"\nKEYWORD : = RETURN\n");
    return RETURN;
}
[a-zA-Z][a-zA-Z0-9_]* {
    yylval.s=strdup(yytext);
    fprintf(yyout,"\nID : %s", yytext);
    return ID ;
}
[0-9]* {
    yylval.a=atoi(yytext);
    fprintf(yyout,"\nConstant : %d", atoi(yytext));
    return INTEGER ;
}
"+" {
    yylval.s=strdup(yytext);
    fprintf(yyout,"\nPLUS : +\n");
    return yytext[0];
}
"-" {
    yylval.s=strdup(yytext);
    fprintf(yyout,"\nMINUS : -\n");
    return yytext[0] ;
}
"(" {
    yylval.s=strdup(yytext);
    fprintf(yyout,"\nLEFT PARANTHESIS : %c \n",pl);
    return yytext[0] ;
}
")" {
    yylval.s=strdup(yytext);
    fprintf(yyout,"\nRIGHT PARANTHESIS : %c \n",pr);
   return yytext[0];
}
"{" {
    
    fprintf(yyout,"\nLEFT CURL : %c \n",lc);
    return yytext[0] ;
}
"}" {
    
    fprintf(yyout,"\nRIGHT CURL : %c \n",rc);
   return yytext[0];
}
"[" {
    yylval.s=strdup(yytext);
    fprintf(yyout,"\nLEFT BRAC : [ \n");
    return yytext[0];
}
"]" {
    yylval.s=strdup(yytext);
    fprintf(yyout,"\nRIGHT BRAC : ] \n");
    return yytext[0] ;
}
"*" {
    yylval.s=strdup(yytext);
    fprintf(yyout,"\nMULTIPLY : * \n");
    return yytext[0];
}
"/" {
    yylval.s=strdup(yytext);
    fprintf(yyout,"\nDIVISION : / \n");
    return yytext[0];
}
"==" {
    yylval.s=strdup(yytext);
    fprintf(yyout,"\nEQUALS : == \n");
    return yytext[0] ;
}
"!=" {
    yylval.s=strdup(yytext);
    fprintf(yyout,"\nNOTEQUALS : != \n");
   return yytext[0] ;
}
"=" {
    yylval.s=strdup(yytext);
    fprintf(yyout,"\nASSIGN : = \n");
   return yytext[0];
}

";" {
    yylval.s=strdup(yytext);
    fprintf(yyout,"\nSEMI : ;\n");
    return SEMI;
}
"," {
    yylval.s=strdup(yytext);
    fprintf(yyout,"\nCOMMA : ,\n");
    return COMMA;
}

[ \t\n]+ ;

. {fprintf(yyout,"\n ERROR ");}

%%
int yywrap(){
    return 1;
}