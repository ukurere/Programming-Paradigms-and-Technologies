is_pow2(1).
is_pow2(N) :- N > 1, N mod 2 =:= 0, N1 is N // 2, is_pow2(N1).

split_pow2([], [], []).
split_pow2([H|T], [H|Pow], NotPow) :-
    is_pow2(H), !,
    split_pow2(T, Pow, NotPow).
split_pow2([H|T], Pow, [H|NotPow]) :-
    split_pow2(T, Pow, NotPow).
