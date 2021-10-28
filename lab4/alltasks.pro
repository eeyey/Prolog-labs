:- initialization(consult('kinship.pro')).

% task 1
pred(X, Y) :- parent(X, Y).
pred(X, Y) :- setof(Z, (parent(Z, Y), pred(X, Z)), _).

% task 2
brother(X, Y) :- 
    male(X), bDop(X, Y). 

bDop(X, Y) :- % Доп функция, чтобы в других задачах пользоваться ей при поиске брата/сестры.
    parent(M, Y), female(M), 
    parent(D, Y), male(D),
    parent(M, X), parent(D, X),
    X \= Y.

% task 3 
married(X, Y) :- 
    setof(Z, (parent(X, Z), parent(Y, Z)), _),
    X \= Y.

% task 4
husband(X, Y) :-
    male(X),
    married(X, Y).

% task 5
cousin(X, Y) :- 
    parent(Z, X), parent(F, Y),
    bDop(Z, F).

% task 6
num_of_children(X, N) :-
    setof(Y, parent(X, Y), F), length(F, N).
num_of_children(X, 0) :-
    (female(X); male(X)),
    \+ parent(X, _). 
    
% task 7
nephews(Lst,X) :- 
    (female(X); male(X)),
    findall(Z, (bDop(X, Y), parent(Y, Z)), F), sort(F, Lst).

% task 8 
family([X,Y|Childs]) :-
    male(X), husband(X, Y), 
    setof(Z, (parent(X, Z), parent(Y, Z)), Childs).
