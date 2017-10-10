# Iteración vs recursión

Cuando estamos aprendiendo a programar, invariablemente nos topamos con un concepto llamado **estructuras de control**.

Estas estructuras nos permiten controlar el flujo del programa. Existen las condiciones y **los ciclos**.

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

Durante algo de tiempo, antes de ser introducidos a las funciones, seguramente los ciclos eran la única herramienta a mano para repetir bloques de código. Sin embargo, después conocemos **la recursión**.

## Recursión

Recurrencia, recursión, recursividad, llámalo como quieras, pero consisten en lo mismo: una función que se llama a sí misma durante su ejecución.

Tal vez pueda parecer contra-intuitivo, ya que no deberíamos definir algo, utilizando esa misma definición.

Sin embargo, sirve.

Básicamente, consiste en saber qué hacer con:

- **Casos base**: Son casos especials con lo que tiene que lidiar nuestra función. Casos 'límite'. Los casos más pequeños. Los más sencillos. Los 'especiales'.

- **Resto de casos**

En código, se ve más o menos así:

```python
def recursion(k):
    ## Tratamiento de los casos base (k == 0, por ejemplo)
    if k == 0:
        return "Wow"
    ## Tratamiento del resto de casos. ¿Qué hacemos cuando no hemos
    ## alcanzado el valor de uno de los casos base?
    else:
        return recursion(k-1)
```

**Siempre** debe de existir al menos un caso base. Sin él, las llamadas recursivas serían infinitas.

Veamos un ejemplo:

    – Oye, ¿sabes cómo puedo bailar la pelusa 10 veces?
    – Claro, es fácil, sólo baila la pelusa. Y luego vuélvela a bailar 9 veces...
    – ¿Y cómo hago para bailarla 9 veces?
    – Pues báilala una sola vez. Y luego 8 veces más.
    – [...]
    – ¿Y cómo bailo la pelusa una vez?
    – Fácil: "Pelusa por aquí, pelusa por allá..."

En el anterior ejemplo, podemos identificar rápidamente **el caso base**, y **el resto de casos**.

- **Caso base**
    - ¿cuándo alcanzamos el caso base?
        - Cuando el número de veces que queremos bailar la pelusa, sólo es una.
    - ¿qué hacemos cuando alcanzamos el caso base?
        - "Pelusa por aquí, pelusa por allá..."

- **Casos cualquiera**
    - ¿qué es un caso cualquiera?
        - Querer bailar la pelusa **k** (número arbitrario) veces.
    - ¿qué hacemos en un caso cualquiera?
        - Bailamos la pelusa una vez. Y luego **(k-1)** veces

Parece que ya tenemos algo bueno con lo que trabajar. Intenemos programarlo:

```python
def bailarPelusa(k):
    ## Caso base en donde k = 1
    if k == 1:
        return "Pelusa por aquí, pelusa por allá. "
    ## Caso cualquiera
    else:
         return bailarPelusa(1) + bailarPelusa(k-1)
```

Ahora, podemos llamar a la función

```python
bailarPelusa(3)
## 'Pelusa por aquí, pelusa por allá. Pelusa por aquí, pelusa por allá. Pelusa por aquí, pelusa por allá. '
```
Bien, sé que bailar la pelusa puede convertirte en el alma de la fiesta, pero es momento de pasar a ejemplos que no impliquen levantarnos del asiento.

----------------------

Tratemos de implementar una función para multiplicar dos números positivos sin utilizar los operadores de producto.

Para esto, primero recordemos que **a * b** quiere decir **a** veces **b**. Entonces, sumar **a** un número **b** de veces, resultaría en **a * b**.

Por ejemplo, 3 * 4 es lo mismo que sumar 3 cuatro veces, o sumar 4 tres veces.

```python
3 * 4 == 3 + 3 + 3 + 3 == 4 + 4 + 4
```

