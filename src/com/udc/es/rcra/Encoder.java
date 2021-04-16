package com.udc.es.rcra;

import java.io.*;
import java.util.ArrayList;

/*** AUTORES ***/
/** Angel Alvarez Rey Login UDC: angel.alvarez.rey **/
/** Daniel Olañeta Fariña Login UDC: daniel.olaneta.farina **/
/** GitHub: https://github.com/Lorudarkuh (Angel Alvarez Rey)**/
/** GitHub: https://github.com/sogekingdabest (Daniel Olañeta Fariña)**/
/*** ***/

public class Encoder {

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

    public static void crearArchivoBD(ArrayList<String> lineasArchivo, PrintWriter writer) {
        String[] linea;
        int j = 0;
        int n = Integer.parseInt(lineasArchivo.get(0));
        writer.println("#const n= "+n+".");
        writer.println("cell(0.."+(n-1)+",0.."+(n-1)+").");
        for(int i = 1; i < lineasArchivo.size(); i++) {
            linea = lineasArchivo.get(i).split("");
            while(j < Integer.parseInt(lineasArchivo.get(0))){
                writer.println("h(cell("+(i-1)+","+j+"), "+((linea[j].equals("1"))? "on" : "off")+").");
                j++;
            }
            j=0;
        }
    }

    public static void main(String[] args) {
        try {
            ArrayList<String> lineasArchivo;
            PrintWriter writer = new PrintWriter(args[0].split("\\.")[0]+".lp", "UTF-8");
            lineasArchivo = lecturaLineasArchivo(args);
            crearArchivoBD(lineasArchivo, writer);

            writer.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
    }
}
