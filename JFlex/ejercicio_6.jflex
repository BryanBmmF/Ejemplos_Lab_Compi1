/*Seccion 1, codigo java de encabezado o del usuario*/

//separador de area
%%

/*Seccion , Directivas de configuracion jflex*/
%public
%class Lexer
%standalone
%line
%column

/*Expresion regular para Σ= {a, b} que acepte cadenas de a’s y b’s que contengan una cantidad impar de b’s*/
//LENGUAJE_6 = (a* b a* b a* )* a* b a*
LENGUAJE_6 = (a* (bb)* b a*)+ 

//secciones de codigo incrustados
%{
    //declaracion de una variable contador
	public int cont=1;
	
%}


%%
//separador de area

/* reglas lexicas */
<YYINITIAL> {
    {LENGUAJE_6}
		{
            System.out.println("Cadena "+cont+" Lenguaje 6 Lexema: "+yytext()
                + " Linea: "+(yyline+1)+" Columna: "+(yycolumn+1)+"\n");
            cont++;
        }
    
}

/* Por cualquier otro simbolo, en este caso no hace nada*/
[^] 
{ }