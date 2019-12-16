:- dynamic crew/2.

crew(2, "Jabbawockeez").
crew(3, "Kinjaz").

atom:style('OneTwo', true, true, '').
atom:style(oneTwo, false, true, '').
atom:style(one_two, false, false, '_').
atom:style('One_Two', true, true, '_').
atom:style(style(A, B, C), A, B, C).

:- public emacs_prolog_mode:style/3.

emacs_prolog_mode:style(A, C, F) :-
    user:
    (   syntax_colour(A, D),
        copy_term(A, B),
        numbervars(B, 0, _),
        term_to_atom(B, C),
        '__aux_maplist/3_style_attribute+0'(D, E),
        (   E==[]
        ->  F= @(default)
        ;   F=..[style|E]
        )
    ).

:- multifile prolog_colour:style/2.


:- dynamic style/2.

style(1, "Hip-Hop").
style(2, "Popping").
style(3, "Breakdance").

:- dynamic dancer/4.

dancer(2, 2, 3, "Ben Chung").
dancer(3, 3, 1, "Anthony Lee").
dancer(4, 2, 1, "Phil Tayag").
dancer(6, 3, 3, "Steven Lor").

