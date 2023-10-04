%Practica 1: Ajedrez: la reina

moverHorizontal(Pieza,F, C, F, NC):-
    pieza(Pieza),
    recto(Pieza),
    fila(F), columna(C), columna(NC),
    C \= NC.

moverVertical(Pieza,F, C, NF, C):-
    pieza(Pieza),
    recto(Pieza),
    fila(F), columna(C), fila(NF),
    F \= NF.

moverDiagonal(Pieza,F, C, NF, NC):-
    pieza(Pieza),
    diagonal(Pieza),
    fila(F), columna(C), fila(NF), columna(NC),
    numero(C,X), numero(NC, Y),
    abs(X-Y) =:= abs(F-NF).

moverEnL(Pieza, F, C, NF, NC):-
    pieza(Pieza),
    enL(Pieza),
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

moverRey(Pieza, F, C, NF, NC):-
    pieza(Pieza),
    rey(Pieza),
    fila(F), columna(C), fila(NF), columna(NC),
    numero(C,X), numero(NC, Y),
    casillaContinua(F, X, NF, Y).

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

pieza(torre).
pieza(reina).
pieza(arfil).
pieza(caballo).
pieza(peon).
pieza(rey).

recto(torre).
recto(reina).

diagonal(reina).
diagonal(arfil).

enL(caballo).
rey(rey).
