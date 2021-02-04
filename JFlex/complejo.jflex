/*Seccion 1, codigo java de encabezado o del usuario*/

//separador de area
%%

/*Seccion , Directivas de configuracion jflex*/
%public
%class Lexer
%standalone
%line
%column

LineTerminator = [\r|\n|\r\n]
WhiteSpace = {LineTerminator} | [ \t\f]

/*Expresion regular para Σ= {a, b} que acepte cadenas de a’s y b’s que contengan una cantidad impar de b’s*/
LENGUAJE_6 = (a* b a* b a* )* a* b a*

/*Expresion regular para para Σ= {N: 0,1,2,3,...}  que acepte números de punto flotante con N número de decimales*/
LENGUAJE_8 = ([0][.]{N0}+|{N1}{N0}*[.]{N0}+)
N0 = [0-9]
N1 = [1-9]

/*expresion regulr para comentarios de bloque*/
//COMENTARIO_BLOQUE = ("/*")[^/*]*("*/")

COMENTARIO_BLOQUE = ("/*") {CONTENIDO} ("*"+ "/")
CONTENIDO = ([^*] | "*"+ [^/*])*

COMENTARIO_LINEA = "//"[^\n]*

//secciones de codigo incrustados
%{
    //declaracion de una variableS contador
    public int l3=1 ;
    public int l6=1 ;
    public int l8=1 ;
    public int bloque=1 ;
    public int linea=1 ;
	
%}


%%
//separador de area

/* reglas lexicas */
<YYINITIAL> {
    
    {LENGUAJE_6}
		{
            System.out.println("Cadena "+l6+" Lenguaje 6 Lexema: "+yytext()
                + " Linea: "+(yyline+1)+" Columna: "+(yycolumn+1)+"\n");
            l6++;
        }
    
    {LENGUAJE_8}
		{
            System.out.println("Cadena "+l8+" Lenguaje 8 Lexema: "+yytext()
                + " Linea: "+(yyline+1)+" Columna: "+(yycolumn+1)+"\n");
            l8++;
        }
    
	{COMENTARIO_BLOQUE}
		{
            System.out.println("Comentario_Bloque "+bloque+" Lexema: \n"+yytext()
                + " Linea: "+(yyline+1)+" Columna: "+(yycolumn+1)+"\n");
            bloque++;
        }
    
    {COMENTARIO_LINEA}
		{
            System.out.println("Comentario_Linea "+linea+" Lexema: \n"+yytext()
                + " Linea: "+(yyline+1)+" Columna: "+(yycolumn+1)+"\n");
            linea++;
        }
    /* whitespace */
      {WhiteSpace}
        { /* ignore */ }
    
}

/* Por cualquier otro simbolo, en este caso no hace nada */
//[^] 
//{ }

/* Desplegar un error */
//[^] { throw new Error("Caracter Invalido <"+yytext()+">"); }

[^] { System.out.println("Caracter Invalido <"+yytext()+">" + " Linea: "+(yyline+1)+ " Columna: "+(yycolumn+1)); }