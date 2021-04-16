Documento elaborado en conxunto por:

    · Daniel Olañeta Fariña
    · Ángel Álvarez Rey



Esta práctica foi elaborada en java (versión 11.0.9).


INSTRUCIÓNS DE EXECUCIÓN:


Para executar esta práctica necesitamos ter de antemán un directorio "ex/" que conteña as entradas do encoder. Se xa temos esta carpeta situarémonos
no directorio "src/" e unha vez nel executaremos o comando:

	· javac ./com/udc/es/rcra/Encoder.java

Unha vez compilado o Encoder podemos executalo co comando:

	· java -cp . com.udc.es.rcra.Encoder "ex/arquivo.txt"

Finalmente xa podemos executar os arquivos con telingo: 

    · telingo com/udc/es/rcra/LightsOutParallelTogAdyaMinimize.lp "ex/arquivo.lp"

        - LightsOut.lp --> resolución sen toggles paralelos (secuencial)
        - LightsOutParallel.lp --> resolución con toggles paralelos NON adyacentes
        - LightsOutParallelMinimize --> resolución con toggles paralelos NON adyacentes buscando o mínimo de toggles
        - LightsOutParallelTogAdya.lp --> resolución con toggles paralelos adyacentes. 
        - LightsOutParallelTogAdyaMinimize.lp --> resolución con toggles paralelos adyacentes buscando o mínimo de toggles. 

    *AVISO* --> para problemas de tamaño maior ou igual a 10x10 temos que usar toggles adyacentes.

Se queremos comprobar a solución proporcionada por telingo debemos copiar as liñas que que conteñan os "o(toggle(X,Y))"
no arquivo "com/udc/es/rcra/solProba.txt" para despois, empregando o showlights.py modificado por nós, executar:

    · python com/udc/es/rcra/showlights.py "ex/arquivo.txt" com/udc/es/rcra/solProba.txt 0

**EN CASO DE ERRORES AO COMPILAR/EXECUTAR A CLASE DE JAVA** (por exemplo debido a unha incompatibilidade na versión, etc)
temos creado un arquivo jar en "/src" chamado Encoder.jar. Este arquivo é simplemente o nóso encoder convertido a jar. 

    · java -jar Encoder.jar "ex/arquivo.txt" 