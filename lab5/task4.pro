insert(nil, X, tr(X, nil, nil)).
insert(tr(A, L, R), X, NewT) :- X < A, insert(L, X, NewL), NewT = tr(A, NewL, R).
insert(tr(A, L, R), X, NewT) :- X > A, insert(R, X, NewR), NewT = tr(A, L, NewR).

treeFromList(Lst, Tree) :- foldl(nil, insert, Lst, Tree).