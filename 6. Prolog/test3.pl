:- encoding(utf8).
:- consult('expert_system_Т.pl').
:- use_module(library(plunit)).

задати(Відповіді) :-
    retractall(fact(_, _)),
    forall(member(Ф, Відповіді), assertz(Ф)).

:- begin_tests(тест3).
test(тукан) :-
    задати([ fact(клас, 'птах'),
             fact(яскравий_дзьоб, yes) ]),
    once(identify(Тварина)),
    Тварина == 'Тукан'.
:- end_tests(тест3).
