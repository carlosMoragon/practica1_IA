%Practica 1: Ajedrez

:- dynamic tablero/1.
:- dynamic turno/1.

% Este es como el metodo main()
inicializar():-
    retract(turno(_)),
    retractall(tablero(_)),
    assert(turno(blanco)),
    Tablero=[
        [torre, caballo, arfil, rey, reina, arfil, caballo, torre],
        [peon, peon, peon, peon, peon, peon, peon, peon],
        [vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio],
        [vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio],
        [vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio],
        [vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio],
        [peon, peon, peon, peon, peon, peon, peon, peon],
        [torre, caballo, arfil, reina, rey, arfil, caballo, torre]
    ],
    assert(tablero(Tablero)),
    printTablero(tablero(Tablero)),
    jugar(tablero(Tablero)).

jugar(Tablero):-
    printTablero(Tablero),
    write("ESCRIBA LA COLUMNA DE LA PIEZA QUE QUIERE MOVER"),
    nl,
    read(_X),
    nl,
    write("ESCRIBA LA FILA DE LA PIEZA QUE QUIERE MOVER"),
    nl,
    read(_Y),
    nl,
    % buscarPieza(X, Y, Pieza, Color),
    write("ESCRIBA LA COLUMNA A LA QUE QUIERE MOVER LA PIEZA"),
    nl,
    read(_W),
    nl,
    write("ESCRIBA LA FILA A LA QUE QUIERE MOVER LA PIEZA"),
    nl,
    read(_Z),
    nl,
   % moverPieza(Tablero, Pieza, Color, X, Y, W, Z),
    retract(turno(_)),
    assert(turno(negro)),
    jugar(Tablero).

printTablero([]).
printTablero([X|R]):-
    printLinea(X),
    nl,
    printTablero(R).

printLinea([]).
printLinea([X|R]):-
    write(X),
    write(' '),
    printLinea(R).

% Comprobar que se puede mover esa ficha a esa posici�n.
moverPieza(Tablero, Pieza, Color, F, C, NF, NC):-
    color(Color),
    turno==Color,
    fila(F), columna(C), fila(NF), columna(NC),
    mover(Pieza, F, C, NF, NC),
    cambiarFicha(tablero(Tablero),Pieza, Color, F, C, NF, NC).

% cambiarFichar(Tablero, Pieza, Color, F, C, NF, NC):-

% Mover en Horizontal
mover(Pieza, F, C, F, NC):-
    recto(Pieza),
    C \= NC.

% Mover en Vertical
mover(Pieza,F, C, NF, C):-
    recto(Pieza),
    F \= NF.

% Mover en diagonal
mover(Pieza,F, C, NF, NC):-
    diagonal(Pieza),
    numero(C,X), numero(NC, Y),
    abs(X-Y) =:= abs(F-NF).

mover(Pieza, F, C, NF, NC):-
    enL(Pieza),
    numero(C,X), numero(NC, Y),
    ((abs(X-Y) =:= 2, abs(F-NF) =:= 1);
     (abs(X-Y) =:= 1, abs(F-NF) =:= 2)).

% Mover el rey
mover(Pieza, F, C, NF, NC):-
    rey(Pieza),
    numero(C,X), numero(NC, Y),
    casillaContinua(F, X, NF, Y).

% Mover el pe�n hacia delante
mover(Pieza,F,C,NF, C):-
    peon(Pieza),
    NF=:=F+1.

% Comer con el pe�n
mover(Pieza, F, C, NF, NC):-
    peon(Pieza),
%    hayPieza(NF, NC, Z),
    numero(C,X), numero(NC, Y),
    NF=:=F+1,
    abs(X-Y)=:=1.


casillaContinua(F, C, NF, C):-
    abs(F-NF)=:=1.

casillaContinua(F, C, NF, NC):-
    abs(C-NC) =:= 1,abs(F-NF) =:= 1.

casillaContinua(F, C, F, NC):-
    abs(C-NC)=:=1.


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
