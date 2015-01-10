
import java.util.ArrayList;
/**
 *
 * @author javi
 */
public class Datos extends Thread{

    private static ArrayList<String> listaTipos;
    private static ArrayList<String> listaEventos;
    public Datos() {
        listaTipos = new ArrayList<String>();
        listaEventos = new ArrayList<String>();
    }
    public static boolean existeTipo(String tipo){
        return listaTipos.contains(tipo);
    }
    public static boolean existeEspacio(String espacio){
        return listaEventos.contains(espacio);
    }
    public static void addTipo(String tipo){
        listaTipos.add(tipo);
    }
    public static void addEspacio(String espacio){
        listaTipos.add(espacio);
    }
}
