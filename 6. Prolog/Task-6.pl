:- dynamic(fact/2).       

start :-
    retractall(fact(_, _)),
    nl,
    writeln('================================================='),
    writeln(' ЕКСПЕРТНА СИСТЕМА: ВИЗНАЧЕННЯ ТВАРИНИ'),
    writeln(' (усі тварини у базі мають назву на літеру "Т")'),
    writeln('================================================='),
    writeln('Як відповідати:'),
    writeln('  - на запитання так/ні вводьте   yes.   або   no.'),
    writeln('  - на запитання з переліком — номер варіанту, напр.  2.'),
    writeln('  (не забувайте крапку наприкінці!)'),
    ( identify(Animal)
    ->  format('~n>>> Це, найімовірніше: ~w~n~n', [Animal])
    ;   format('~n>>> На жаль, у базі знань немає тварини з такими ознаками.~n~n', [])
    ).

identify('Тигр')     :- ссавець, хижак, choose(середовище, 'ліс'), yesno(смуги).
identify('Тхір')     :- ссавець, хижак, choose(середовище, 'ліс'), \+ yesno(смуги).
identify('Тюлень')   :- ссавець, хижак, choose(середовище, 'море').
identify('Тапір')    :- ссавець, травоїдний, choose(середовище, 'тропіки').
identify('Тарпан')   :- ссавець, травоїдний, choose(середовище, 'степ').
identify('Тукан')    :- птах, yesno(яскравий_дзьоб).
identify('Тетерук')  :- птах, \+ yesno(яскравий_дзьоб).
identify('Тунець')   :- риба.
identify('Тарантул') :- павукоподібний.
identify('Терміт')   :- комаха.


% --- за класом тварини ---
ссавець        :- choose(клас, 'ссавець').
птах           :- choose(клас, 'птах').
риба           :- choose(клас, 'риба').
комаха         :- choose(клас, 'комаха').
павукоподібний :- choose(клас, 'павукоподібний').

% --- за типом живлення ---
хижак      :- choose(живлення, 'хижак').
травоїдний :- choose(живлення, 'травоїдний').
всеїдний   :- choose(живлення, 'всеїдний').

% Багатоальтернативні запитання: question(Атрибут, Текст, СписокВаріантів).
question(клас, 'До якого класу належить тварина?',
         ['ссавець', 'птах', 'риба', 'комаха', 'павукоподібний']).
question(живлення, 'Чим живиться тварина?',
         ['хижак', 'травоїдний', 'всеїдний']).
question(середовище, 'Де переважно мешкає тварина?',
         ['ліс', 'море', 'степ', 'тропіки']).

% Запитання так/ні: yn_question(Ключ, Текст).
yn_question(смуги,          'Чи має тварина смугасте забарвлення?').
yn_question(яскравий_дзьоб, 'Чи має птах великий яскравий дзьоб?').

% choose(+Атрибут, ?Значення): істинне, якщо обране користувачем
% значення атрибута дорівнює Значення.
choose(Attr, Value) :-
    ( fact(Attr, Chosen) -> true            % вже питали — беремо з пам'яті
    ; ask_choice(Attr, Chosen) ),           % інакше — питаємо
    Chosen == Value.

ask_choice(Attr, Chosen) :-
    question(Attr, Prompt, Options),
    nl, writeln(Prompt),
    show_options(Options, 1),
    read_number(N),
    ( nth1(N, Options, Chosen)
    -> assertz(fact(Attr, Chosen))
    ;  writeln('   Невірний номер. Спробуйте ще раз.'),
       ask_choice(Attr, Chosen) ).

show_options([], _).
show_options([H | T], N) :-
    format('   ~w) ~w~n', [N, H]),
    N1 is N + 1,
    show_options(T, N1).

read_number(N) :-
    write('   Ваш вибір (номер): '),
    read(Term),
    ( integer(Term) -> N = Term
    ; writeln('   Потрібно ввести число. Ще раз.'), read_number(N) ).

% yesno(+Ключ): істинне, якщо користувач відповів "так".
yesno(Key) :-
    ( fact(Key, Value) -> true
    ; ask_yesno(Key, Value) ),
    Value == yes.

ask_yesno(Key, Value) :-
    yn_question(Key, Prompt),
    nl, format('~w (yes/no): ', [Prompt]),
    read(Ans),
    ( member(Ans, [yes, y, так, т]) -> Value = yes, assertz(fact(Key, yes))
    ; member(Ans, [no, n, ні, н])   -> Value = no,  assertz(fact(Key, no))
    ; writeln('   Введіть yes або no.'), ask_yesno(Key, Value) ).

:- initialization((nl, writeln('Введіть  start.  щоб почати консультацію.'))).
