% Реализация без хвостовой рекурсии
toSquares(0, _, 0) :- !.
toSquares(_, 0, 0) :- !.
toSquares(H, W, A) :- 
    N1 is min(H, W), N2 is max(H, W),
    N3 is N2 - N1,
    toSquares(N1, N3, A1),
    A is A1 + 1.