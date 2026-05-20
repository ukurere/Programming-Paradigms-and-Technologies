:- consult('Task-4.pl').
:- initialization(main, main).

% Grammar: A -> aB, B -> b   (no left recursion)
% A -> aB: leftmost symbol is t(a), not a nonterminal -> A left-reaches nothing.
% B -> b:  leftmost symbol is t(b) -> B left-reaches nothing.
% Expected: []

grammar(grammar(
    ['A', 'B'],
    [ rule('A', [t(a), n('B')])
    , rule('B', [t(b)])
    ]
)).

main :-
    write('Test 2 (easy): A -> aB | B -> b  (no left recursion)'), nl,
    grammar(G),
    left_recursive_nts(G, LRNTs),
    write('Result:   '), write(LRNTs), nl,
    write('Expected: []'), nl.
