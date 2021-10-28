% Плохой код, но лень рефакторить :)
fact(N, F) :-
    var(N) ->
        (
            var(F) -> 
                iter(0, 1, N, F);
                isFact(N, 2, F)
        );
        getFact(N, 1, R), F = R.

iter(C, D, N, F) :-    
    N is C, F is D; 
    Cn is C + 1, Dn is D * Cn, iter(Cn, Dn, N, F).
        
isFact(N, C, F) :-
    F > 1 -> 
        0 is F mod C, Y is F // C, X is C + 1, isFact(N, X, Y);
        F = 1, N is C - 1.

getFact(N, C, F) :-
    N < 1 ->
        F is 1;
        (
            N = 1 ->
                F is C;
                Nn is N-1, NC is C*N, getFact(Nn, NC, F)
        ).