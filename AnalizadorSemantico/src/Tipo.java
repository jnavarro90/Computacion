/**
 *
 * @author javinavarroalaman
 */
public class Tipo {
    String tipo;

    public Tipo(String tipo) {
        this.tipo = tipo.trim();
    }

    public String getTipo() {
        return tipo;
    }

    public boolean equals(Object obj) {
        String t;
        if (obj instanceof Tipo){
            Tipo cont = (Tipo)obj;
            t= cont.getTipo();
        }else{
            t = "";
        }
        return this.tipo.equals(t);
    }
    
}
