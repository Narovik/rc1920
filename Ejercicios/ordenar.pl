/*
	Burbuja(+Lista, -R)
	Es cierto si R unifica con una lista
	que contiene los elementos de Lista ordenados
	de menor a mayor utilizando el método de burburja.
	
	En este caso, construimos la inducción no por el
	tamaño de la lista, sino ordenando en cada paso
	la lista un poco más.

*/

burbuja(Lista, Lista):- ordenada(Lista). % Si la lista está ya ordenada, 
													 % la entrada es igual a la salida.
													 
burbuja(Lista, R2) :-
	append(Lista1, [E1,E2|Lista2], Lista),
	E1 > E2,  								   	 % Si están mal ordenados,
	append(Lista1, [E2, E1|Lista2], R), 	 % R nueva lista con esos elementos ordenados
	burbuja(R, R2). 							 % Volvemos a comprobar con una lista un poco más cerca del final

	
/*
	ordenada(+Lista)
	Es cierto si los elementos de 
	Lista están ordenados de menor a mayor.
*/

ordenada([]). 									% Lista vacía está ordenada
ordenada([_]).								% Lista con 1 elemento está ordenada

ordenada([E1, E2|Resto]) :- 				% Si el resto está ordenado y 
	E1 =< E2, ordenada([E2|Resto]). 	% el primero y el segundo también,
													% está ordenada.
													

