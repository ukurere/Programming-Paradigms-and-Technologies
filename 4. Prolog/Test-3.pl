:- consult('Task-4.pl').
:- initialization(main, main).

% Grammar: A -> Ba | b,  B -> Ab | a   (indirect left recursion)
% A -> Ba: leftmost is n(B) -> A left-reaches B.
% B -> Ab: leftmost is n(A) -> B left-reaches A.
% A left-reaches B, B left-reaches A -> both are left-recursive!
% Expected: ['A', 'B']

grammar(grammar(
    ['A', 'B'],
    [ rule('A', [n('B'), t(a)])
    , rule('A', [t(b)])
    , rule('B', [n('A'), t(b)])
    , rule('B', [t(a)])
    ]
)).

main :-
    write('Test 3 (hard): A -> Ba | b | B -> Ab | a  (indirect left recursion)'), nl,
    grammar(G),
    left_recursive_nts(G, LRNTs),
    write('Result:   '), write(LRNTs), nl,
    write('Expected: [A,B]'), nl.
