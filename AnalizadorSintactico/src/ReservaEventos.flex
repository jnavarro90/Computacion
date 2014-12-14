//* --------------------------Seccion codigo-usuario ------------------------*/ 

import java_cup.runtime.*;


/* -----------------Seccionde opciones y declaraciones -----------------*/ 
/*--OPCIONES --*/ 
/* Nombre de la clase generada para el analizadorlexico*/ 
%% 
%class analex 
%int
%8bit
%states TIPOS, EVENTOS
/* Indicar funcionamientoautonomo*/ 


/* Posibilitar acceso a la columna y fila actual de analisis*/ 

%line
%column

/* Habilitar la compatibilidad con el interfaz CUP para el generador sint�ctico */

%cup

/* MACROS */
LineTerminator = \r|\n|\r\n
WhiteSpace = [ \t\f]
Fecha = ([0-9]|"/")+
Hora = ([0-9]|":")+

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
/* ------------------------Seccion de reglaslexicas----------------------*/
<YYINITIAL> {

"lista_espacios"        {System.out.print("lista_espacios ");return symbol(sym.ESP);}
"{"                     {System.out.print("{ ");return symbol(sym.LLAIZQ);}
"}"                     {System.out.print(" }\n");return symbol(sym.LLADER);}
[a-zA-Z|ñ|Ñ|_|([0-9]*)]+        {System.out.print(" Cadena ");return symbol(sym.CAD);}
","                     {System.out.print(", ");return symbol(sym.COMA);}

{WhiteSpace}            { /* ignorar */ }
{LineTerminator}	{ yybegin(TIPOS); }

. {System.out.println("Token No Valido <" +yytext()+ ">linea: " + (yyline+1) + " columna: " + (yycolumn+1));}


}/* fin YYinitial */
<TIPOS>{

"lista_tipos"           {System.out.print("lista_tipos");return symbol(sym.TIP);}
"{"                     {System.out.print("{ ");return symbol(sym.LLAIZQ);}
"}"                     {System.out.print(" }\n");return symbol(sym.LLADER);}
[a-zA-Z|ñ|Ñ|_|([0-9]*)]+        {System.out.print(" Cadena ");return symbol(sym.CAD);}
","                     {System.out.print(", ");return symbol(sym.COMA);}


{WhiteSpace}            { /* ignorar */ }
{LineTerminator}	{ yybegin(EVENTOS); }

. {System.out.println("Token No Valido <" +yytext()+ ">linea: " + (yyline+1) + " columna: " + (yycolumn+1));}

}

<EVENTOS>{

"lista_eventos"           {System.out.print("lista_eventos");return symbol(sym.EVE);}
"{"                     {System.out.print("{ ");return symbol(sym.LLAIZQ);}
"}"                     {System.out.print(" }\n");return symbol(sym.LLADER);}
[a-zA-Z|ñ|Ñ|_|([0-9]*)]+       {System.out.print(" Cadena ");return symbol(sym.CAD);}
{Fecha}                {System.out.print(" Fecha ");return symbol(sym.FECHA);}
{Hora}                    {System.out.print(" Hora ");return symbol(sym.HORA);}
","                     {System.out.print(", ");return symbol(sym.COMA);}
";"                     {System.out.print("; ");return symbol(sym.PYC);}
"=="                    {System.out.print(" == ");return symbol(sym.SEPARADOR);}

{WhiteSpace}            { /* ignorar */ }
{LineTerminator}	{ /* ignorar*/ }

. {System.out.println("Token No Valido <" +yytext()+ ">linea: " + (yyline+1) + " columna: " + (yycolumn+1));}

}