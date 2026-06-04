:- encoding(utf8).
:- consult('expert_system_Т.pl').
:- use_module(library(plunit)).

задати(Відповіді) :-
    retractall(fact(_, _)),
    forall(member(Ф, Відповіді), assertz(Ф)).

:- begin_tests(тест2).
test(тхір) :-
    задати([ fact(клас, 'ссавець'),
             fact(живлення, 'хижак'),
             fact(середовище, 'ліс'),
             fact(смуги, no) ]),
    once(identify(Тварина)),
    Тварина == 'Тхір'.
:- end_tests(тест2).
