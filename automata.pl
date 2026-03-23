%start state.
start_state(s).

%transitions.
transition(s, b, 0).
transition(s, a, 1).
transition(s, b, 2).

transition(a, c, 0).
transition(a, d, 1).
    transition(a, b, 2).

    transition(b, b, 0).
transition(b, a, 1).
    transition(b, b, 2).

    transition(c, b, 0).
transition(c, e, 1).
    transition(c, b, 2).

transition(d, f, 0).
    transition(d, a, 1).
transition(d, g, 2).

    transition(e, c, 0).
transition(e, h, 1).
transition(e, h, 2).

    transition(f, b, 0).
transition(f, i, 1).
    transition(f, b, 2).

    transition(g, b, 0).
    transition(g, a, 1).
transition(g, j, 2).

transition(h, h, 0).
transition(h, h, 1).
transition(h, h, 2).

transition(i, i, 0).
transition(i, i, 1).
transition(i, i, 2).

transition(j, j, 2).
transition(j, j, 1).
transition(j, j, 0).


%accepting states.
final_state(s).
final_state(a).
final_state(b).
final_state(c).
final_state(d).
final_state(e).
final_state(f).
final_state(g).

%Parse an input list.
parse_list(InputList) :-
    start_state(Start),
    write(InputList),
    parse_list(Start, InputList).

%Base case 1: Input list empty and current state in final states.
%prints 'Accepted'.
parse_list(State, []) :-
    final_state(State),
    write(': Accepted'), nl.

%Base case 2: Input list empty and current state is not in final states.
%prints 'Denied'.
parse_list(State, []) :-
    \+ final_state(State),
    write(': Denied'), nl.

%Recursive case: Process input list.
%determines the next state based on transitions.
parse_list(State, [Input|Rest]) :-
    transition(State, NextState, Input),
    parse_list(NextState, Rest).