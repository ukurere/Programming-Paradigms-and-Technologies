:- consult('Task-2.pl').
:- initialization(main, main).

main :-
    write('Test 2 (easy): one peak in the middle'), nl,
    split_peaks([1,3,2], R),
    write('Result:   '), write(R), nl,
    write('Expected: [[1,3],[2]]'), nl.
