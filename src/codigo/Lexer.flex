package codigo;
import static codigo.Tokens.*;
%%
%class Lexer
%type Tokens
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ ,\t,\r,\n]+
%{
    public String lexeme;
%}
%%

{espacio} {/*Ignore*/}
"=" {lexeme=yytext();return Igual;}
"+" {lexeme=yytext();return Suma;}
"-" {lexeme=yytext();return Resta;}
"*" {lexeme=yytext();return Multiplicacion;}
"/" {lexeme=yytext();return Division;}
"(" {lexeme=yytext();return AbrirParentesis ;}
")" {lexeme=yytext();return CerrarParentesis;}
"<" {lexeme=yytext();return MenorQue ;}
">" {lexeme=yytext();return MayorQue;}
("(-"{D}+")")|{D}+ {lexeme=yytext(); return Numero;}
 . {return ERROR;}

