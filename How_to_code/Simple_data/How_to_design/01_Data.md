# How To Design Data

Junto al diseño de funciones, el diseño de datos es igual de importante.

Para esto, primero quiero proponer un ejemplo de función de uno de mis anteriores proyectos.

La función sigue el criterio de diseño expresado en HTD Functions.

```javascript
// Number -> Matrix -> String -> Number
// Returns the index of the final state of a string using delta as transition matrix

function stringValidation(currentState, delta, string) {
  // Head of the string. The first character
  var head = string[0];

  // Tail of the string. Everything but the first character
  var tail = string.slice(1);

  // Edge case: there's only one element in the string
  if (tail == []) {
    return delta[currentState][head];
  }

  // Edge case: Value at that state, with that 'move' is invalid
  if (delta[currentState][head] == -1) {
    return -1;
  } else 
  
  // Recursive step
  {
    // Get the next state, and send only the tail of the string
    return stringValidation(delta[currentState][head], tail);
  }
}
```