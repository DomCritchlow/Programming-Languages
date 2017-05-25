% Dominic Critchlow
% CSCI 4230
% Assignment 5

% #1
mother(Sect2other,Child) :- female(Sect2other) , parent(Sect2other,Child).
% #2
father(Father,Child) :- male(Father), parent(Father,Child).
% #3
sibling(Sibling1, Sibling2) :- parent(B,Sibling1), parent(B,Sibling2), not(Sibling1=Sibling2).
% #4
first_cousin(Cousin1,Cousin2) :- parent(A,Cousin1),parent(B,Cousin2), sibling(A,B).
% #5
ancestor(Ancestor,Descendant) :- parent(Ancestor,Descendant).
ancestor(Ancestor,Descendant) :- parent(Ancestor,B), ancestor(B,Descendant).
% #6
common_acestor(Ancestor,Person1,Person2) :- ancestor(Ancestor,Person1), ancestor(Ancestor,Person2), not(Person1=Person2).
% #7
do_reverse([],[]).
do_reverse([H|T],Reverse):-do_reverse(T,Rest),append(Rest,[H],Reverse).
% #8
insert_item(Item, [], [Item]).
insert_item(Item, [H|T], [Item,H|T]) :- Item @< H, !.
insert_item(Item, [H|R], [H|T]) :- insert_item(Item, R, T).
% #9
insertion_sort([],[]).
insertion_sort([H|T],SortedList):- insertion_sort(T,L),insert_item(H,L,SortedList).
% #10
is_union([],Set2,Set2).
is_union([H|T],Set2,Union) :- member(H,Set2),  is_union(T,Set2,Union).
is_union([H|T],Set2,[H|Union]) :- not(member(H,Set2)), is_union(T,Set2,Union).
% #11
is_intersection([],_,[]).
is_intersection([H|T],Set2,[H|Intersection]) :- member(H,Set2), is_intersection(T,Set2,Intersection).
is_intersection([H|T],Set2,Intersection) :- not(member(H,Set2)), is_intersection(T,Set2,Intersection).
