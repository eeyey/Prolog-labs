foldl(A, _, [], A) :- !.
foldl(A, Func, [B|Lst], R) :-
    Pred =.. [Func, A, B, C], call(Pred),
    foldl(C, Func, Lst, Res), R = Res.