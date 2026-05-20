% Task 3, Section 4:
% Find all left-recursive nonterminals of a context-free grammar.
% A nonterminal A is left-recursive if A =>+ A*alpha* for some string alpha.
%
% Grammar is represented as: grammar(NTs, Rules)
%   NTs   = list of nonterminal atoms
%   Rules = list of rule(LHS, RHS)
%   RHS   = list of symbols: n(NT) for nonterminal, t(X) for terminal

% --- left_first(+Grammar, +A, -B) ---
% B is the leftmost nonterminal in some rule for A.
% i.e., there exists a rule A -> n(B) : rest
left_first(grammar(_, Rules), A, B) :-
    member(rule(A, [n(B)|_]), Rules).

% --- bfs_left(+Grammar, +Queue, +Visited, -Reachable) ---
% BFS over the "left-first" graph to find all left-reachable nonterminals.
bfs_left(_, [], Visited, Visited).
bfs_left(Grammar, [X|Queue], Visited, Reachable) :-
    member(X, Visited), !,
    bfs_left(Grammar, Queue, Visited, Reachable).
bfs_left(Grammar, [X|Queue], Visited, Reachable) :-
    findall(B, left_first(Grammar, X, B), Next),
    append(Queue, Next, NewQueue),
    bfs_left(Grammar, NewQueue, [X|Visited], Reachable).

% --- left_reach(+Grammar, +A, -Reachable) ---
% All nonterminals left-reachable from A (not including A itself unless cyclic).
left_reach(Grammar, A, Reachable) :-
    findall(B, left_first(Grammar, A, B), Direct),
    bfs_left(Grammar, Direct, [], Reachable).

% --- is_left_recursive(+Grammar, +A) ---
% A is left-recursive if it can reach itself via left-first derivations.
is_left_recursive(Grammar, A) :-
    left_reach(Grammar, A, Reachable),
    member(A, Reachable).

% --- left_recursive_nts(+Grammar, -LRNTs) ---
% Main predicate: returns the list of all left-recursive nonterminals.
left_recursive_nts(Grammar, LRNTs) :-
    Grammar = grammar(NTs, _),
    findall(A, (member(A, NTs), is_left_recursive(Grammar, A)), LRNTs).
