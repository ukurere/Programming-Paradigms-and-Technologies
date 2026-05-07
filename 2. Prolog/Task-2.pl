is_peak_ctx(none, X, Next) :- X > Next.
is_peak_ctx(Prev, X, Next) :- Prev \= none, X > Prev, X > Next.

split_peaks(List, Sublists) :-
    split_peaks_aux(List, none, [], Sublists).

split_peaks_aux([], _, Acc, [Sub]) :-
    reverse(Acc, Sub).
split_peaks_aux([X], _, Acc, [Sub]) :-
    reverse([X|Acc], Sub).
split_peaks_aux([X, Next|Rest], Prev, Acc, [Sub|Subs]) :-
    is_peak_ctx(Prev, X, Next), !,
    reverse([X|Acc], Sub),
    split_peaks_aux([Next|Rest], X, [], Subs).
split_peaks_aux([X|Rest], _, Acc, Subs) :-
    split_peaks_aux(Rest, X, [X|Acc], Subs).
