:- consult('Task-3.pl').
:- initialization(main, main).

% Test 4 (hard): w = "01" -- state 2 is w-good (2--'0'-->1--'1'-->0, final)
% BFS from state 0: via '1' reaches state 1, via '0' reaches state 2 (w-good).
% x = "10", xw = "1001"  (binary 1001 = 9 = 3*3, divisible by 3)

main :-
    write('Test 4 (hard): w = "01" -- BFS needs 2 steps to find w-good state 2'), nl,
    W = ['0', '1'],
    (   can_extend_left(W, XW)
    ->  atomic_list_concat(XW, '', XWStr),
        write('Result:   Yes, xw = "'), write(XWStr), write('"'), nl
    ;   write('Result:   No'), nl
    ),
    write('Expected: Yes, xw = "1001"  (binary 1001 = 9, divisible by 3)'), nl.
