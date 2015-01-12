
import java.util.ArrayList;
/**
 *
 * @author javi
 */
public class Datos extends Thread{

    private static ArrayList<Tipo> listaTipos;
    private static ArrayList<Espacio> listaEspacios;
    
    public Datos() {
        listaTipos = new ArrayList<Tipo>();
        listaEspacios = new ArrayList<Espacio>();
    }
    public static boolean existeTipo(String tipo){
        Tipo t = new Tipo(tipo); 
        return listaTipos.contains(t);
    }
    public static boolean existeEspacio(String espacio){
        Espacio e = new Espacio(espacio);
        return listaEspacios.contains(e);
    }
    public static void addTipo(String tipo){
        listaTipos.add(new Tipo(tipo));

    }
    public static void addEspacio(String espacio){
        listaEspacios.add(new  Espacio(espacio));

    }
}