:- encoding(utf8).
:- consult('expert_system_Т.pl').
:- use_module(library(plunit)).

задати(Відповіді) :-
    retractall(fact(_, _)),
    forall(member(Ф, Відповіді), assertz(Ф)).

:- begin_tests(тест1).
test(тигр) :-
    задати([ fact(клас, 'ссавець'),
             fact(живлення, 'хижак'),
             fact(середовище, 'ліс'),
             fact(смуги, yes) ]),
    once(identify(Тварина)),
    Тварина == 'Тигр'.
:- end_tests(тест1).
