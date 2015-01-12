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
Fecha = ([0-9]+"/"[0-9]+"/"[0-9]+)
Hora = ([0-9]+":"[0-9]+)

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

"lista_espacios"        {return symbol(sym.ESP);}
"{"                     {return symbol(sym.LLAIZQ);}
"}"                     {return symbol(sym.LLADER);}
[a-zA-Z|ñ|Ñ|_|([0-9]*)]+        {Datos.addEspacio(new String (new String (yytext())));return symbol(sym.CAD, new String (yytext()));}
","                     {return symbol(sym.COMA);}

{WhiteSpace}            { /* ignorar */ }
{LineTerminator}	{ yybegin(TIPOS); }

. {System.out.println("Token No Valido <" +yytext()+ ">linea: " + (yyline+1) + " columna: " + (yycolumn+1));}


}/* fin YYinitial */
<TIPOS>{

"lista_tipos"           {return symbol(sym.TIP);}
"{"                     {return symbol(sym.LLAIZQ);}
"}"                     {return symbol(sym.LLADER);}
[a-zA-Z|ñ|Ñ|_|([0-9]*)]+        {Datos.addTipo(new String (yytext()));return symbol(sym.CAD, new String (yytext()));}
","                     {return symbol(sym.COMA);}


{WhiteSpace}            { /* ignorar */ }
{LineTerminator}	{ yybegin(EVENTOS); }

. {System.out.println("Token No Valido <" +yytext()+ ">linea: " + (yyline+1) + " columna: " + (yycolumn+1));}

}

<EVENTOS>{

"lista_eventos"           {return symbol(sym.EVE);}
"{"                     {return symbol(sym.LLAIZQ);}
"}"                     {return symbol(sym.LLADER);}
[a-zA-Z|ñ|Ñ|_|([0-9]*)]+       {return symbol(sym.CAD, new String (yytext()));}
{Fecha}{WhiteSpace}{Hora}              {return symbol(sym.FYH, new String (yytext()));}
","                     {return symbol(sym.COMA);}
";"                     {return symbol(sym.PYC);}
"=="                    {return symbol(sym.SEPARADOR);}

{WhiteSpace}            { /* ignorar */ }
{LineTerminator}	{ /* ignorar*/ }

. {System.out.println("Token No Valido <" +yytext()+ ">linea: " + (yyline+1) + " columna: " + (yycolumn+1));}

}