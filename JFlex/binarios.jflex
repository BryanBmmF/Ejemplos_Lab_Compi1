/*Seccion 1, codigo java de encabezado o del usuario*/


//separador de area
%%

/*Seccion , Directivas de configuracion jflex*/
%public
%class Lexer
%standalone
%line
%column

/*Expresion regular para un numero binario*/
BINARIO = (0|1(0|1)*)

//secciones de codigo incrustados
%{
    //declaracion de una variable contador
	public int cont=1;
	
%}


%%
//separador de area

/* reglas lexicas */
<YYINITIAL> {
    {BINARIO}
		{System.out.println("Binario "+cont+" Leido"); cont++; }
    
}

/* Por cualquier otro simbolo, en este caso no hace nada*/
[^] 
{ }