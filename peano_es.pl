
/* suma(?N1, ?N2, ?R)
   cierto si R unifica con la suma
   de N1 y N2 en aritmética de Peano

   1. P(n0)
   2. P(n-1) -> P(n), Para n > n0
      P(N):- N2 is N-1, P(N2).
*/

suma(0, N2, N2).
suma(s(N1), N2, s(R)):- suma(N1, N2, R).

/*
p2d(+P, -D)
es cierto si D unifica con el decimal
equivalente a número P en aritmética de Peano.

*/

p2d(0,0).
p2d(s(N), R2):-  p2d(N, R), R2 is R+1.


/* resta(?N1, ?N2, ?R).
  es cierto si R unifica con la resta de N1 menos
  N2 en aritmética de Peano.
*/

resta(N1, 0, N1).
resta(N1, s(N2), R):-  resta(N1, N2, s(R)). 

/* multiplica(?N1, ?N2, ?R)
	es cierto si R unifica con la suma múltiple de N1
	N2 veces en aritmética de Peano.
	
	Ejemplo:
	p2d(P1,2),p2d(P2,3),multiplica(P1,P2,R),p2d(R,D).
		P1 = s(s(0)),
		P2 = s(s(s(0))),
		R = s(s(s(s(s(s(0)))))),
		D = 6 .

	Ejemplo reversible (cosas que resulten al multiplicar 4):
	p2d(R,4),multiplica(P1,P2,R),p2d(P1,D1),p2d(P2,D2).
		R = P1, P1 = s(s(s(s(0)))),
		P2 = s(0),
		D1 = 4,
		D2 = 1 ;
		
		R = s(s(s(s(0)))),
		P1 = P2, P2 = s(s(0)),
		D1 = D2, D2 = 2 ;
		...
*/

multiplica(_, 0, 0).
%multiplica(N1, s(0), N1).
multiplica(N1, s(N2), R)  :- multiplica(N1, N2, R1), suma(N1,R1,R).

	

