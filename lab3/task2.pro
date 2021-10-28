removeCompositeNumbers([], RLst) :- RLst = [].
removeCompositeNumbers([A|Lst], RLst) :- 
    (A =< 0; isPrime(A, 2)) -> 
        removeCompositeNumbers(Lst, R), RLst = [A|R]; 
        removeCompositeNumbers(Lst, R), RLst = R.

isPrime(N, D) :- N > 1, D =< sqrt(N), N mod D > 0, Dn is D+1, isPrime(N, Dn).
isPrime(N, D) :- N > 1, D > sqrt(N).