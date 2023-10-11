% Practica 1: Ajedrez

moverHorizontal(Pieza, Color,F, C, F, NC):-
    tipopieza(Pieza, Color),
    recto(Pieza),
    color(Color),
    fila(F), columna(C), columna(NC),
    C \= NC.

moverVertical(Pieza, Color,F, C, NF, C):-
    tipopieza(Pieza, Color),
    recto(Pieza),
    color(Color),
    fila(F), columna(C), fila(NF),
    F \= NF.

moverDiagonal(Pieza, Color,F, C, NF, NC):-
    tipopieza(Pieza, Color),
    diagonal(Pieza),
    color(Color),
    fila(F), columna(C), fila(NF), columna(NC),
    numero(C,X), numero(NC, Y),
    abs(X-Y) =:= abs(F-NF).

moverEnL(Pieza, Color, F, C, NF, NC):-
    tipopieza(Pieza, Color),
    enL(Pieza),
    color(Color),
    fila(F), columna(C), fila(NF), columna(NC),
    numero(C,X), numero(NC, Y),
    ((abs(X-Y) =:= 2, abs(F-NF) =:= 1);
     (abs(X-Y) =:= 1, abs(F-NF) =:= 2)).

casillaContinua(F, C, NF, C):-
    abs(F-NF)=:=1.

casillaContinua(F, C, NF, NC):-
    abs(C-NC) =:= 1,abs(F-NF) =:= 1.

casillaContinua(F, C, F, NC):-
    abs(C-NC)=:=1.

moverRey(Pieza, Color, F, C, NF, NC):-
    tipopieza(Pieza, Color),
    rey(Pieza),
    color(Color),
    fila(F), columna(C), fila(NF), columna(NC),
    numero(C,X), numero(NC, Y),
    casillaContinua(F, X, NF, Y).

moverPeon(Pieza, Color,F,C,NF, C):-
    tipopieza(Pieza, Color),
    peon(Pieza),
    color(Color),
    fila(F), columna(C), fila(NF),
    NF=:=F+1.

moverPeon(Pieza, Color, F, C, NF, NC):-
    tipopieza(Pieza, Color),
    peon(Pieza),
    color(Color),
    hayPieza(NF, NC, Z),
    comerPieza(Color, Z),
    fila(F), columna(C), fila(NF),columna(NC),
    numero(C,X), numero(NC, Y),
    NF=:=F+1,
    abs(X-Y)=:=1.

% Parametros: tablero, Fila, Columna, Color.
hayPieza([(X)|R], F, C, Color):-
.

%Facts:

fila(1).
fila(2).
fila(3).
fila(4).
fila(5).
fila(6).
fila(7).
fila(8).

columna(a).
columna(b).
columna(c).
columna(d).
columna(e).
columna(f).
columna(g).
columna(h).

numero(a, 1).
numero(b, 2).
numero(c, 3).
numero(d, 4).
numero(e, 5).
numero(f, 6).
numero(g, 7).
numero(h, 8).

tipopieza(torre, negro).
tipopieza(reina, negro).
tipopieza(arfil, negro).
tipopieza(caballo, negro).
tipopieza(peon, negro).
tipopieza(rey, negro).

tipopieza(torre, blanco).
tipopieza(reina, blanco).
tipopieza(arfil, blanco).
tipopieza(caballo, blanco).
tipopieza(peon, blanco).
tipopieza(rey, blanco).

recto(torre).
recto(reina).

diagonal(reina).
diagonal(arfil).

enL(caballo).
rey(rey).
peon(peon).

color(blanco).
color(negro).

colorContrario(blanco, negro).
colorContrario(negro, blanco).
