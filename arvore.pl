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

filhos(No, E, D) :- no(E, No, D).

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

nivel(No, R) :- raiz(Raiz), nivel(No, Raiz, R).
nivel(No, No, 1) :- !.
nivel(No, AUX, R) :- filhos(AUX, E, _),
    nivel(No, E, R1),
    R is R1 + 1, !.
nivel(No, AUX, R) :- filhos(AUX, _, D),
    nivel(No, D, R1),
    R is R1 + 1, !.

grau(No, 0) :- no_folha(No), !.
grau(No, 1) :- no(nil, No, D), D \== nil, !.
grau(No, 1) :- no(E, No, nil), E \== nil, !.
grau(no , 2) :- !.

irmao(nil, nil) :- !.
irmao(No, Irmao) :- no(Irmao, _, No), Irmao \== No, !.
irmao(No, Irmao) :- no(No, _, Irmao), Irmao \== No, !.

altura(R) :- raiz(No), altura(No, R).
altura(No, 0) :- no_folha(No), !.
altura(nil, 0) :- !.
altura(No, R) :- no(E, No, D), altura(E, R1), altura(D, R2), M is max(R1, R2), R is M + 1.

mais_a_esquerda(R) :- raiz(No), mais_a_esquerda(No, R).
mais_a_esquerda(No, No) :- no(nil, No, _), !.
mais_a_esquerda(No, No) :- no_folha(No), !.
mais_a_esquerda(No, R) :- no(E, No, _), mais_a_esquerda(E, R).





