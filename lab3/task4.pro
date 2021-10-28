sortMerge(Lst1, Lst2, Res) :- sMerge(Lst1, Lst2, R), Res = R.

sMerge([], Lst2, Lst2).
sMerge(Lst1, [], Lst1).
sMerge([A|HLst1], [B|HLst2], RLst) :- A =< B, sMerge(HLst1, [B|HLst2], R), RLst = [A|R].
sMerge([A|HLst1], [B|HLst2], RLst) :- B < A, sMerge([A|HLst1], HLst2, R), RLst = [B|R].