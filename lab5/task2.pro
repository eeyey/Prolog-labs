choosePairs(List1, List2, Pred, Res) :- 
    filtermap(List1, List2, Pred, R), (nonvar(Res) -> msort(Res,Res1), msort(R,R1), R1 = Res1 ; Res = R).

filtermap([], [], _, []).
filtermap([A|Lst1], [B|Lst2], Func, R) :-
    filtermap(Lst1, Lst2, Func, Res), 
    Pred =.. [Func, A, B], (call(Pred) -> R = [A-B|Res] ; R = Res).
    