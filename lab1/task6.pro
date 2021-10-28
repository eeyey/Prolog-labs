sirakuz(0, _) :- !.
sirakuz(N, A) :-
    write(A), nl,
    (A mod 2 =:= 0 -> An is A // 2; An is 3*A + 1),
    NewN is N - 1, sirakuz(NewN, An).