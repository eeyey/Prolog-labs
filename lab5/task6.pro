subsets(Lst, Subs) :- var(Lst), var(Subs), writeln('Warning: Singleton variables: [Lst, Subs]'), !, fail.
subsets(Lst, Subs) :-
    nonvar(Lst), foldl([[]], addHeadSyn, Lst, S),  
    (var(Subs) -> 
        Subs = S ; 
        map1(S, msort, SS), msort(SS, SSS), 
        map1(Subs, msort, SSubs), msort(SSubs, SSSubs),
        SSS = SSSubs), !.
subsets(Lst, Subs) :- 
    var(Lst), foldl([], append, Subs, R), sort(R, Lst), subsets(Lst, Subs).

addHeadSyn(Lst, Elem, R) :- addHead(Elem, Lst, Res), append(Lst, Res, R).

map1([],  _, []) :- !.
map1([A|Lst1], Func, [C|Res]) :-
    Pred =.. [Func, A, C], call(Pred),
    map1(Lst1, Func, Res).

addHead(_, [], []) :- !.
addHead(Elem, [L|Lst], [[Elem|L]|Res]) :- addHead(Elem, Lst, Res).

foldl(A, _, [], A) :- !.
foldl(A, Func, [B|Lst], R) :-
    Pred =.. [Func, A, B, C], call(Pred),
    foldl(C, Func, Lst, Res), R = Res.