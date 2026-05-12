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
sum_list(cons(X, T), sum(X, zero, O)) :- sum_list(T, O).
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
succ(X, s(X))
grater(X, zero, X)
gratero(zero, X, X)
grater(s(X), s(Y), O) :- grater(X, Y)
max(cons(X, nil), X).
max(cons(X, T), X, O) :- 

% Ex2.5: min-max(List, Min, Max)
% Min is the smallest element in List
% Max is the biggest element in List
% Suppose the list has at least one element


% Ex3.1: same(List1, List2)
% Are the two lists exactly the same?


% Ex3.2: all_bigger(List1, List2)
% all elements in List1 are bigger than those in List2, 1 by 1


% Ex3.3: sublist(List1, List2)
% List1 should contain elements all also in List2


% Ex4.1: seq(
