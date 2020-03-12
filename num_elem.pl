/*

	num_elem(?Lista, ?Num)
		es cierto si Num unifica con el
		número de elementos de la lista Lista
		
	+: debe tener un valor
	-: debe no terner valor

	num_elem([], 0).  Numero de elementos de una lista vacia = 0
	
	num_elem(lista, Num2) :- num_elem(lista-1, )
	
	Variable _ : no quiero que se use para nada
	
	USOS DEL PROGRAMA
	1. Obtener el numero de elementos de una lista
		?- num_elem([1,2],Num). 
		Num = 2.
	
	2. Generar una lista con N elementos
		?- num_elem(Lista,3).
		Lista = [_4688, _4694, _4700] .
	
	3. Verificar si una lista contiene N elementos
		num_elem([1,2],2).
		true.

*/

num_elem([], 0).

num_elem([_|Resto], Num2) :- 
	num_elem(Resto, Num), Num2 is Num+1.

