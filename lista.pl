% Frequência de elemento na lista
% Caso base: lista vazia 
freq(_, [], 0) :- !.

% Caso em que o elemento é encontrado na cabeça da lista
freq(F, [F | T], R) :- 
    freq(F, T, N), % Passa o resto da lista pra função
    R is N + 1. % Incrementa contador

% Caso em que o elemento da cabeça não é o procurado
freq(F, [_ | T], R) :- 
    freq(F, T, R). % Passa o resto da lista pra função sem incrementar o contador

% Concatenar duas listas
concat([], L2, L2) :- !. % Primeira lista vazia é igual a segunda
concat([H|T], L2, [H|R]) :- concat(T, L2, R). % H é a cabeça da lista final, T é passado recursivamente

% Somar elementos de listas dentro de uma lista
somaListas([], []) :- !.
somaListas([H1|T1], [H2|T2]) :- soma(H1, H2), somaListas(T1, T2). 

soma([], 0) :- !.
soma([H|T], R) :- soma(T,S1), S is H + S1.

% Achar o último elemento
ultimoElemento([R], R) :- !. % Lista só com um elemento, a resposta é esse elemento
ultimoElemento([_|T], R) :- ultimoElemento(T, R). % Ignora a cabeça e passa a cauda recursivamente até restar o último elemento

% Lista reversa
reverso(L, R) :- reverso(L, [], R). 
reverso([], R, R) :- !. 
reverso([H|T], Aux, R) :- reverso(T, [H|Aux], R). % Passa a cabeça para o começo da lista Aux e passa a cauda recursivamete

% Verificar se o elemento está na lista
presente(X, [X|_]) :- !. % Caso base: elemento é igual a cabeça
presente(X, [_|T]) :- presente(X, T). % Passa o resto da lista recursivamente

% Informar elementos duplicados
duplicados(L, R) :- duplicados(L, [], R).
duplicados([], D, R) :- reverso(D, R), !. % Devolve a lista dos duplicados reversa
duplicados([H|T], D, R) :- freq(H, T, F), F > 0, \+ presente(H, D), duplicados(T, [H|D], R). % Verifica a frequência de H no resto da lista, se for maior que 0, H vai para a lista de duplicados se ainda não estiver nela. T é passado recursivamente
duplicados([H|T], D, R) :- duplicados(T, D, R). % Elemento não duplicado, apenas passa T

eliminarDuplicados([], []) :- !.
eliminarDuplicados([H|T], [H|R]) :- \+ pertence (H, T), eliminarDuplicados(T, R). % Se H não está em T, vira cabeça da lista resultante
eliminarDuplicados([H|T], R) :- pertence(H, T), eliminarDuplicados(T, R). % Caso H esteja em T, continua a recursão normalmente.
