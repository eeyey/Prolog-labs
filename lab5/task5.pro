addHead(_, [], []) :- !.
addHead(Elem, [L|Lst], [[Elem|L]|Res]) :- addHead(Elem, Lst, Res).