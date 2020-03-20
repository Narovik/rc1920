% Invertir lista en Prolog
%
% invertir(+Lista, -Resultado)
%	Es cierto si Resultado unifica con una lista que
% contiene los mismos elementos de la lista en orden inverso
%


invertir([],[]).								% P(n0)
invertir([Cabeza|Resto], R2) :-		% P(n-1) -> P(n)
		invertir(Resto, R),
		append(R, [Cabeza], R2).