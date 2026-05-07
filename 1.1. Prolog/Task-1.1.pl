count(_, [], 0).
count(X, [X|T], N) :- !, count(X, T, N1), N is N1 + 1.
count(X, [_|T], N) :- count(X, T, N).

remove_twice([], _, []).
remove_twice([H|T], L2, Result) :-
    count(H, L2, 2), !,
    remove_twice(T, L2, Result).
remove_twice([H|T], L2, [H|Result]) :-
    remove_twice(T, L2, Result).