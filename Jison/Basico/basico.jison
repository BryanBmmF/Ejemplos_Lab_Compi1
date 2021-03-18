/*Ejemplo basico del manejo de Jison en NodeJs
    compilar con: jison basico.jison 
    ejecutar con: node basico.js entrada

    o ejecutar el bash.
    npm init -y : para iniciar un proyecto nodejs
*/

/* Definición Léxica */
%lex

/*Opciones de configuracion del analizador lexico jison
 Por ejemplo que sea insensible de mayusculas y minusculas */
%options case-insensitive 

/*separador de area*/
%% 
/* Espacios en blanco */
[ \r\t\n]           { /*ignorar*/}

/*Apartado de deficion de expresiones regulares y tokens  de retorno*/

//DECIMALES
[0-9]+("."[0-9]+)?\b    return 'DECIMAL'
//ENTEROS
[0-9]+\b                return 'ENTERO'
//CARACTERES DEFINIDOS
"["                     return 'CORIZQ'
"]"                     return 'CORDER'

/* Las últimas dos expresiones son para reconocer el fin de la entrada
 y caracteres no válidos.*/
<<EOF>>                 return 'EOF'
.                       return 'INVALID'


/* Fin de la Definición Léxica */
/lex

/* Asociación de operadores y precedencia si fuera necesario */

/*Definicion del simbolo inicial*/
%start ini

%{
	/*Codigo Javascript Incrustado*/
%}

/*separador de area*/
%% 


/* Apartir de aqui esta la Definición de la gramática.
Una ventaja de Jison al tener tanto el analizador lexico
como el sintactico en el mismo archivo es que se hace uso
de los tokens sin declararlos nuevamente en el parser como
terminales, y no es necesario declarar los no terminales */
ini : expresiones EOF 
;

expresiones : expresiones expresion 
	| expresion
	| error {
        console.log('Este es un error : ' + yytext +
        ', en la linea: ' + (this._$.first_line+1) +
        ', en la columna: ' + (this._$.first_column+1));
    }
;

expresion
	: CORIZQ numero CORDER {
		console.log('El valor de la expresión es: ' +$1 + $2 + $3);
	}
;

 /* Para sintetizar un valor asociado al no terminal
     de lado izquierdo de la producción hacemos uso 
     de la variable $$. 
     La variable $$ es propia de Jison, 
     los alias se defines como $Num_Alias.
     Para cada producción sintetizamos 
     el valor del terminal o no terminal aceptado. */ 

numero : ENTERO { 
        //retormanos el numero 
        $$ = Number($1);

    }
	| DECIMAL {
        $$ = Number($1);
    }
;