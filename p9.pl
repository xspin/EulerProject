%Special Pythagorean triplet
%Problem 9
%A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
%
%a2 + b2 = c2
%For example, 32 + 42 = 9 + 16 = 25 = 52.
%
%There exists exactly one Pythagorean triplet for which a + b + c = 1000.
%Find the product abc.


pt(333, _, []) :-!.
pt(A, B, R):-
	%A < B,
	C is 1000 - A - B,
	%C > B,
	T is A^2+B^2,
	Bt is (B+1) mod 501,
	(
		%(Bt = 0, At is A+1);
		%(Bt \=0, At is A)
		Bt = 0 -> At is A+1 ; At is A
	),
	%writeln([A,B]),
	(
		%(T =:= C^2, R = [A,B,C], writeln(R));
		%(T =\= C^2, pt(At, Bt, Rt), R = Rt)
		T =:= C^2 -> 
			(pt(At, Bt, Rt), append([[A,B,C]],Rt,R));
			(pt(At, Bt, Rt), R = Rt)
	).

go :-
	pt(0,2, R),
	[A, B, C] = R,
	T is A*B*C,
	write(R),tab(2),
	writeln(T),fail.
