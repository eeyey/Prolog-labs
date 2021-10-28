myPrefix([],_).
myPrefix([A|Lst1],[B|Lst2]) :- A = B, myPrefix(Lst1,Lst2).

mySublist(Lst1, [B|Lst2]) :- myPrefix(Lst1,[B|Lst2]); mySublist(Lst1,Lst2).