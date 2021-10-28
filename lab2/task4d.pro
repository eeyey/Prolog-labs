remove(nil, _, nil).
remove(tr(A, L, R), X, tr(A, L, NR)) :- X > A, remove(R, X, NR).
remove(tr(A, L, R), X, tr(A, NL, R)) :- X < A, remove(L, X, NL).
remove(tr(A, L, R), X, tr(NA, L, NR)) :- X = A, R \= nil, findMinTree(R, NA), remove(R, NA, NR).
remove(tr(A, _, R), X, NT) :- X = A, R = nil, NT = R.

findMinTree(tr(A, L, _), M) :- L = nil, M is A.
findMinTree(tr(_, L, _), M) :- findMinTree(L, Mn), M is Mn.