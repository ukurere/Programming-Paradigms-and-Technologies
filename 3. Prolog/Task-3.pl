% Task 4, Section 3:
% For a given word w, determine if the finite automaton accepts
% at least one word of the form x++w (for some word x, possibly empty).
% If yes, provide an example of such word xw.

% --- Automaton: DFA over {'0','1'} accepting binary numbers divisible by 3 ---
% State 0: remainder 0 (initial, accepting)
% State 1: remainder 1
% State 2: remainder 2

initial(0).
final(0).
alphabet(['0', '1']).

trans(0, '0', 0).
trans(0, '1', 1).
trans(1, '0', 2).
trans(1, '1', 0).
trans(2, '0', 1).
trans(2, '1', 2).

% --- run_word(+State, +Word, -ReachedState) ---
% Simulates the automaton reading Word starting from State.
run_word(S, [], S).
run_word(S, [H|T], F) :-
    trans(S, H, S1),
    run_word(S1, T, F).

% --- w_good(+W, ?Q) ---
% State Q is "w-good" if reading W from Q leads to an accepting state.
w_good(W, Q) :-
    run_word(Q, W, F),
    final(F).

% --- all_states(-States) ---
% Collect all states mentioned in transitions.
all_states(States) :-
    findall(Q, (trans(Q, _, _) ; trans(_, _, Q)), All),
    list_to_set(All, States).

% --- bfs(+Queue, +Visited, +Targets, -RevPrefix) ---
% BFS from initial state toward any state in Targets.
% Queue: list of (State, ReversedPath) pairs.
bfs([(S, RevPath)|_], _, Targets, RevPath) :-
    member(S, Targets), !.
bfs([(S, _)|Rest], Visited, Targets, RevPath) :-
    member(S, Visited), !,
    bfs(Rest, Visited, Targets, RevPath).
bfs([(S, RevPath)|Rest], Visited, Targets, Result) :-
    alphabet(Alph),
    findall(
        (S1, [C|RevPath]),
        (   member(C, Alph),
            trans(S, C, S1),
            \+ member(S1, [S|Visited])
        ),
        Nexts
    ),
    append(Rest, Nexts, NewQueue),
    bfs(NewQueue, [S|Visited], Targets, Result).

% --- can_extend_left(+W, -XW) ---
% Main predicate: determines if the automaton accepts some word XW = X ++ W.
% Returns XW (as a list of characters) if yes, fails otherwise.
can_extend_left(W, XW) :-
    all_states(AllStates),
    findall(Q, (member(Q, AllStates), w_good(W, Q)), Targets),
    Targets \= [],
    initial(Init),
    bfs([(Init, [])], [], Targets, RevPrefix),
    reverse(RevPrefix, Prefix),
    append(Prefix, W, XW).
