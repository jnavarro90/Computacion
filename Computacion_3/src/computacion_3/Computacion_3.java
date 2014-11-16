package computacion_3;

import java.io.File;
import java.io.FileReader;
import java.io.IOException;
/**
 *
 * @author Javi Navarro
 */
public class Computacion_3 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws IOException {
        String path = "./src/Computacion_3/Lexer.flex";
        //generarLexer(path);
        Lexer analisis = new Lexer(new FileReader(args[0]));
        analisis.yylex();
    }
    public static void generarLexer(String path){
        File file = new File(path);
        jflex.Main.generate(file);
    }
}