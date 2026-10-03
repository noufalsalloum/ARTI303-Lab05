male(abraham).
male(clancy).
male(herb).
male(homer).
male(bart).

female(mona).
female(jackie).
female(marge).
female(patty).
female(selma).
female(lisa).
female(maggie).
female(ling).

parent(abraham, herb).
parent(mona, herb).
parent(abraham, homer).
parent(mona, homer).

parent(clancy, marge).
parent(jackie, marge).
parent(clancy, patty).
parent(jackie, patty).
parent(clancy, selma).
parent(jackie, selma).

parent(homer, bart).
parent(marge, bart).
parent(homer, lisa).
parent(marge, lisa).
parent(homer, maggie).
parent(marge, maggie).

parent(selma, ling).

father(X, Y) :-
    parent(X, Y),
    male(X).
mother(X, Y) :-
    parent(X, Y),
    female(X).
son(X, Y) :-
    parent(Y, X),
    male(X).
daughter(X, Y) :-
    parent(Y, X),
    female(X).
brother(X, Y) :-
    father(P, X),
    father(P, Y),
    male(X),
    X \= Y.
sister(X, Y) :-
    father(P, X),
    father(P, Y),
    female(X),
    X \= Y.
grandfather(X, Y) :-
    parent(X, Z),
    parent(Z, Y),
    male(X).
aunt(X, Y) :-
    sister(X, P),
    parent(P, Y).
uncle(X, Y) :-
    brother(X, P),
    parent(P, Y).
cousin(X, Y) :-
    parent(P1, X),
    parent(P2, Y),
    father(G, P1),
    father(G, P2),
    P1 \= P2,
    X \= Y.
ancestor(X, Y) :-
    parent(X, Y).
ancestor(X, Y) :-
    parent(X, Z),
    ancestor(Z, Y).

/*

QUERY TESTS


1. FATHER
?- father(homer, bart).
true.

?- father(X, lisa).
X = homer.


2. MOTHER
?- mother(marge, lisa).
true.

?- mother(X, homer).
X = mona.


3. SON
?- son(bart, homer).
true.

?- son(X, abraham).
X = herb ;
X = homer.


4. DAUGHTER
?- daughter(lisa, marge).
true.

?- daughter(X, clancy).
X = marge ;
X = patty ;
X = selma.


5. BROTHER
?- brother(homer, herb).
true.

?- brother(X, homer).
X = herb.


6. SISTER
?- sister(lisa, bart).
true.

?- sister(X, marge).
X = patty ;
X = selma.


7. GRANDFATHER
?- grandfather(abraham, bart).
true.

?- grandfather(X, lisa).
X = abraham ;
X = clancy.


8. AUNT
?- aunt(patty, bart).
true.

?- aunt(X, lisa).
X = patty ;
X = selma.


9. UNCLE
?- uncle(herb, bart).
true.

?- uncle(X, lisa).
X = herb.


10. COUSIN
?- cousin(ling, bart).
true.

?- cousin(X, ling).
X = bart ;
X = lisa ;
X = maggie.


11. ANCESTOR
?- ancestor(abraham, bart).
true.

?- ancestor(X, maggie).
X = homer ;
X = marge ;
X = abraham ;
X = mona ;
X = clancy ;
X = jackie.

*/

