%Practica 1: Ajedrez

:- dynamic tablero/1.

% El problema es como tratar tablero

inicializar():-
    retractall(tablero(_)),
    inicializarTablero(tablero, 8),
    piezas=[
        [torre, caballo, arfil, rey, reina, arfil, caballo, torre],
        [torre, caballo, arfil, reina, rey, arfil, caballo, torre]
    ],
    posicionarPiezas(tablero, piezas, 8, 8),
    printTablero(tablero, 8).

inicializarTablero([Fila|Resto], NColumnas):-
    NColumnas > 0,
%    assert(tablero()),
    Fila = [0,0,0,0,0,0,0,0],
    NColumnas1 is NColumnas -1,
    inicializarTablero(Resto, NColumnas1).



% Saltar lineas intermedias
posicionarPiezas(L1, L2, F, C):-
    F>2,F<6,
    F1 is F + 1,
    posicionarPiezas(L1, L2, F1, C).

% Posicionar peones blancos
posicionarPiezas([[(peon, blanco)|R1]|L], Lista, F, C):-
    F=2,
    C1 is C - 1,
    posicionarPiezas([R1|L], Lista, F, C1).

% Posicionar peones negros
posicionarPiezas([[(peon, negro)|R1]|L], Lista, F, C):-
    F=7,
    C1 is C - 1,
    posicionarPiezas([R1|L], Lista, F, C1).

% Posicionar piezas en la linea 1
posicionarPiezas([[(X, blanco)|R]|L],[[X|R1], X2] , F, C):-
    F=1,
    C1 is C - 1,
    posicionarPiezas([R|L],[R1, X2], F, C1).

% Posicionar piezas en la linea 8
posicionarPiezas([[(X, blanco)|R]|L],[X1, [X|R2]] , F, C):-
    F=8,
    C1 is C - 1,
    posicionarPiezas([R|L],[X1, R2], F, C1).



printTablero([[X|R]|L], N):-
    write(X),
    printTablero([R|L], N).

printTablero([[X|_R], Y|L], N):-
    N=8,
    write(X), nl,
    printTablero([Y|L], N).






% LA PRACTICA 1 EMPIEZA AQU�: ->


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
% hayPieza([(X)|R], F, C, Color):-
%    .
/*
 * turnoDe(Color, X):-
    color(Color),
    colorContrario(Color, X).
*/

%cambiarTurno(Tablero, Turno):-

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
