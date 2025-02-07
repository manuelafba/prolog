% a(a|b)*b
inicio(q0).
%final(q2).
%p(q0,'a',q1).
%p(q1,'b',q1).
%p(q1,'a',q1).
%p(q1,'b',q2).

% 1(1|0)*0+0
%final(q3)
%p(q0, '1', q1).
%p(q1, '0', q1).
%p(q1, '1', q1).
%p(q1, '0', q2).
%p(q2, '0', q2).
%p(q2, '0', q3).

% 0*10*
%final(q1).
%final(q2).
%p(q0, '0', q0).
%p(q0, '1', q1).
%p(q1, '0', q2).
%p(q2, '0', q2).

% (0|1)*1(0|1)
%final(q1).
%final(q2).
%p(q0, '1', q0).
%p(q0, '0', q0).
%p(q0, '1', q1).
%p(q1, '1', q2).
%p(q1, '0', q2).
%p(q2, '1', q2).
%p(q2, '0', q2).

% 0*(1|ε)0*
%final(q1).
%final(q2).
%p(q0, '0', q0).
%p(q0, '1', q1).
%p(q1, '0', q2).
%p(q2, '0', q2).

% (0|1)(0|1)(0|1)*
final(q1).
final(q2).
p(q0, 1, q1).
p(q0, 0, q1).
p(q1, 1, q2).
p(q1, 0, q2).
p(q2, 0, q2).
p(q2, 1, q2).

teste(X) :- string_chars(X, Fita),
inicio(No),
reconhecedor(No, Fita), !.

reconhecedor(No,[]) :- final(No), !.

reconhecedor(De,Fita) :- (p(De, X, Para)),
caminha(X, Fita, Nova_Fita),
reconhecedor(Para, Nova_Fita).

reconhecedor(De, Fita) :-  p(De, ε, Para),
reconhecedor(Para, Fita).

caminha(H,[H | T],T).
