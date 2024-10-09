package codigo;
import java_cup.runtime.Symbol;  
%%
%class LexerCup 
%type java_cup.runtime.Symbol 
%cup
%full
%line
%char
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ ,\t,\r ]+
%{
    private Symbol symbol(int type, Object value){
        return new Symbol(type, yyline, yycolumn, value);
    }
    private Symbol symbol(int type){
        return new Symbol(type, yyline, yycolumn);
    } 
%}
%%

{espacio} {/*Ignore*/}
"=" {return new Symbol(sym.Igual, yychar, yyline, yytext());}
"+" {return new Symbol(sym.Suma, yychar, yyline, yytext());}
"-" {return new Symbol(sym.Resta, yychar, yyline, yytext());}
"*" {return new Symbol(sym.Multiplicacion, yychar, yyline, yytext());}
"/" {return new Symbol(sym.Division, yychar, yyline, yytext());}
"(" {return new Symbol(sym.AbrirParentesis, yychar, yyline, yytext());}
")" {return new Symbol(sym.CerrarParentesis, yychar, yyline, yytext());}
"<" {return new Symbol(sym.MenorQue, yychar, yyline, yytext());}
">" {return new Symbol(sym.MayorQue, yychar, yyline, yytext());}
("(-"{D}+")")|{D}+ {return new Symbol(sym.Numero, yychar, yyline, yytext());}
 . {return new Symbol(sym.error, yychar, yyline, yytext());}