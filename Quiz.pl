/******************************************************************************

Question:
The predicate quiz(Answer) asserts that Answer is the list of t and f 
constraints that is the correct answer to the quiz.

******************************************************************************/

/*FINDS THE CORRECT SOLUTION TO THE QUIZ BY CALLING SOLUTION PREDICATE
WHICH USES CONSTRAINT LOGIC PROGRAMMING*/

quiz(Answer):- solution([A,B,C,D,E]), 
 convert(A, A1), convert(B, B1), convert(C, C1),
 convert(D, D1), convert(E, E1), 
 Answer = ([A1, B1, C1, D1, E1]).

/*CONVERT PREDICATE CHANGES 0 to f and 1 to t */
convert(X, X1):- X = 0, X1 = f.
convert(X, X2):- X = 1, X2 = t.

solution( [A, B, C, D, E]) :- Vars = [A, B, C, D, E], Vars ins 0..1,
 teresea([A,B,C,D,E], Steresa), tim([A,B,C,D,E], Stim), 
 tania([A,B,C,D,E], Stania), tom([A,B,C,D,E], Stom),
 tony([A,B,C,D,E], Stony),
 Stania #> Steresa, Stom #> Stim, Stony #< 5, 
 label([A,B,C,D,E]).

teresea([A,B,C,D,E], Steresa):- 
A #= 1 #<==> TA, 
B #= 1 #<==> TB,
C #= 0 #<==> TC, 
D #= 1 #<==> TD, 
E #= 0 #<==> TE, 
sum([TA,TB,TC,TD,TE],Steresa).

tim([A,B,C,D,E], Stim):-
A #= 0 #<==> TA, 
B #= 1 #<==> TB,
C #= 1 #<==> TC, 
D #= 1 #<==> TD, 
E #= 0 #<==> TE, 
sum([TA,TB,TC,TD,TE],Stim).

tania([A,B,C,D,E], Stania):-
A #= 1 #<==> TA, 
B #= 0 #<==> TB,
C #= 1 #<==> TC, 
D #= 1 #<==> TD, 
E #= 0 #<==> TE, 
sum([TA,TB,TC,TD,TE],Stania).

tom([A,B,C,D,E], Stom):-
A #= 0 #<==> TA, 
B #= 1 #<==> TB,
C #= 1 #<==> TC, 
D #= 0 #<==> TD, 
E #= 1 #<==> TE, 
sum([TA,TB,TC,TD,TE],Stom).

tony([A,B,C,D,E], Stony):-
A #= 1 #<==> TA, 
B #= 0 #<==> TB,
C #= 1 #<==> TC, 
D #= 0 #<==> TD, 
E #= 1 #<==> TE, 
sum([TA,TB,TC,TD,TE],Stony).

sum([TA, TB, TC, TD, TE], Sum):-
Sum #= TA + TB + TC + TD + TE.


/****************************************
Test cases for quiz
The names of the tests are the test description.
****************************************/

:- begin_tests(e7_1).
test(correct_answer, [nondet]):- quiz([f,f,t,f,t]).
test(incorrect_answer, [fail]):- quiz([t,f,t,f,t]).
test(answer_in_one_and_zero, [fail]):- quiz([0,0,1,0,1]).
:- end_tests(e7_1).