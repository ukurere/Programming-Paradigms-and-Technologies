:- consult('Task-4.pl').
:- initialization(main, main).

% Grammar: A -> Aa | a   (direct left recursion)
% A -> Aa: leftmost symbol is n(A) -> A left-reaches A directly -> left-recursive.
% Expected: ['A']

grammar(grammar(
    ['A'],
    [ rule('A', [n('A'), t(a)])
    , rule('A', [t(a)])
    ]
)).

main :-
    write('Test 1 (easy): A -> Aa | a  (direct left recursion)'), nl,
    grammar(G),
    left_recursive_nts(G, LRNTs),
    write('Result:   '), write(LRNTs), nl,
    write('Expected: [A]'), nl.
