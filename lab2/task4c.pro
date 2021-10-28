isSearchTree(nil) :- !.
isSearchTree(T) :- check(T, -2147483648, 2147483648). % 32бит

check(nil, _, _) :- !.
check(tr(X, L, R), A, B) :-
    A < X, X < R,
    check(L, A, X), check(R, X, B).
