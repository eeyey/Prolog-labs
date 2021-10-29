:- initialization(consult('task6.pro')).

thing(plate,1,1.5).
thing(jar,3,5).
thing(silverSpoon,0.3,15).

sack(3).

pack(Things, MaxPrice) :-
    setof([X, Y, Z], thing(X, Y, Z), TL),
    subsets(TL, TS), sack(MW),
    foldl([MW, [], 0], step, TS, [_, TT, MaxPrice]),
    map1(TT, once, TN), 
    msort(TN, Things).

once([A|_], A).

step(C, I, R) :-
    sumThings(I, T), chooseBetter(C, [I|T], R).

chooseBetter([S, CT, MP], [NT, P, W], R) :-
    (P > MP, S >= W) -> R = [S, NT, P]; R = [S, CT, MP].

sumThings(Things, C) :- foldl([0, 0], addThing, Things, C).

addThing([P, W], [_, TW, TP],  [RP, RW]) :- RP is TP + P, RW is TW + W.  
