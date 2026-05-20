:- consult('Task-3.pl').
:- initialization(main, main).

% Test 3 (hard): w = "1" -- state 1 is w-good (1--'1'-->0, final)
% BFS from state 0: via '1' reaches state 1 (w-good).
% x = "1", xw = "11"  (binary 11 = 3, divisible by 3)

main :-
    write('Test 3 (hard): w = "1" -- BFS finds state 1 is w-good, x = "1"'), nl,
    W = ['1'],
    (   can_extend_left(W, XW)
    ->  atomic_list_concat(XW, '', XWStr),
        write('Result:   Yes, xw = "'), write(XWStr), write('"'), nl
    ;   write('Result:   No'), nl
    ),
    write('Expected: Yes, xw = "11"  (binary 11 = 3, divisible by 3)'), nl.
