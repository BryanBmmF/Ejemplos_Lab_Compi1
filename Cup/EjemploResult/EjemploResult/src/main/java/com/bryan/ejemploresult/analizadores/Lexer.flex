package com.bryan.ejemploresult.analizadores;

import java.util.ArrayList;
import java.util.List;
import java_cup.runtime.*;
import static com.bryan.ejemploresult.analizadores.sym.*;

%%

%public
%class Lexer
%cup
%cupdebug
%line
%column

//caracteres y separadores
SEPARADORES = [ \r\t\b\f\n]

//simbolos a manejar
PARENT_A = "("
PARENT_C = ")"
SUMA = "+"
RESTA = "-"
MULT = "*"
DIV = "/"
//Numeros
NUMERO_ENTERO = 0 |[1-9][0-9]*

%{

	private List<String> errorsList;
%}

%{
	private Symbol symbol(int type) {
        String lexeme = yytext();
        //System.out.printf("Token tipo %d, lexeme %s, en linea %d, columna %d\n", type, lexeme == null ? "" : lexeme, yyline + 1, yycolumn + 1);
        return new Symbol(type, new Token(lexeme, yyline + 1, yycolumn + 1));
    }

    private Symbol symbol(int type, String lexeme) {
        //System.out.printf("Token tipo %d, lexeme %s, en linea %d, columna %d\n", type, lexeme == null ? "" : lexeme, yyline + 1, yycolumn + 1);
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
	{PARENT_A}
		{System.out.printf(" PARENT_A: %s\n", yytext()); return symbol(PARENT_A, yytext());}
	{PARENT_C}
		{System.out.printf(" PARENT_C: %s\n", yytext()); return symbol(PARENT_C, yytext());}
	{SUMA}
		{System.out.printf(" SUMA: %s\n", yytext()); return symbol(SUMA, yytext());}
	{RESTA}
		{System.out.printf(" RESTA: %s\n", yytext()); return symbol(RESTA, yytext());}
	{MULT}
		{System.out.printf(" MULT: %s\n", yytext()); return symbol(MULT, yytext());}
	{DIV}
		{System.out.printf(" DIV: %s\n", yytext()); return symbol(DIV, yytext());}
    {NUMERO_ENTERO}
		{System.out.printf(" NUMERO_ENTERO: %s\n", yytext()); return symbol(NUMERO_ENTERO, yytext());}
    {SEPARADORES}
	 	{/* los ignoramos */}

}

/* Error por cualquier otro simbolo*/
[^]
		{ error(yytext()); return symbol(error, yytext());}


