package com.example.demomorse.analizadores;

import java.util.ArrayList;
import java.util.List;
import java_cup.runtime.*;
import static com.example.demomorse.analizadores.sym.*;

%%

%public
%class Lexer
%cup
%cupdebug
%line
%column

//caracteres y separadores
SEPARADORES = [ \r\t\b\f\n]

//reservadas
PS = "ps"
LN = "ln"

//Numeros
ENTERO = [1-5]
%{

	private List<String> errorsList;
%}

%{
	private Symbol symbol(int type) {
        String lexeme = yytext();
        System.out.printf("Token tipo %d, lexeme %s, en linea %d, columna %d\n", type, lexeme == null ? "" : lexeme, yyline + 1, yycolumn + 1);
        return new Symbol(type, new Token(lexeme, yyline + 1, yycolumn + 1));
    }

    private Symbol symbol(int type, String lexeme) {
        System.out.printf("Token tipo %d, lexeme %s, en linea %d, columna %d\n", type, lexeme == null ? "" : lexeme, yyline + 1, yycolumn + 1);
        return new Symbol(type, new Token(lexeme, yyline + 1, yycolumn + 1));
    }

    private void error(String lexeme) {
        System.out.printf("Error Lexico en el Texto: %s  linea %d,  columna %d. \n", lexeme, yyline + 1, yycolumn + 1);
            errorsList.add(String.format("Error Lexico en el Texto: %s  linea %d, columna %d. Corrige e intenta de nuevo.", lexeme, yyline + 1, yycolumn + 1));
    }
    public List<String> getErrorsList() {
        return errorsList;
    }
%}
%init{
    errorsList = new ArrayList<>();
%init}

%%

/* reglas lexicas */
<YYINITIAL> {
	{PS}
		{System.out.printf(" Punto: %s\n", yytext()); return symbol(PS, yytext());}
	{LN}
		{System.out.printf(" Linea: %s\n", yytext()); return symbol(LN, yytext());}
	{ENTERO}
		{System.out.printf(" Numero: %s\n", yytext()); return  symbol(ENTERO, yytext());}
	{SEPARADORES}
	 	{/* los ignoramos */}

}

/* Error por cualquier otro simbolo*/
[^]
		{ error(yytext()); return symbol(error, yytext());}

<<EOF>>
        //fin de archivo
		{ return symbol(EOF); }
