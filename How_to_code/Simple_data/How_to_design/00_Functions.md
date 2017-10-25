# Métodos de diseño

## Contenido

- [Meta de aprendizaje](#metas-de-aprendizaje)

## Metas de aprendizaje
- Aprender a usar el método HtDF para operar en datos primitivos.
- Poder leer una función completa e identificar sus diferentes elementos. 
- Poder evaluar los diferentes elementos de una función para claridad, simplicidad, y consistencia mutua. 
- Ser capaz de evaluar el diseño entero para ver qué tan bien resuelve el problema dado. 

## Notas
Al principio, el método HtDF podrá parecer excesivo y abrumador. En muchos de los ejemplos presentados en este texto, pensarás que es posible escribir una solución mucho más rápida y corta. Y es cierto; este método aplicado a problemas pequeños, podría complicarlos. Te darás cuenta de cuán útil es cuando comiences a resolver problemas más complicados y difíciles.

## ¿Qué es HtDF? 
HtDF corresponde a las palabras How to Design a Function. Su propósito es **sistematizar el diseño de una función**, y asegurar que hemos escrito una función de gran calidad: hace lo que tiene que hacer, y ha sido bien comprobada.

Nos permitirá tomar un problema grande y difícil, dividirlo, y trabajar en él de una manera sistemática. Sin embargo, si seguimos este método de diseño para un problema pequeño, lo volverá complicado y difícil. Por ahora, tendremos que lidiar con eso, pero una vez que domines este método de diseño, lo usarás sólo cuando es necesario. 

### Firma, propósito y talón (?)
#### Firma
La firma de una función, enlista los parámetros que recibe, y la salida que produce. Por ejemplo: 

```Python
## Number -> Number
```

es la firma de una función que recibe un número, y regresa un número.

#### Propósito
Describe, brevemente -idealmente, una línea-, qué es lo que regresa la función, en términos de lo que recibe. Muchas veces es difícil hacerlo breve, pero al hacerlo, nos aseguramos de que estamos entendiendo qué es lo que hace la función. Por ejemplo:

```Python
## Regresa el doble del número recibido n
```

#### Talón
Es un fragmento de código que regularmente es eliminado cuando se termina de diseñar la función. El talón es una definición de función que:
- tiene el nombre correcto de la función, 
- tiene el número correcto de parámetros,
- produce un resultado 'prueba' del tipo correcto

```Python
def double (n):
    return 0
```

## Ejemplos o pruebas
Antes de diseñar una función, los ejemplos nos ayudan a entender qué es lo que la función debería hacer. Es importante tener múltiples ejemplos, y es recomendable que esos ejemplos cubran ciertos 'casos borde' -o edge cases-, para que sepamos cómo tratar esos valores.

Cuando hemos terminado de diseñar la función, los ejemplos pasan a ser pruebas. Ejecutamos nuestra función con una entrada cuya salida conocemos, la comparamos, y determinamos si la función hace o no lo que debería.

Un **ejemplo de ejemplos**: 

```Python
double(0)       # 0
double(3)       # 6
double(4.5)     # 9
```

Puedes implementar una comprobación automática, para evitar ingresar cada valor, y comparar cada resultado. Para hacerlo, consulta [esta lista]() y busca el lenguaje en el que acostumbras programar. Las instrucciones de uso están dentro de los códigos para cada lenguaje. Si tu lenguaje favorito no está en esa lista, puedes intentar crearlo tú y compartirlo después, o contactarme para que intente crearlo.

### Pruebas significativas
Ya sabemos cómo escribir y ejecutar una prueba para nuestra función. Pero también es importante decidir cuántas pruebas necesitamos. Y aquí es importante conocer el término **cobertura de código**. 

##### Cobertura de código
Es una medida usada para describir la porción del código fuente de un programa que es ejecutada cuando se utiliza un caso prueba.

----------
Hasta ahora, deberías tener un código como el siguiente:

```Python
## Number -> Number
## Regresa el doble del número recibido n

double(0)       # 0
double(3)       # 6
double(4.5)     # 9

def double (n):
    return 0
```

Es recomendable que, teniendo la firma, propósito, talón y ejemplos, se ejecute el programa. Así es posible asegurarse de que no hemos cometido ningún error de tipo de datos, número de argumentos, nombre de función, etc. 

> Cuanto antes detectemos un error, más fácil será corregirlo.

<!-- 

Agregar qué chuchas es la plantilla e inventario que ni yo lo entiendo

-->

#### Consejos
- En el instante en que un caso borde -frontera, límite, etc.- se te ocurra, **escríbelo** y comienza a hacer las modificaciones necesarias en el código que afecten el resultado de ese caso.
