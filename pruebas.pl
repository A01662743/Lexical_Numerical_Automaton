% Load the main code file.
:- ["automata.pl"].

% Define test cases.

% Test case 1: Input list is empty.
test_0 :-
    parse_list([]).

% Test case 2: Input lists that lead to an accepting state.
test_1 :-
    parse_list([0]).

test_2 :-
    parse_list([1]).  

test_3 :-
    parse_list([2]).  

test_4 :-
    parse_list([0,0]).  

test_5 :-
    parse_list([0,1]).  

test_6 :-
    parse_list([0,2]).  

test_7 :-
    parse_list([1,0]).  

test_8 :-
    parse_list([1,1]).  

test_9 :-
    parse_list([1,2]).  

test_10 :-
    parse_list([2,0]).  

test_11 :-
    parse_list([2,1]).  

test_12 :-
    parse_list([2,2]).  

test_13 :-
    parse_list([0,0,1]).  

test_14 :-
    parse_list([0,0,2]).  

test_15 :-
    parse_list([0,1,0]).  

test_16 :-
    parse_list([0,1,1]).  

test_17 :-
    parse_list([0,1,2]).  

test_18 :-
    parse_list([0,2,0]).  

test_19 :-
    parse_list([0,2,1]).  

test_20 :-
    parse_list([0,2,2]).  

test_21 :-
    parse_list([1,0,0]). 

test_22 :-
    parse_list([1,0,1]).  

test_23 :-
    parse_list([1,0,2]).  

test_24 :-
    parse_list([1,1,2]).  

test_25 :-
    parse_list([1,2,0]).  

test_26 :-
    parse_list([1,2,1]).  

test_27 :-
    parse_list([1,2,2]).  

test_28 :-
    parse_list([2,0,0]).  

test_29 :-
    parse_list([2,0,1]).  

test_30 :-
    parse_list([2,0,2]).  

test_31 :-
    parse_list([2,1,1]).  

test_32 :-
    parse_list([2,1,2]).  

test_33 :-
    parse_list([2,2,0]).  

test_34 :-
    parse_list([2,2,1]).   

test_35 :-
    parse_list([0,1,1,2,1,2]). 

% Test case 3: Input lists that don't lead to an accepting state.
test_36 :-
    parse_list([1,1,0,1]). 

test_37 :-
    parse_list([1,1,2,2]). 

test_38 :-
    parse_list([1,0,1,1]). 

test_39 :-
    parse_list([1,0,1,2]). 

test_40 :-
    parse_list([2,2,1,1,0,1]). 

test_41 :-
    parse_list([1,1,0,2,1,0,1,1]). 

test_42 :-
    parse_list([2,0,2,1,1,2,2,1,0,0]). 

test_43 :-
    parse_list([0,0,1,0,1,2,0]). 

test_44 :-
    parse_list([0,1,1,2,2,1,0,1,1]). 

test_45 :-
    parse_list([0,2,2,1,1,2,2,1,1,0]). 

% Run the tests.
run_tests :-

    nl, write(' --- Accepted States --- '), nl, nl,

    test_0,
    test_1,
    test_2,
    test_3,
    test_4,
    test_5,
    test_6,
    test_7,
    test_8,
    test_9,
    test_10,
    test_11,
    test_12,
    test_13,
    test_14,
    test_15,
    test_16,
    test_17,
    test_18,
    test_19,
    test_20,
    test_21,
    test_22,
    test_23,
    test_24,
    test_25,
    test_26,
    test_27,
    test_28,
    test_29,
    test_30,
    test_31,
    test_32,
    test_33,
    test_34,
    test_35,

    nl, write(' --- Denied States ---'), nl, nl,

    test_36,
    test_37,
    test_38,
    test_39,
    test_40,
    test_41,
    test_42,
    test_43,
    test_44,
    test_45.