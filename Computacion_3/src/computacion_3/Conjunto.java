package computacion_3;

/**
 *
 * @author javi
 */
public class Conjunto {
    private int numLinea;
    private int numColum;
    private String elemento;
    
    public Conjunto() {
        this.numLinea = -1;
        this.numColum = -1;
        this.elemento = "";
    }

    public String getElemento() {
        return elemento;
    }

    public int getNumColum() {
        return numColum;
    }

    public int getNumLinea() {
        return numLinea;
    }

    public void setElemento(String elemento) {
        this.elemento = elemento;
    }

    public void setNumColum(int numColum) {
        this.numColum = numColum;
    }

    public void setNumLinea(int numLinea) {
        this.numLinea = numLinea;
    }
}
