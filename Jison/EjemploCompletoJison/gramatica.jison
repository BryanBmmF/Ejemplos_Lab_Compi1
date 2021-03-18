/* Descripcion: Parser para ejecutar operaciones matematicas simples. */
/*
Fuentes:
Doc Oficial:
    https://zaa.ch/jison/docs/
    https://github.com/zaach/jison
*/
/* lexical grammar */
%lex
%%

\s+                   /* skip whitespace */

/*Expresiones regulares y caracteres especiales de reconocimiento*/
[0-9]+("."[0-9]+)?\b  return 'NUMBER'
"*"                   return '*'
"/"                   return '/'
"-"                   return '-'
"+"                   return '+'
"^"                   return '^'
"!"                   return '!'
"("                   return '('
")"                   return ')'

<<EOF>>               return 'EOF'
.                     return 'INVALID'

/lex

/* Asociación de operadores y precedencia */
%left '+' '-'
%left '*' '/'
%left '^'
%right '!'
%right '%'

%start ini

%{
	/*Codigo Javascript Incrustado*/
    let contador = 1;
    var arreglo = []; 
%}

%% 

/* Definición de la gramática */

ini : expresiones EOF {
        /*Desplegamos los datos recolectados por el arreglo*/
        //$1.forEach(element => console.log(element));
        $1.forEach(function(exp) {
            console.log('El valor de la expresión '+contador+ ' es: ' +exp);
            contador++;
        });

        /* */
	    $$ = $1;
    }
;

expresiones : expresiones exp  {
        /*Agregamos una nueva expresion al arreglo*/
        $1.push($2);
        $$ = $1;
    }
	| exp {
        /*agregamos primera expresion al arreglo*/
        arreglo.push($1);
        $$ = arreglo;
    }
	| error {
        console.log('Este es un error : ' + yytext +
        ', en la linea: ' + (this._$.first_line+1) +
        ', en la columna: ' + (this._$.first_column+1));
    }
;

exp : exp '+' exp
        {$$ = $1+$3;}
    | exp '-' exp
        {$$ = $1-$3;}
    | exp '*' exp
        {$$ = $1*$3;}
    | exp '/' exp
        {$$ = $1/$3;}
    | exp '^' exp
        {$$ = Math.pow($1, $3);}
    | exp '!'
        {{
          /*Funcion definida para calcular un factorial*/
          $$ = (function fact (n) { return n==0 ? 1 : fact(n-1) * n })($1);
        }}
    | '(' exp ')'
        {$$ = $2;}
    | NUMBER
        {$$ = Number(yytext);}
;