Podemos describir nuestros casos base, y después nuestros casos cualquiera, o viceversa. Yo comenzaré con el caso cualquiera:

- **Caso cualquiera**
    - Sumar **a** al resultado de multiplicar **a * (b-1)**
- **Casos base**
    - Si **b** es igual a 0, sólo regresamos **0**, ya que **a * 0 = 0**

Y ahora, tratemos de traducirlo a código:

```python
def mult(a, b):
    if b == 0:
        return 0
    else: 
        return a + mult(a, b-1)
```

¡Y es todo! Ya cubrimos el caso base, y el caso cualquiera. Podemos intentar multiplicar dos números positivos con esa función y siempre llegaremos al resultado correcto.

Ahora, te reto a modificar la función de multiplicación para que también acepte números negativos.

-------------------

Movámonos a otro ejemplo: una función que encuentre el valor máximo en un arreglo o lista. Muchos lenguajes ya cuentan con métodos para hacerlo, pero que nos dé igual, ¿no?

- **Casos base**
    - **Lista vacía**
        - ¡Una lista vacía no tiene máximos!
    - **Lista con un elemento**
        - El máximo entre 'a' y... bueno... nada, es 'a'.

- **Caso cualquiera**
    - Aquí se me ocurren dos acercamientos:
        - **Lineal**: El máximo entre
            1. El primer valor de la lista
            2. El valor máximo del resto de la lista
        - **Binario**: El máximo entre
            1. El máximo de la primera mitad de la lista
            2. El máximo de la segunda mitad de la lista

Para cualquiera de los dos acercamientos, necesito una función *auxiliar* que compare **dos** números y devuelva el mayor de ellos. Podemos utilizar una función integrada en el lenguaje -la mayoría la tiene-, pero prefiero que definamos una propia:

```python
def max2Nums(a,b):
    return a if a>b else b
```

#### Algoritmo lineal

Recordemos que los casos base serán los mismos para ambos acercamientos. Sólo tenemos que cambiar el caso recursivo.

```python
def maxInListLinear(myList):

    ### Casos Base ###

    ## Agreguemos el primer caso base: Lista vacía (o de longitud 'cero')
    if len(myList) == 0:
        ## Alertemos sobre un error: una lista vacía no puede tener un valor máximo
        raise Exception('¡Esto es una lista vacía! ¿qué rayos pretendes?')

    ## Agreguemos el segundo caso base: Un elemento en lista
    elif len(myList) == 1:
        ## Regresemos el primer valor en la lista (el único)
        return myList[0]

    ### Caso recursivo ###

    else:
        ## Comparemos el primer valor de la lista, y el valor máximo de
        ## "el resto" de la lista
        return max2Nums(myList[0], maxInListLinear(myList[1:]))
```

#### Algoritmo binario

```python
def maxInListBinary(myList):

    ### Casos Base ###

    ## Agreguemos el primer caso base: Lista vacía (o de longitud 'cero')
    if len(myList) == 0:
        ## Alertemos sobre un error: una lista vacía no puede tener un valor máximo
        raise Exception('¡Esto es una lista vacía! ¿qué rayos pretendes?')

    ## Agreguemos el segundo caso base: Un elemento en lista
    elif len(myList) == 1:
        ## Regresemos el primer valor en la lista (el único)
        return myList[0]


    ### Caso recursivo ###
    else:
        ## Comparemos el máximo de la primera mitad de la lista
        ## con el máximo de la segunda mitad de la lista

        # Encontramos el índice de la mitad, utilizando la longitud
        half = len(myList) // 2     ## El operador // forza al resultado a ser un entero

        # Llamamos a la función con la lista dividida por ese índice
        return max2Nums(maxInListBinary(myList[:half]), maxInListBinary(myList[half:]))
```

Y listo, ya tenemos dos posibles implementaciones.

Podemos ahora, verificar que regresan el valor correcto cada vez que son invocadas.
