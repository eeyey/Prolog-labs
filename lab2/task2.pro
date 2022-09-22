% Реализация без хвостовой рекурсии
qntDigit(A, B, _, 0) :- A > B, !. 
qntDigit(A, B, D, K) :-
    NewB is B - 1,
    (exist(B, D), !, qntDigit(A, NewB, D, Kn), K is Kn + 1; qntDigit(A, NewB, D, Kn), K is Kn).

exist(N, D) :- N < 0, NewN is abs(N), exist(NewN, D).
exist(N, D) :- N < 10, N = D.
exist(N, D) :- 
    N >= 10,   
    X is N // 10, L is N mod 10,
    (L = D, ! ; exist(X, D)).
