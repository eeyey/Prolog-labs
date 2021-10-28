% Лучше делить на 3 части
hoarsort([], []).
hoarsort([A], [A]).
hoarsort([A|Lst], R) :-
    share(Lst, A, Lst1, Lst2), hoarsort(Lst1, R1), hoarsort(Lst2, R2), append(R1, [A|R2], R), !.

share([], _, [], []).
share([A|Lst], X, Lst1, Lst2) :- 
    A < X -> share(Lst, X, T1, Lst2), Lst1 = [A|T1]; share(Lst, X, Lst1, T2), Lst2 = [A|T2].