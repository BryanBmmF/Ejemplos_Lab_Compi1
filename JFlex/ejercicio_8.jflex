/*Seccion 1, codigo java de encabezado o del usuario*/

//separador de area
%%

/*Seccion , Directivas de configuracion jflex*/
%public
%class Lexer
%standalone
%line
%column

/*Expresion regular para para Σ= {N: 0,1,2,3,...}  que acepte números de punto flotante con N número de decimales*/
LENGUAJE_8 = ([0][.][0-9]+|[1-9][0-9]*[.][0-9]+)

//secciones de codigo incrustados
%{
    //declaracion de una variable contador
	public int cont=1;
	
%}


%%
//separador de area

/* reglas lexicas */
<YYINITIAL> {
    {LENGUAJE_8}
		{
            System.out.println("Cadena "+cont+" Lenguaje 8 Lexema: "+yytext()
                + " Linea: "+(yyline+1)+" Columna: "+(yycolumn+1)+"\n");
            cont++;
        }
    
}

/* Por cualquier otro simbolo, en este caso no hace nada */
[^] 
{ }