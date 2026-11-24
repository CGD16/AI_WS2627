parent(alice, bob).
parent(bob, charlie).
parent(alice, david).

male(bob).
male(charlie).
female(alice).
female(david).

% Regeln
grandparent(X, Y) :- parent(X, Z), parent(Z, Y).
sibling(X, Y) :- parent(Z, X), parent(Z, Y), X \= Y.
ancestor(X, Y) :- parent(X, Y).
ancestor(X, Y) :- parent(Z, Y), ancestor(X, Z).
descendant(X, Y) :- ancestor(Y, X).

% --- Neu hinzugefügt ---
grandfather(X, Y) :- grandparent(X, Y), male(X).
grandmother(X, Y) :- grandparent(X, Y), female(X).
uncle(X, Y) :- parent(Z, Y), sibling(X, Z), male(X).
aunt(X, Y) :- parent(Z, Y), sibling(X, Z), female(X).