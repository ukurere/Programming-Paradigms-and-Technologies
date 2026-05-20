:- consult('Task-4.pl').
:- initialization(main, main).

% Grammar: S -> AB | c,  A -> Aa | a,  B -> bB | b
% S -> AB: leftmost is n(A) -> S left-reaches A.
% A -> Aa: leftmost is n(A) -> A left-reaches A (directly left-recursive!).
% B -> bB: leftmost is t(b) -> B left-reaches nothing.
% S left-reaches A which is left-recursive -> S is also left-recursive.
% B has no left-recursive path.
% Expected: ['S', 'A']

grammar(grammar(
    ['S', 'A', 'B'],
    [ rule('S', [n('A'), n('B')])
    , rule('S', [t(c)])
    , rule('A', [n('A'), t(a)])
    , rule('A', [t(a)])
    , rule('B', [t(b), n('B')])
    , rule('B', [t(b)])
    ]
)).

main :-
    write('Test 4 (hard): S -> AB | c | A -> Aa | a | B -> bB | b'), nl,
    grammar(G),
    left_recursive_nts(G, LRNTs),
    write('Result:   '), write(LRNTs), nl,
    write('Expected: [A]'), nl.
