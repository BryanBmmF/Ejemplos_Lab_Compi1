/*Seccion 1, codigo java de encabezado o del usuario*/

//separador de area
%%

/*Seccion , Directivas de configuracion jflex*/
%public
%class Lexer
%standalone
%line
%column

/*expresion regulr para comentarios de bloque*/
//COMENTARIO_BLOQUE = ("/*")[^/*]*("*/")

COMENTARIO_BLOQUE = ("/*") {CONTENIDO} ("*"+ "/")
CONTENIDO = ([^*] | "*"+ [^/*])*

//COMENTARIO_LINEA = "//"[^\n]*


//secciones de codigo incrustados
%{
    //declaracion de una variableS contador
    public int contBloque=1;
	
%}


%%
//separador de area

/* reglas lexicas */
<YYINITIAL> {
    
	{COMENTARIO_BLOQUE}
		{
            System.out.println("Comentario_Bloque "+contBloque+" Lexema: \n"+yytext()
                + " Linea: "+(yyline+1)+" Columna: "+(yycolumn+1)+"\n");
            contBloque++;
        }
    
}

/* Por cualquier otro simbolo, en este caso no hace nada */
[^] 
{ }