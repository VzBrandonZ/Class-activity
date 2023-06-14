% Hechos: Definición de las relaciones familiares
hombre(justo).
hombre(manuel).
hombre(milton).
hombre(brando).
hombre(david).
mujer(sabina).
mujer(amalia).
mujer(blanca).
mujer(maria).
mujer(alisson).

padre(justo, blanca).
padre(justo, amalia).
padre(manuel, brando).
padre(manuel, maria).
padre(milton, alisson).
padre(milton, david).

madre(sabina, blanca).
madre(sabina, amalia).
madre(blanca, brando).
madre(blanca, maria).
madre(amalia, alisson).
madre(amalia, david).

esposos(sabina,justo).
esposos(blanca, manuel).
esposos(amalia,milton).
esposos(justo,sabina).
esposos(manuel,blanca).
esposos(milton,amalia).



% Regla: hermano
hermano(X, Y) :-
  padre(P, X),
  padre(P, Y),
  madre(M, X),
  madre(M, Y),
  X \= Y.

% Regla: hermana
hermana(X, Y) :-
  padre(P, X),
  padre(P, Y),
  madre(M, X),
  madre(M, Y),
  X \= Y,
  mujer(X).

% Regla: abuelo
abuelo(X, Y) :-
  padre(X, P),
  (padre(P, Y) ; madre(P, Y)),
  hombre(X).

% Regla: abuela
abuela(X, Y) :-
  madre(X, P),
  (padre(P, Y) ; madre(P, Y)),
  mujer(X).

% Regla: tio
tio(X, Y) :-
  (padre(P, Y) ; madre(M, Y)),
  ((hermano(X, P) ; (esposos(X, Q), hermana(Q, M)))).

% Regla: tia
tia(X, Y) :-
  padre(P, Y),
  hermana(X, P).
% Regla: tio
tia(X, Y) :-
  madre(M, Y),
  hermana(X, M).
% Regla: Cuñada
cuñada(X, Y) :-
  hermana(X, P),
  (esposo(P, Y) ; esposa(P, Y)).
%Regla cuñada
cuñado(X, Y) :-
  hermano(X, P),
  (esposo(P, Y) ; esposa(P, Y)).