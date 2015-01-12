
import java.util.ArrayList;
/**
 *
 * @author javi
 */
public class Datos extends Thread{

    private static ArrayList<String> listaTipos;
    private static ArrayList<String> listaEspacios;
    public Datos() {
        listaTipos = new ArrayList<String>();
        listaEspacios = new ArrayList<String>();
    }
    public static boolean existeTipo(String tipo){
        return listaTipos.contains(tipo.trim());
    }
    public static boolean existeEspacio(String espacio){
        return listaEspacios.contains(espacio.trim());
    }
    public static void addTipo(String tipo){
        listaTipos.add(new String(tipo.trim()));
    }
    public static void addEspacio(String espacio){
        listaEspacios.add(new String(espacio.trim()));
    }
}