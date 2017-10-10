# Iteración vs recursión

Cuando estamos aprendiendo a programar, invariablemente nos topamos con un concepto llamado **estructuras de control**.

Dentro de éstas, existen las condiciones y **los ciclos**.

## Ciclos

Los ciclos son sentencias que nos permiten repetir un fragmento de código varias veces ¡Pero tienen que ser finitas!

La manera en la que implementamos los ciclos varía dependiendo del paradigma (específicamente hablo de la programación funcional), pero lo más usual, es utilizar funciones iterativas: `while` y `for`

```python
while (not mareado):
    ## Échate una pirueta
```

El fragmento `while` anterior, básicamente lo podemos leer como "mientras que no estés mareado, **échate una pirueta**", o mejor aún, "échate piruetas hasta que te marees".

```python
for (i in range(10)):
    ## Báilame la pelusa
```

El fragmento `for` anterior lo desglosaré más poco a poco:

1. Para cada i que existe en el rango de números de 0 a 9, báilame la pelusa.
1. Para cada i de 0 a 9, báilame la pelusa.
1. Báilame la pelusa 10 veces.

Yo prefiero utilizar tendencias for. Me resulta más *natural*. Pero en realidad, cualquier ciclo `while`, puede implementarse con `for`, y viceversa.

Sin embargo, existe otro concepto que puede conseguir lo mismo que los ciclos: la recursión.

## Recursión

Recurrencia, recursión, recursividad, llámalo como quieras, pero consisten en lo mismo: una función que se llama a sí misma durante su ejecución.

Tal vez pueda parecer contra-intuitivo, ya que no deberíamos definir algo, utilizando esa misma definición.

Sin embargo, sirve.

Básicamente, consiste en saber qué hacer con:

1. -al menos- un caso base
1. todo lo demás

Por ejemplo:

    – Oye, ¿sabes cómo puedo bailar la pelusa 10 veces?
    – Claro, es fácil, sólo baila la pelusa. Y luego vuélvela a bailar 9 veces...
    – ¿Y cómo hago para bailarla 9 veces?
    – Pues báilala una vez. Y luego 8 veces más.
    – [...]
    – ¿Y cómo bailo la pelusa una vez?
    – Fácil: "Pelusa por aquí, pelusa por allá [...]"

En el anterior ejemplo, podemos identificar rápidamente qué es *todo lo demás*, y qué es el *caso base*.

Si quiero bailar la pelusa k veces:

- Todo lo demás: Bailar la pelusa una vez, y luego bailarla (k - 1) veces
- Caso base: "Pelusa por aquí, pelusa por allá [...]"

Y, traduciéndolo a código:

```python
def bailarPelusa(n):
    if n == 1:
        return "Pelusa por aquí, pelusa por allá. "
    else:
         return bailarPelusa(1) + bailarPelusa(n-1)
```

Ahora, podemos llamar a la función

```python
bailarPelusa(3)
## 'Pelusa por aquí, pelusa por allá. Pelusa por aquí, pelusa por allá. Pelusa por aquí, pelusa por allá. '
```

Sé que bailar la pelusa puede convertirte en el alma de la fiesta, pero es momento de pasar a ejemplos que no impliquen levantarnos del asiento.

Definamos, por ejemplo, una función que encuentre el valor máximo en un arreglo o lista. Muchos lenguajes ya cuentan con métodos para hacerlo, pero que nos de igual, ¿no?

Bien, ¿cuáles son nuestros casos base?

- **Lista vacía** ¡Una lista vacía no tiene máximos!

- **Lista con un elemento** El máximo entre 'a' y... bueno... nada, es 'a'.

¿y qué deberíamos hacer con todo lo demás?

- Comparar el primer valor de la lista, y el máximo de **tooooodo** el resto de la lista, para regresar el mayor de los dos.

Y es más, ni siquiera utilizaré la función integrada para obtener el mayor de dos números. También la definiremos.

```python
def max2Nums(a,b):
    return a if a>b else b
```

Bueno, eso fue fácil. Eso es el operador ternario.

Ahora, la función que nos interesa:

```python
def maxInList(myList):
    ## Agreguemos el primer caso base: Lista vacía (o de longitud 'cero')
    if len(myList) == 0:
        ## Alertemos sobre un error: una lista vacía no puede tener un valor máximo
        raise Exception('¡Esto es una lista vacía! ¿qué rayos pretendes?')
    ## Agreguemos el segundo caso base: Un elemento en lista
    elif len(myList) == 1:
        ## Regresemos el primer valor en la lista (el único)
        return myList[0]
    else:
        ## Comparemos el primer valor de la lista, y el valor máximo de 
            ## "el resto" de la lista
        return max2Nums(myList[0], maxInList(myList[1:]))
```

Y listo, tenemos nuestra propia implementación llamada `maxInList`.

Si la última notación te causa conflicto, no hay problema, lo que hace es *cortar* la lista, a partir del primer índice, y hasta el segundo índice menos uno. Funciona algo así:

```python
listita = ['manzana', 'fresa', 'mango', 'durazno', 'aguacate']
listita[1:]
## ['fresa', 'mango', 'durazno', 'aguacate']
    ## Obtiene listita desde el ínice 1, hasta el último
listita[0:2]
## ['manzana', 'fresa']
    ## Obtiene listita desde el índice 0, hasta el 2 - 1
```
