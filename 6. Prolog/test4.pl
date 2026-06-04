:- encoding(utf8).
:- consult('expert_system_Т.pl').
:- use_module(library(plunit)).

задати(Відповіді) :-
    retractall(fact(_, _)),
    forall(member(Ф, Відповіді), assertz(Ф)).

:- begin_tests(тест4).
test(невідомий, [fail]) :-
    задати([ fact(клас, 'ссавець'),
             fact(живлення, 'всеїдний'),
             fact(середовище, 'степ') ]),
    identify(_).
:- end_tests(тест4).
