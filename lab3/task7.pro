p(Lst, Seq) :- var(Seq), Lst \= [], getMaxIncSeq(Lst, [], Seq).
p(Lst, Seq) :- nonvar(Seq), getMaxIncSeq(Lst, [], Max), length(Max, M), isMaxIncSeq(Lst, M, Seq).

isMaxIncSeq(Lst, M, Seq) :- 
    Lst \= [],
    getIncSeq(Lst, -2147483648, NSeq, HLst),
    length(NSeq, S),
    ((NSeq = Seq, S = M); isMaxIncSeq(HLst, M, Seq)).

getMaxIncSeq([], Max, RSeq) :- RSeq = Max.
getMaxIncSeq(Lst, Max, RSeq) :-
    Lst \= [],
    getIncSeq(Lst, -2147483648, Seq, HLst),
    length(Max, M), length(Seq, S),
    (S > M -> getMaxIncSeq(HLst, Seq, RSeq); getMaxIncSeq(HLst, Max, RSeq)).

getIncSeq([], _, Seq, H) :- Seq = [], H = [].
getIncSeq([A|Lst], P, Seq, H) :- A > P, getIncSeq(Lst, A, NSeq, NH), Seq = [A|NSeq], H = NH.
getIncSeq([A|Lst], P, Seq, H) :- A =< P, Seq = [], H = [A|Lst].
