
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


/* divide(?N1, ?N2, ?R, ?Resto)
	es cierto si R unifica con el número 
	de veces que puede restarse N2 a N1.
	Resto unificará con el resto de la división entera.
	
	divide(s(s(s(0))), s(s(0)), R, Resto). % 3/2
	
	R=s(0).		% Cociente 1
	Resto=s(0).  % Resto 1
	
	------
	
	2	5	->	R=0, Resto=2.
	
	5	2	->	R=2, Resto=1.
	
	3	2	->	R=1, Resto=1.
	
*/
divide(N1, N2, 0, N1):- menor(N1, N2).

divide(N1, N2, s(R), Resto):-
resta(N1, N2, N12),
divide(N12, N2 , R, Resto).
  
*/ Necistamos una funcion axuliar:
	menor(?N1, ?N2).
	es cierto si N1 es menor que N2 en
	aritmética de Peano.
	
	Ejecución:
	menor(s(s(s(0))), s(s(s(s(3))))).
	menor(s(s(0)), s(s(s(0)))).
	menor(s(0), s(s(0))).
	menor(0, s(0)).
	true.
*/

menor(0, s(_)).

menor(s(N1),  s(N2)) :-
	menor(N1,  N2).

	
	

