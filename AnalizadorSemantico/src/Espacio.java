/**
 *
 * @author javinavarroalaman
 */
public class Espacio {
    String espacio;

    public Espacio(String espacio) {
        this.espacio = espacio.trim();
    }

    public String getEspacio() {
        return espacio;
    }

    public boolean equals(Object obj) {
        String e;
        if (obj instanceof Espacio){
            Espacio cont = (Espacio)obj;
            e= cont.getEspacio();
        }else{
            e = "";
        }
        return this.espacio.equals(e);
    }
}
