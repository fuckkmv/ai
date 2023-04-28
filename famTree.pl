parent(stan, pam).
parent(luna, pam).
parent(pam, tom).
parent(jenny, tom).
parent(pam, ron).
parent(jenny, ron).
parent(jack, perry).
parent(dua, perry).
parent(jack, pammy).
parent(dua, pammy).
parent(tom, wendy).
parent(perry, wendy).
parent(tom, shawn).
parent(perry, shawn).
parent(pammy, john).
parent(roch, john).

%male fact
male(stan).
female(pam).
male(tom).
male(ron).
male(jack).
male(shawn).
male(roch).
male(john).

%female fact
female(luna).
female(jenny).
female(dua).
female(pammy).
female(perry).
female(wendy).

%spouse fact
spouse(stan, luna).
spouse(pam, jenny).
spouse(tom, perry).
spouse(jack, dua).
spouse(pammy, roch).

%spouse rule
spouse(X, Y):-
	spouse(Y, X).

%husband rule
husband(X, Y):-
	/*parent(X, Z), 
	parent(Y, Z), 
	male(X), 
	X\=Y.*/
	wife(Y, X).

%wife rule
wife(X, Y):-
	parent(X, Z), 
	parent(Y, Z), 
	female(X), 
	X\=Y.
	%husband(Y, X).

%child rule
child(X, Y):-
	parent(Y, X).

%son rule
son(X, Y):-
	parent(Y, X), 
	male(X).

%daughter rule
daughter(X, Y):-
	parent(Y, X), 
	female(X).

%father rule
father(X, Y):-
	parent(X, Y), 
	male(X).

%mother rule
mother(X, Y):-
	parent(X, Y), 
	female(X).

%GrandParent rule
grandparent(X, Y):-
	parent(X, Z), 
	parent(Z, Y).

%GrandFather rule
grandfather(X, Y):-
	parent(X, Z), 
	parent(Z, Y), 
	male(X).

%GrandMother rule
grandmother(X, Y):-
	parent(X, Z), 
	parent(Z, Y), 
	female(X).

%GrandChild rule
grandchild(X, Y):-
	grandparent(Y, X).

%GrandSon rule
grandson(X, Y):-
	grandparent(Y, X), 
	male(X).

%GrandDaughter rule
granddaughter(X, Y):-
	grandparent(Y, X), 
	female(X).

%Ancestor rule
ancestor(X, Z):-
	parent(X, Z).

ancestor(X, Z):-
	parent(X, Y), 
	ancestor(Y, Z).

%Sibling rule
sibling(X, Y):-
	parent(Z, X), 
	parent(Z, Y), 
	X\=Y.

%Sister rule
sister(X, Y):-
	parent(Z, X), 
	parent(Z, Y), 
	X\=Y, 
	female(X).

%Brother rule
brother(X, Y):-
	parent(Z, X), 
	parent(Z, Y), 
	X\=Y, 
	male(X).

%Uncle rule
uncle(X, Y):-
	parent(Z, Y), 
	sibling(X, Z), 
	X\=Z, 
	male(X).

uncle(X, Y):-
	parent(Z, Y), 
	sibling(W, Z), 
	W\=Z, 
	female(W), 
	husband(X, W).

%Aunt rule
aunt(X, Y):-
	parent(Z, Y), 
	sibling(X, Z), 
	X\=Z, 
	female(X).

aunt(X, Y):-
	parent(Z, Y), 
	sibling(W, Z), 
	W\=Z, 
	male(W), 
	wife(X, W).

%Nephew rule
nephew(X, Y):-
	sibling(Z, Y), 
	parent(Z, X), 
	male(X).

%Niece rule
niece(X, Y):-
	sibling(Z, Y), 
	parent(Z, X), 
	female(X).

%Cousin rule
cousin(X, Y):-
	parent(Z, X), 
	parent(W, Y), 
	sibling(Z, W).