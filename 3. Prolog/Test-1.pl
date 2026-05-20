:- consult('Task-3.pl').
:- initialization(main, main).

% Test 1 (easy): w = "0"
% run_word(0, ['0'], 0) -- state 0 is w-good, and 0 is the initial state.
% So x = "", xw = "0"  (binary 0, divisible by 3)

main :-
    write('Test 1 (easy): w = "0" -- initial state is already w-good'), nl,
    W = ['0'],
    (   can_extend_left(W, XW)
    ->  atomic_list_concat(XW, '', XWStr),
        write('Result:   Yes, xw = "'), write(XWStr), write('"'), nl
    ;   write('Result:   No'), nl
    ),
    write('Expected: Yes, xw = "0"  (binary 0, divisible by 3)'), nl.
