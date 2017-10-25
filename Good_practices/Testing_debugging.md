# Bugs

Bugs, o *características inesperadas*, son problemas que ocasionan que nuestros programas se ejecuten de maneras diferentes a las que esperábamos.

Muy rara vez las cosas funcionan la primera vez que se ejecutan.

Eric Grimson hace una analogía entre programar y preparar sopa:

    Estás preparando sopa en la cocina, pero los bichos caen y caen desde el techo. ¿Qué es lo que tienes que hacer para tener una buena sopa, libre de bichos?
    - Puedes revisar si hay bichos en la sopa,
    - mantener la tapa cerrada,
    - o limpiar la cocina.

## Revisar la sopa, o *testing/validación*

**Comparar** los pares (entrada, salida).

¿Cómo puedo **romper** el programa?

## Cerrar la tapa, o *programación defensiva*

### Escribir especificaciones para las funciones.

Una especificación acompaña a la definición de función. Y siempre va en la línea anterior o siguiente a ésta.

En la especificación se escribe a) lo que se espera recibir como argumentos, y b) lo que se promete devolver como salida.

```python
def union(set1, set2):
    """
    set1 y set2 son colecciones de objetos. Pueden estar vacíos.
    Ninguna colección contiene duplicados, pero es posible que
    ambos contengan un mismo valor.

    Se asume que los valores son del mismo tipo.

    Salida: Una sola colección con todos los elementos de ambas
    colecciones, sin ningún valor repetido.
    """
    # Hacer algo...
    return # otro algo
```

```javascript
/* 
    int dividendo, int divisor => int cociente

    dividendo puede ser cualquier número entero.
    divisor es cualquier número diferente de 0.

    Salida: Parte entera de la división
    (dividendo / divisor)
*/ 
function division_enteros(dividendo, divisor){

}
```

### Modularizar los programas

Un programa dividido en varias funciones, es mucho mejor que un programa de una sola función extensa.

No escribas una función larga. Pártela en funciones más pequeñas y *obvias*.

Los programas modularizados son mucho más fáciles de validar, ya que se puede evaluar un programa parte por parte.

David Malan sugiere esto:

> Describe tu función en un enunciado. Si la descripción es: "Hace esto, **y también** esto", sepárala en dos funciones. Sólo deben de hacer una cosa.

## Asegura las entradas

Las entradas tienen condiciones, descritas en la especificación de función.

Para asegurarte de que se cumplan esas condiciones, tienes que hacer **aserciones**.

Asegurarte que la función para división entera sólo acepte números enteros. Así, no podrás llamar la función con listas o cadenas.

## Limpiar la cocina, o *depurar*

**Estudiar** los eventos que conducen hacia un error.

**¿Por qué no funciona?**

¿Cómo puedo **arreglar** el programa?
