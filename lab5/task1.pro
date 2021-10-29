map([], [], _, []) :- !.
map([_|_], [], _, []) :- !.
map([], [_|_], _, []) :- !.
map([A|Lst1], [B|Lst2], Func, [C|Res]) :-
    Pred =.. [Func, A, B, C], call(Pred),
    map(Lst1, Lst2, Func, Res).