% 5б ломается на тесте:
% | ?- numlst(N,[0]).
% uncaught exception: error(instantiation_error,(is)/2)

numlst(N, Lst) :- var(N), var(Lst), generateSeq(0, N, Lst).
numlst(N, Lst) :- getList(N, [], RLst), Lst = RLst.

generateSeq(C, N, Lst) :-
    N is C, getList(C, [], Lst); 
    Cn is C + 1, generateSeq(Cn, N, Lst).

getList(N, CLst, Lst) :-
    D is N mod 10, Nn is N // 10,
    (Nn = 0 ->
        Lst = [D|CLst];
        NCLst = [D|CLst], getList(Nn, NCLst, Lst)).