in(X, [X | _]).
in(X, [_ | Tail]) :- in(X, Tail).

sum([], 0).
sum([Head | Tail], S) :- sum(Tail, S1), S is S1 + Head.

/* 1 - Find the last element of a list */
last([X], X).
last([_ | Tail], X) :- last(Tail, X). 

/* 2 - Find the last but one element of a list */
lastbo([X,_|[]], X).
lastbo([_ | Tail], X) :- lastbo(Tail, X).

/* 3 - Find the K'th element of a list. */
kth([X|_], X, 1).
kth([Head | Tail], X, K) :- K1 is K-1, kth(Tail, X, K1).

/* 4 - Find the number of elements of a list. */
len([], 0).
len([_ | Tail], L) :- len(Tail, L1), L is L1+1.

/* 5 - Reverse a list. */
rev(L, R) :- revaux(L, [], R).
revaux([], R, R).
revaux([Head | Tail], A, R) :- revaux(Tail, [H | A], R).

/* 6 - Find out whether a list is a palindrome. */
pal(L) :- rev(L, L).


