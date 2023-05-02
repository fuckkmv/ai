/*Practical 1
Write a prolog program to calculate the sum of two numbers.*/
sum(X,Y,R):-
	R is X+Y.

/*Practical 2
Write a Prolog program to implement max(X, Y, M) so that M is the maximum of two numbers X and Y.*/
max(X,Y,M):-
	X>Y,
	M=X.

max(X,Y,M):-
	Y>=X,
	M=Y.

/*Practical 3
Write a program in PROLOG to implement factorial (N, F) where F represents thefactorial of a number N.*/
factorial(0,1).
factorial(N,F) :-
    N > 0,
    N1 is N-1,
    factorial(N1,Result1),
    F is Result1*N.

/*Practical 4
Write a program in PROLOG to implement generate_fib(N,T) where T represents theNth term of the fibonacci series.*/
generate_fib(1,0).
generate_fib(2,1).
generate_fib(N,T):-
	N1 is N-1,
	generate_fib(N1,T1),
	N2 is N-2,
	generate_fib(N2,T2),
	T is T1+T2.

/*Practical 5
Write a Prolog program to implement GCD of two numbers.*/
gcd(0, X, X):- 
	X > 0, !.
gcd(X, Y, R):- 
	X >= Y, X1 is X-Y, gcd(X1,Y,R).
gcd(X, Y, R):- 
	X < Y, X1 is Y-X, gcd(X1,X,R).


/*Practical 6
Write a Prolog program to implement power (Num,Pow, Ans) : where Num is raised to the power Pow to get Ans.*/
power(_,0,1).
power(Num,Pow,Ans) :- Pow1 is Pow - 1,
              pow(Num,Pow1,Ans1), Ans is Ans1*Num.

/*you can also simply use*/
power2(Num,Pow,Ans) :- Ans is Num**Pow.

/*Practical 7
Prolog program to implement multi (N1, N2, R) : where N1 and N2 denotes the numbers to be multiplied and R represents the result.*/
multi(N1 ,N2, R) :-
	R is N1*N2.

/*Practical 8
Write a Prolog program to implement memb(X, L): to check whether X is a member of L or not.*/
memb(X,[X|T]).
memb(X,[H|T]):-
	memb(X,T).

/*Practical 9
Write a Prolog program to implement conc (L1, L2, L3) where L2 is the list to be appended with L1 to get the resulted list L3.*/
conc([],L,L).
conc([X|L1],L2,[X|L3]):-
	conc(L1,L2,L3).

/*Practical 10
Write a Prolog program to implement reverse (L, R) where List L is original and List R is reversed list.*/
reverse([],[]).
reverse([X|L1],L2):-
	reverse(L1,L3),
	conc(L3,[X],L2).

/*Practical 11
Write a program in PROLOG to implement palindrome (L) which checks whether a list L is a palindrome or not.*/
palindrome(L):-
	reverse(L,L).

/*Practical 12
Write a Prolog program to implement sumlist(L, S) so that S is the sum of a given list L.*/
sumlist([],0).
sumlist([X|L1],S):-
	sumlist(L1,S1),
	S is S1+X.
	
/*Practical 13
Write a Prolog program to implement two predicates evenlength(List) and oddlength(List) so that they are true if their argument is a list of even or odd length respectively.*/
evenlength([]).
evenlength([_|T]):-
	oddlength(T).
oddlength([_|T]):-
	evenlength(T).

/*Practical 14
Write a Prolog program to implement nth_element (N, L, X) where N is the desired position, L is a list and X represents the Nth element of L.*/
nth_element(1, [X|_], X).
nth_element(K,[_|L],X):-
	nth_element(K1,L,X),
	K is K1+1.

/*Practical 15
Write a Prolog program to implement maxlist(L, M) so that M is the maximum number in the list.*/
maxlist([X],X).
maxlist([H|T],M):- 
	maxlist(T,M1), 
	H<M1 -> M is M1;
	M is H.

/*Practical 16
Write a prolog program to implement insert_nth (I, N, L, R) that inserts an item I into Nth position of list L to generate a list R.*/
insert_nth(I, 1, L, [I|L]).
insert_nth(I, N, [H|T], [H|R]):- 
	N1 is N-1,
	insert_nth(I, N1, T, R).

/*Practical 17
Write a Prolog program to implement delete_nth (N, L, R) that removes the element on Nth position from a list L to generate a list R.*/
delete_nth(1, [_|T], T).
delete_nth(N, [H|T], [H|R]):- 
	N1 is N-1,
	delete_nth(N1, T, R).

/*Practical 18
Write a program in PROLOG to implement merge (L1, L2, L3) where L1 is first ordered list and L2 is second ordered list and L3 represents the merged list.*/
merge([],L2,L2).
merge(L1,[],L1).
merge([H1|T1],[H2|T2],[H1|T3]):- 
	H1=<H2,
	merge(T1, [H2|T2], T3).
merge([H1|T1],[H2|T2],[H2|T3]):- 
	merge([H1|T1], T2, T3).




