:- consult('Task-2.pl').
:- initialization(main, main).

main :-
    write('Test 1 (easy): example from the task'), nl,
    split_peaks([5,4,2,8,3,1,2,6,9,5], R),
    write('Result:   '), write(R), nl,
    write('Expected: [[5],[4,2,8],[3,1,2,6,9],[5]]'), nl.
