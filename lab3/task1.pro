myReverse(Lst, RLst) :- myMyReverse(Lst, [], RLst).

myMyReverse([], Curr, Curr).
myMyReverse([H|T], Curr, Res) :- myMyReverse(T, [H|Curr], Res).

equalChars(X, X).
equalChars('a', 'A').
equalChars('b', 'B').
equalChars('c', 'C').
equalChars('A', 'a').
equalChars('B', 'b').
equalChars('C', 'c').

palindrome(Lst) :- myReverse(Lst, RLst), checkPalindrome(Lst, RLst).

checkPalindrome([],[]).
checkPalindrome([A|HLst], [B|HRLst]) :-
    equalChars(A, B), checkPalindrome(HLst, HRLst).