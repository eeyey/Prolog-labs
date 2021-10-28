contains(tr(A, L, R), X) :-
    var(X), (contains(L, X); X = A; contains(R, X)).
contains(tr(A, L, R), X) :-
    nonvar(X), 
    (A =:= X, ! ; contains(L, X), ! ; contains(R, X)).