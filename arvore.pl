raiz(15).
no(10, 15, 20).
no(5, 10, 9).
no(17, 20, 27).
no(nil, 5, 7).
no(25,27, nil).

no_interno(X) :- no(_, X, _).
no_folha(X) :- (no(_, _, X); no(X, _, _)), 
    			\+no(_, X, _),             
    			X \== nil.

filhos(X) :- no(E, X, D), E \== nil, D \== nil,
    		write("Filho da esquerda: "), write(E), nl,
    		write("Filho da direita: "), write(D), nl, !.
filhos(X) :- no(E, X, nil), E \== nil,
    		write("Somente filho da esquerda: "), write(E), !.
filhos(X) :- no(nil, X, D), D \== nil,
    		write("Somente filho da direita: "), write(D), !.
filhos(_X) :- write("Não possui filhos").

pre_ordem :- raiz(No), pre_ordem(No).
pre_ordem(nil) :- !.
pre_ordem(No) :- no_folha(No), visita(No), !.
pre_ordem(No) :- no(E, No, D), visita(No), pre_ordem(E), pre_ordem(D).

visita(X) :- write(X), write(" - ").

em_ordem :- raiz(No), em_ordem(No).
em_ordem(nil) :- !.
em_ordem(No) :- no_folha(No), visita(No), !.
em_ordem(No) :- no(E, No, D), em_ordem(E), visita(No), em_ordem(D).

pos_ordem :- raiz(No), pos_ordem(No).
pos_ordem(nil) :- !.
pos_ordem(No) :- no_folha(No), visita(No), !.
pos_ordem(No) :- no(E, No, D), pos_ordem(E), pos_ordem(D), visita(No).

% Caso base: raiz
nivel(No, 0) :- raiz(No), !.

% Caso recursivo: verifica a subárvore esquerda
nivel(No, Nivel) :-
    no(E, Pai, _),
    nivel(Pai, NivelPai),
    No = E,
    Nivel is NivelPai + 1, !.

% Caso recursivo: verifica a subárvore direita
nivel(No, Nivel) :-
    no(_, Pai, D),
    nivel(Pai, NivelPai),
    No = D,
    Nivel is NivelPai + 1.

grau(nil, 0) :- !.
grau(No, 2) :- no(E, No, D), E \== nil, D \== nil, !.
grau(No, 1) :- no(E, No, _), E \== nil, !.
grau(No, 1) :- no(_, No, D), D \== nil, !.
grau(N, 0) :- no(nil, N, nil), !.

irmao(nil, nil) :- !.
irmao(No, Irmao) :- no(No, _, Irmao), Irmao \== nil, !.
irmao(No, Irmao) :- no(Irmao, _, No), Irmao \== nil, !.
irmao(_, nil).

