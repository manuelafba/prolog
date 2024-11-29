homem(ivo).
homem(raí).
homem(ary).
homem(gil).
homem(noé).

mulher(ana).
mulher(bia).
mulher(eva).
mulher(clô).
mulher(lia).
mulher(gal).

pai(ivo, eva).
pai(raí, noé).
pai(gil, raí).
pai(gil, ary).
pai(gil, clô).
pai(ary, gal).

mãe(ana, eva).
mãe(eva, noé).
mãe(bia, clô).
mãe(bia, raí).
mãe(bia, ary).
mãe(lia, gal).

gerou(X, Y) :- pai(X, Y); mãe(X, Y).

irmao(A, B) :- gerou(X, A), 
    gerou(X, B), 
    homem(A), 
    homem(B), 
    A \== B.

irma(A, B) :- gerou(X, A), 
    gerou(X, B), 
    mulher(A), 
    mulher(B), 
    A \== B.

tio(A, B) :- irmao(A, C), gerou(C, B).

tia(A, B) :- irma(A, C), gerou(C, B).

avô(A, B) :- gerou(A, C), gerou(C, B), homem(A).

avó(A, B) :- gerou(A, C), gerou(C, B), mulher(A).

casal(A, B) :- gerou(A, C), gerou(B, C), A \== B.

feliz(A) :- pai(A, B); mãe(A, B).
