//* --------------------------Seccion codigo-usuario ------------------------*/ 

import java_cup.runtime.*;

%% 

/* -----------------Seccionde opciones y declaraciones -----------------*/ 
/*--OPCIONES --*/ 
/* Nombre de la clase generada para el analizadorlexico*/ 

%class analex 

/* Indicar funcionamientoautonomo*/ 


/* Posibilitar acceso a la columna y fila actual de analisis*/ 

%line

%column

/* Habilitar la compatibilidad con el interfaz CUP para el generador sintáctico */

%cup

/*--DECLARACIONES --*/ 

%{ /* Principio Declaraciones */

/* Crear un nuevo objeto java_cup.runtime.Symbol con informacion sobre
   el token actual sin valor */

 private Symbol symbol(int type) {
   return new Symbol(type,yyline,yycolumn); 
 }/* Fin symbol */


private Symbol symbol(int type,Object value){ 
	return new Symbol(type,yyline,yycolumn,value); 
} 

%} /* Fin Declaraciones */


%%
/* ------------------------Seccionde reglaslexicas----------------------*/
<YYINITIAL> {

[1-9][0-9]*|0 		{return symbol(sym.NUM, new Integer (yytext()));}

"+" 		{return symbol(sym.MAS);}
"-" 		{return symbol(sym.MENOS);}
";" 		{return symbol(sym.PYC);}
"(" 		{return symbol(sym.PARIZQ);}
")" 		{return symbol(sym.PARDER);}

\n|\r	{}

. {System.out.println("Token No Valido <" +yytext()+ ">linea: " + (yyline+1) + " columna: " + (yycolumn+1));}


}/* fin YYinitial */
