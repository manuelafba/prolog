freq(_, [], 0) :- !.
freq(F, [H|T], R) :- R is N + 1, freq(F, T, N), !.
freq(F, [_|T], R) :- freq(F, T, R).

pertence(V, [V|_]) :- !.
pertence(V, [_|T]) :- pertence(V, T).

reverso(L, R) :- reverso(L, [], R).
reverso([], R, R) :- !.
reverso([H|T], AUX, R) :- reverso(T, [H|AUX], R).

duplicados(L, R) :- duplicados(L, [], R).
duplicados([], D, R) :- reverso(D, R), !.
duplicados([H|T], D, R) :- freq(H, T, F), F > 0, \+ pertence(H, D), duplicados(T, [H|D], R), !.
duplicados([_|T], D, R) :- duplicados(T, D, R).
