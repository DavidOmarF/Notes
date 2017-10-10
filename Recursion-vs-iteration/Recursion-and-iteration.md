# Iteración vs recursión

Cuando estamos aprendiendo a programar, invariablemente nos topamos con un concepto llamado **estructuras de control**.

Dentro de éstas, existen las condiciones y **los ciclos**.

## Ciclos

Los ciclos son sentencias que nos permiten repetir un fragmento de código varias veces ¡Pero tienen que ser finitas!

La manera en la que implementamos los ciclos varía dependiendo del paradigma (específicamente hablo de la programación funcional), pero lo más usual, es utilizar funciones iterativas: `while` y `for`

```python
while (mareado == False):
    ## Échate una pirueta
```

El fragmento `while` anterior, básicamente lo podemos leer como "mientras que no estés mareado, **échate una pirueta**", o "échate piruetas hasta que te marees".

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

