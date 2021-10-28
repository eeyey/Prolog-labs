numOfDays(jan, 31).
numOfDays(feb, 28).
numOfDays(mar, 31).
numOfDays(apr, 30).
numOfDays(may, 31).
numOfDays(jun, 30).
numOfDays(jul, 31).
numOfDays(aug, 31).
numOfDays(sep, 30).
numOfDays(oct, 31).
numOfDays(nov, 30).
numOfDays(dec, 31).

nextMonth(jan, feb).
nextMonth(feb, mar).
nextMonth(mar, apr).
nextMonth(apr, may).
nextMonth(may, jun).
nextMonth(jun, jul).
nextMonth(jul, aug).
nextMonth(aug, sep).
nextMonth(sep, oct).
nextMonth(oct, nov).
nextMonth(nov, dec).
nextMonth(dec, jan).

nextDate(date(M, D), D2) :- 
    numOfDays(M, X), nextMonth(M, Y),
    D =< X, D >= 1,
    (D =:= X -> D2 = date(Y, 1); ND is D + 1, D2 = date(M, ND)).
