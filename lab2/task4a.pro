insert(nil, X, tr(X, nil, nil)).
insert(tr(A, L, R), A, tr(A, L, R)).
insert(tr(A, L, R), X, tr(A, NewL, R)) :- X < A, insert(L, X, NewL).
insert(tr(A, L, R), X, tr(A, L, NewR)) :- X > A, insert(R, X, NewR).
