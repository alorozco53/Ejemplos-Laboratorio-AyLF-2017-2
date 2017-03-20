# Ejemplos de laboratorio

## Autómatas y Lenguajes Formales, 2017-2

### Lenguajes regulares

En la carpeta [`regular`](regular/) existe el archivo [`ejercicio_regex.sh`](regular/ejercicio_regex.sh), en donde
están varios ejemplos de casos de uso de los comandos `grep` y `sed`. La ejecución del archivo se puede lograr mediante
los siguientes pasos:

```bash
cd regular/
bash ejercicio_regex.sh <COMMAND> <FILE>
```

El argumento `<COMMAND>` es **obligatorio** y es con el que se le indicará al programa qué comando se desea probar.
Las opciones disponibles son las siguientes:

- _`ti`_ ejecuta `grep -E "([01][0-9]|2[0-3]):[0-5][0-9]"`; identifica horas en formato hh:mm, donde
  `00 <= hh <= 23` y `00 <= mm <= 59`.
- _`tup`_ ejecuta `sed -E "s/\(([^\(\)]*)\)/\(\1,0\)/g"`; identifica tuplas y les aumenta un cero como último
  argumento. Por ejemplo, si se le pasa la cadena `(1,2,3)`, el comando devolverá `(1,2,3,0)`.
- _`voc`_ ejecuta `grep -E "^(.*[aeiou].*)*$"`; identifica cualquier cadena con vocales en minúsculas.
- _`er`_ ejecuta `sed -E "s/\b(\w*)er\b/the more \1/g`; toma el prefijo de palabras que terminan en _er_ y lo usa
para sustituir por una frase que inicia con _the more_. Por ejemplo, cambia _larger_ por _the more large_.
- _`f1`_ ejecuta `sed -E "s/([aeiou])/\1f\1/g"`; transforma palabras (en español) a idioma de la _f_ sin manejar
	diptongos ni acentos.
- _`f2`_ ejecuta `sed -E "s/([aeiou])?([aeiou])/\1\2f\2/g""`; transforma palabras (en español) a idioma de la _f_ manejando
	diptongos pero acentos no.
- _`2l`_ ejecuta `pcregrep -M "(.*)\b(pre|psi)(.*)[\r\n](.*)[aeiou]{2,3}(.*)"`; identifica pares de líneas contiguas
  en donde la primera tiene una palabra empezando con _pre_ o _psi_ y la segunda tiene una palabra con un diptongo
  o triptongo. Se aconseja observar el comportamiento del comando con el archivo [ejemplo_lineas.txt](regular/ejemplo_lineas.txt).
  Los pares de líneas repetidas por el programa son 1-2, 7-8 y 11-12.

El argumento `<FILE>` es opcional y es una ruta hacia un archivo que se le puede pasar como argumento al comando indicado por
`<COMMAND>`. Si no se le especifica dicha ruta, el comportamiento del programa será exactamente el del comando ejecutado
correspondiente.

Se recomienda fuertemente visualizar cada expresión regular con la herramienta de [éste enlace][1]. Por ejemplo,
para la expresión regular `(.*)\b(pre|psi)(.*)[\r\n](.*)[aeiou]{2,3}(.*)`, la herramienta arroja un autómata como el
siguiente:

![autómata][2]

[1]: http://www.regexper.com
[2]: https://rawgithub.com/alorozco53/Ejemplos-Laboratorio-AyLF-2017-2/blob/master/img/dfa.svg
----
