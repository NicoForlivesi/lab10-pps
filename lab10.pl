% 0a
a.
a.
a:- d.
b.
c:- a, b.
c:- c.
% 0b
a(1).
a(X):- b(X), b(X).
b(1).
b(2).
c(X):- b(X).
c(X):- b(X), c(X).

% Ex1.1: search(Elem, List)
search(X, cons(X, _)).
search(X, cons(_, Xs)) :- search(X, Xs).

% Ex1.2: search2(Elem, List)
% Looks for two consecutive occurrences of "Elem"
search2(X, cons(X, cons(X, _))).
search2(X, cons(_, Xs)) :- search2(X, Xs).

% Ex1.3: search_two(Elem, List)
% Looks for two occurences of Elem with any element in between
search_two(X, cons(X, cons(_, cons(X, _)))).
search_two(X, cons(_, Xs)) :- search_two(X, Xs).

% Ex1.4: search_anytwo(Elem, List)
% Looks for any Elem that occurs two times, anywhere
search_anytwo(X, cons(X, T)) :- search(X, T).
search_anytwo(X, cons(_, Xs)) :- search_anytwo(X, Xs).

% Ex2.1: size(List, Size)
% Size will contain the numbet of elements in List, written using
% notation zero, s(zero), s(s(zero))...
size(nil, zero).
size(cons(X, Xs), s(O)) :- size(Xs, O).

% Ex2.2: sum_list(List, Sum)
% sum_list(cons(zero, cons(s(s(zero)), cons(s(zero), nil))), X).
% yes, X/s(s(s(zero)))
sum_list(nil, zero).
sum_list(cons(X, T), O) :- sum_list(T, W), sum(X, W, O).
sum(X, zero, X).
sum(zero, X, X).
sum(X, s(Y), s(O)) :- sum(X, Y, O).
sum(s(X), Y, s(O)) :- sum(X, Y, O).

% Ex2.3: count(List, Element, NOccurrences)
% it uses count(List, Element, NOccurrencesSoFar, NOccurrences)
count(List, E, N) :- count(List, E, zero, N).
count(nil, E, N, N).
count(cons(E, L), E, N, M) :- count(L, E, s(N), M).
count(cons(E, L), E2, N, M) :- E \= E2, count(L, E2, N, M).

% Ex2.4: max(List, Max)
% Max is the biggest element in List
% Suppose the list has at least one element
grater(s(_), zero).
grater(s(X), s(Y)) :- grater(X, Y).
not_grater(zero, s(_)).
not_grater(zero, zero).
not_grater(s(X), s(Y)) :- not_grater(X, Y).
max(cons(X, T), O) :- max(T, X, O).
max(nil, Y, Y). 
% C'è un problema nel caso X=Y, serve il caso duale (not_grater), prima avevo messo
% grater(Y, X) anche nella seconda clausola 
max(cons(X, T), Y, O) :- grater(X, Y), max(T, X, O).
max(cons(X, T), Y, O) :- not_grater(X, Y), max(T, Y, O).

% Ex2.5: min-max(List, Min, Max)
% Min is the smallest element in List
% Max is the biggest element in List
% Suppose the list has at least one element
less(zero, s(_)).
less(s(X), s(Y)) :- less(X, Y).
min_max(cons(X, T), Min, Max) :- min_max(T, X, X, Min, Max).
min_max(nil, Min, Max, Min, Max).
min_max(cons(X, T), Min0, Max0, Min, Max) :- less(X, Min0), min_max(T, X, Max0, Min, Max).
min_max(cons(X, T), Min0, Max0, Min, Max) :- grater(X, Max0), min_max(T, Min0, X, Min, Max).
min_max(cons(X, T), Min0, Max0, Min, Max) :- not_grater(Min0, X), not_grater(X, Max0), min_max(T, Min0, Max0, Min, Max).
    
% Ex3.1: same(List1, List2)
% Are the two lists exactly the same?
equals(zero, zero).
equals(s(X), s(Y)) :- equals(X, Y).
same(nil, nil).
same(cons(X1, T1), cons(X2, T2)) :- equals(X1, X2), same(T1, T2).

% Ex3.2: all_bigger(List1, List2)
% all elements in List1 are bigger than those in List2, 1 by 1
all_bigger(nil, nil).
all_bigger(cons(X1, T1), cons(X2, T2)) :- grater(X1, X2), all_bigger(T1, T2).

% Ex3.3: sublist(List1, List2)
% List1 should contain elements all also in List2
sublist(nil, _).
sublist(cons(X, T), List2) :- search(X, List2), sublist(T, List2).

% Ex4.1: seq(N, E, List) --> List is cons(E, cons(..., cons(E, nil))) with size N
% Example: seq(s(s(s(zero))), a, cons(a, cons(a, cons(a, nil)))).
seq(zero, _, nil).
seq(s(N), E, cons(E, T)) :- seq(N, E, T).

% Ex4.2: seqR(N, List)
% Example: seqR(s(s(s(zero))), cons(s(s(zero)),cons(s(zero),cons(zero,nil)))).
seqR(zero, nil).
seqR(s(N), cons(N, T)) :- seqR(N, T).

% Ex4.3: seqR2(N, List) --> is cons(0, cons(1, cons(..., cons(N-1, nil))))
% Example: seqR2(s(s(s(zero))), cons(zero,cons(s(zero),cons(s(s(zero)),nil))))
seqR2(s(zero), cons(zero, nil)).
seqR2(s(N), L) :- seqR2(N, W), last(W, N, L).
last(nil, E, cons(E, nil)).
last(cons(H, T), E, cons(H, T2)) :- last(T, E, T2).

