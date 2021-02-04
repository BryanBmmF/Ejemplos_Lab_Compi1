/*Seccion 1, codigo java de encabezado o del usuario*/

//separador de area
%%

/*Seccion , Directivas de configuracion jflex*/
%public
%class Lexer
%standalone
%line
%column

/*Expresion regular para las cadenas de Σ= {a, b} con no más de 3 a’s*/
LENGUAJE_3 = (b* a b* a? b* a? b*)

//secciones de codigo incrustados
%{
    //declaracion de una variable contador
	public int cont=1;
	
%}


%%
//separador de area

/* reglas lexicas */
<YYINITIAL> {
    {LENGUAJE_3}
		{
            System.out.println("Cadena "+cont+" Lenguaje 3 Lexema: "+yytext()
                +" Linea: "+(yyline+1)+" Columna: "+(yycolumn+1)+"\n");
            cont++;
        }
    
}

/* Por cualquier otro simbolo, en este caso no hace nada*/
[^] 
{ }