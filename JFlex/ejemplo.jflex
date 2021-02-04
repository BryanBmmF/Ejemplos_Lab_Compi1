/*Seccion 1, codigo java de encabezado o del usuario*/

//separador de area
%%

/*Seccion , Directivas de configuracion jflex*/
//%public
%class Lexer
%standalone
%line
%column

/*Expresiones regulares*/
LENGUAJE_3 = (b* a b* a? b* a? b*)

//secciones de codigo incrustados
%{
  public int cont =1;
	
%}

//separador de area
%%


/* reglas lexicas */
<YYINITIAL> {
     {LENGUAJE_3}
     { System.out.println("cadena"+ cont + "aceptada: "+yytext() 
     +" Linea: "+(yyline+1)+" Columna: "+(yycolumn+1));
      cont ++;
       
      }

    
}

/* Por cualquier otro simbolo, en este caso no hace nada*/
[^] 
{ System.out.println("Caracter invalido");}

/* Desplegar un error */
