prime(N) :-
    N > 1, prime_check(2, N).

prime_check(K, N) :- K * K > N, ! ; N mod K > 0, NewK is K + 1, prime_check(NewK, N).