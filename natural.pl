% ----------------------------------------
% natural(+N)
% es cierto si N es un numero natural
% ----------------------------------------

/* 	Comentarios:
	1) natural(1).
	2) si natural(n-1) -> natural(n).

	En ProLog se escribe al revés a->b es b:-a.
		natural(N) :- N>1, N2 is N-1, natural(N2).
		
	Las variables siempre empiezan por mayuscula
	Su ambito de visibilidad es solo una linea que termina con punto.
	
	Operador de asignacion is
	
*/

natural(1).
natural(N) :- N>1, N2 is N-1, natural(N2). 	% Si todo lo que hay a la dcha es cierto,
											% la parte izquierda es cierto
											% a ^ b ^ c -> d en prolog se escribe:
											% d :- a,b,c.