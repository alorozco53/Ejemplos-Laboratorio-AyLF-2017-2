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

- _`ti`_ ejecuta `grep -E "([01][0-9]|2[0-3]):[0-5][0-9]"`; comando que identifica horas en formato hh:mm, donde
  `0 <= hh <= 23`.
- _`tup`_ ejecuta `sed -E "s/\(([^\(\)]*)\)/\(\1,0\)/g"`; comando que identifica horas en formato hh:mm, donde
  `0 <= hh <= 23`.
- _`voc`_ ejecuta `grep -E "^(.*[aeiou].*)*$"`; comando que identifica horas en formato hh:mm, donde
  `0 <= hh <= 23`.
- _`er`_ ejecuta `sed -E "s/\b(\w*)er\b/the more \1/g`; comando que identifica horas en formato hh:mm, donde
  `0 <= hh <= 23`.
- _`f1`_ ejecuta `sed -E "s/([aeiou])/\1f\1/g"`; comando que identifica horas en formato hh:mm, donde
  `0 <= hh <= 23`.



----
