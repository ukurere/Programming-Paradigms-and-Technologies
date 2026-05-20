:- consult('Task-3.pl').
:- initialization(main, main).

% Test 2 (easy): w = "11" (binary 3)
% run_word(0, ['1','1'], 0) -- state 0 is w-good, and 0 is the initial state.
% So x = "", xw = "11"  (binary 11 = 3, divisible by 3)

main :-
    write('Test 2 (easy): w = "11" (binary 3) -- x = "", w itself is accepted'), nl,
    W = ['1', '1'],
    (   can_extend_left(W, XW)
    ->  atomic_list_concat(XW, '', XWStr),
        write('Result:   Yes, xw = "'), write(XWStr), write('"'), nl
    ;   write('Result:   No'), nl
    ),
    write('Expected: Yes, xw = "11"  (binary 11 = 3, divisible by 3)'), nl.
