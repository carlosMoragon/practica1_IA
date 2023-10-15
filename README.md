# practica1_IA

### Primera parte de la Práctica:

1. Elegir el problema a resolver:
   * **Definir las reglas del Ajedrez**.

2. Definición de las reglas:

    + Las posiciones del tablero se especifican primero la fila que va del 1 al 8, y después la columna que va de la a a la h.
    + Cada pieza se mueve de forma diferente:
  
      * **La Reina** se puede mover:
          - **Horizontalmente**, **Verticalmente** y **Diagonalmente**.
          - Sin limitación de casillas.
      * **La Torre** se puede mover:
          - **Horizontalmente** y **Verticalment**.
          - Sin limitación de casillas.
      * **El Arfil** se puede mover:
          - **Diagonalmente**.
          - Sin limitación de casillas
      * **El Caballo** se puede mover:
          - **En forma de L**, que se puede descomponer en:
            - +/- 1 filas y +/- 2 columnas.
            - +/- 2 filas y +/- 1 columnas.
      * **El Rey** se puede mover:
          - **Horizontalmente**, **Verticalmente** y **Diagonalmente**.
          - Con la limitación de **1** casilla.
      * **El Peón** se puede mover:
          - **Vericalmente**.
          - Con la limitación de **1** casilla.
          - **Diagonalmente** siempre que vaya a comer una ficha del otro color.
          - Con la limitación de **1** casilla.
       
    + Se juega entre **2 jugadores**, cada uno con fichas de distinto color (**Blancas** o **Negras**).
    + **Empezará jugando las blancas** y se irá cambiando de turno trás cada movimiento.
    + El número de **fichas por jugador** es el siguiente:
      * **1 Reina**.
      * **2 Torres**.
      * **2 Arfiles**.
      * **2 Caballos**.
      * **1 Rey**.
      * **8 Peones**.
          
