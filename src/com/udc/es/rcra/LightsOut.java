package com.udc.es.rcra;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.PrintWriter;
import java.util.ArrayList;

/*
* Si queréis usar la misma representación que los ejemplos de clase (switches, misioneros y caníbales)
* tenéis que pensar en un fluente y en sus valores. Por ejemplo h(cell(X,Y),on) indica que el fluente
* cell(X,Y) está on. Y lo mismo para h(cell(X,Y),off). Así, los axiomas de inercia que os he dado os
* funcionan directamente.
* */
public class LightsOut {

    private static ArrayList<String> lecturaLineasArchivo(String [] args) {
        File archivo;
        FileReader fr = null;
        BufferedReader br;
        String rutaArchivo = "";
        ArrayList<String> lineasArchivo = new ArrayList<String>();

        if (args.length == 0)
            System.exit(0);
        if (args.length == 1) {
            rutaArchivo = args[0];
            try {
                // Apertura del fichero y creacion de BufferedReader para poder
                // hacer una lectura comoda (disponer del metodo readLine()).
                archivo = new File(rutaArchivo);
                fr = new FileReader(archivo);
                br = new BufferedReader(fr);

                // Lectura del fichero
                String linea;
                while ((linea = br.readLine()) != null){
                    lineasArchivo.add(linea);
                }

            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                // En el finally cerramos el fichero, para asegurarnos
                // que se cierra tanto si todo va bien como si salta
                // una excepcion.
                try {
                    if (null != fr) {
                        fr.close();
                    }
                } catch (Exception e2) {
                    e2.printStackTrace();
                }
            }
        }
        return lineasArchivo;
    }


    public static void main(String[] args) {
	// write your code here
    }
}
