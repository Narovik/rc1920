
/*

  Árboles genéricos
  
      1    arbol1
	/ | \ 
   3  4  5
 
   Árbol más pequeño (n0): a(E, [])
   
   a(E, ListaHijos)
  
   ListaHijo es una lista de árboles

             1        arbol2
		   / | \ 
          2  3  4
		 /|\    |
        5 6 7   8
*/
arbol1(a(1, [a(3,[]), a(4, []), a(5, [])])).
arbol2(
   a(1,[a(2,[a(5,[]),a(6,[]),a(7,[])]),a(3,[]),a(4,[a(8,[])])])
).

/*
pertenece(E, Arbol)
 es cierto si el elemento E pertenece al 
 árbol genérico Arbol.
*/

/* predicado para árboles */

pertenece(E, a(E, _)).
pertenece(E, a(Et, ListaHijos)):-
  E \= Et, 
  pertenece(E, ListaHijos).

/* predicado para lista de árboles */

pertenece(E, [Cab|_]):-
  pertenece(E, Cab).
pertenece(E, [_|Resto]):-
  pertenece(E, Resto).  
  
  
/* cuenta_nodos(+Arbol, -N)
   es cierto si N unifica con el número de
   nodos del árbol genérico Arbol
*/

/*  predicado para árboles */


cuenta_nodos(a(_,Lista),N) :-
	cuenta_nodos_lista(Lista,N2),N is N2+1.

/* predicado para lista de árboles */

cuenta_nodos_lista([],0).

cuenta_nodos_lista([C|R],N):- cuenta_nodos_lista(R,N1),
	cuenta_nodos(C,N2), N is N1+N2.

/* hojas(+Arbol, -ListaHojas)
	es cierto si ListaHojas unifica con la lista
	de las etiquetas de las hojas del árbol Arbol
	(examen)
*/

/* predicado para árboles */
hojas(a(E, []), [E]).  /* Es una hoja */

hojas(a(_, ListaHijos), R):-
	ListaHijos \= [],
	hojas_lista(ListaHijos, R).

/* predicado para lista de árboles */

hojas_lista([], []).
hojas_lista([Cabeza|Resto], ListaHojas):- 
	hojas(Cabeza, ListaHojas1),  hojas_lista(Resto, ListaHojas2), /* cuidado con cada llamada, uno es arbol y otro lista! */
	append(ListaHojas1, ListaHojas2, ListaHojas).

/* crea_arbol_generico(+Lista, -Arbol)
	es cierto si Arbol unifica con un arbol
	binario que contiene los elementos
	de una lista
*/


creaArbol([Cab|Resto], a(Cab, R)) :- creaLista(Resto, R).
 
creaLista([], []).
creaLista([Cab|Resto], [a(Cab, [])|R]) :-
	creaLista(Resto, R).
 
 /* opcion igor */
 
crea([E],a(E,[])).
crea([Cabeza|Resto], a(Cabeza,[Arbol])) :- crea(Resto,Arbol).


/* anchura(+Arbol, -Lista)
  es cierto si Lista unifica con una lista
  que contiene las etiquetas del recorrido 
  en anchura del árbol genérico A.
*/  

