package computacion_3;

import java.io.FileReader;
import java.io.IOException;

%%
%class Lexer
%public
%int
%line
%column
%state NUMEROS
%8bit

/*Declaración de variables*/
%{
public final int MAX_PALABRAS = 5;
public int contPal;
public int sumaNum;
public Conjunto[] palabras;
public Conjunto numero;
public int n;
%}

/*Código que se ejecuta al terminar la lectura del archivo*/
%eof{
    
    for(int i = 0; i < MAX_PALABRAS; i++){
        n = i+1;
        System.out.println("Palabra "+n+": "+palabras[i].getElemento()+" en la linea "+palabras[i].getNumLinea()+" y la columna "+palabras[i].getNumColum()+".\n");
    }
    System.out.println("La suma de todos los numeros encontrados es: "+sumaNum+".\n");
    System.out.println("El ultimo número ha sido el número "+numero.getElemento()+" en la linea "+numero.getNumLinea()+" y columna "+numero.getNumColum()+".\n");
%eof}

/*Código de inicialización*/
%init{
    palabras = new Conjunto[MAX_PALABRAS];
    for(int i = 0; i < MAX_PALABRAS; i++){
        palabras[i] = new Conjunto();
    }
    numero = new Conjunto();
    contPal = 0;
    sumaNum = 0;
    n = 0;
%init}

%%
<YYINITIAL>{
/* Reglas lexicas*/
([a-zA-Z|ñ|Ñ][a-zA-Z|ñ|Ñ])* { } /*Primero descartamos las palabras pares para que no interfieran en el análisis */
[a-zA-Z|ñ|Ñ]([a-zA-Z|ñ|Ñ][a-zA-Z|ñ|Ñ])*
{
    if(contPal != 5){
        palabras[contPal].setElemento(yytext());
        palabras[contPal].setNumLinea(yyline);
        palabras[contPal].setNumColum(yycolumn);
        contPal = contPal + 1;
    }else{
        yybegin(NUMEROS);
    }
}
\n|\r 	{}
.	{}
}
<NUMEROS>{
[0][0-9]* { } /* Primero descartamos los numeros que empiezan por 0 para que no interfieran en el análisis*/
[1-9][0-9]*
{
    sumaNum = sumaNum + Integer.parseInt(yytext());
    numero.setElemento(yytext());
    numero.setNumLinea(yyline);
    numero.setNumColum(yycolumn);
}
\n|\r 	{}
.	{}
}