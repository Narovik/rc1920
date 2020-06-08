% P93 (***)  Puzle aritmético: Dada una lista de números enteros, 
% encontrar la forma correcta de insertar los signos aritméticos 
% de tal forma que el resultado sea una ecuación válida, 
% es decir, que se cumpla la igualdad
% (que ambos términos sean equivalentes). 
% Idea del problema original por Roland Beuret. 

% Ejemplo: Con la lista de enteros [2,3,5,7,11] podemos formar
% las ecuaciones  2-3+5+7 = 11  ó  2 = (3*5+7)/11 (y 10 más!).

% equation(+L,-LT, -RT) :- 
% Es cierto si LT y RT forman la lista de números enteros L 
%  y además ambos términos de la ecuación 
%   (izquierdo y derecho) son equivalentes.
% (Nótese el uso del operador relacional con evaluación de igualdad =:= )

equation(L,LT,RT) :-
   split(L,LL,RL),              % Descomponer la lista 
   term(LL,LT),                 % Construir el término izqdo
   term(RL,RT),                 % Construir el término dcho
   LT =:= RT.                   % Evaluar y comparar los términos

% term(+L,-T) :- 
% Es cierto si T es un término formado a partir de la lista 
% de números enteros L

term([X],X).                    % Un número en sí es un término unario

term(L,T) :-                    % Caso general: término binario
   split(L,LL,RL),              % Descomponer la lista L
   term(LL,LT),                 % Construir el término izqdo
   term(RL,RT),                 % Construir el término dcho
   binterm(LT,RT,T).            % Construir el término binario

% binterm(+LT,+RT,-T) :- 
% Es cierto si T es el término binario construido a partir de intercalar
% un operador aritmético entre los términos LT y RT
% (Nótese el uso del operador relacional con evaluación de desigualdad =\= )

binterm(LT,RT,LT+RT).	% Término suma
binterm(LT,RT,LT-RT).	% Término resta
binterm(LT,RT,LT*RT).	% Término multiplicación
binterm(LT,RT,LT/RT) :- RT =\= 0.   % Término división (evitando la div. por cero)

% split(+L, -L1, -L2) :- 
% Es cierto si L1 y L2 no están vacíos y forman la lista L

split(L,L1,L2) :- append(L1,L2,L), L1 = [_|_], L2 = [_|_].

% do(+L) :-
% Es cierto si se imprimen por pantalla todas las soluciones
% del problema, dada una lista de números L

do(L) :- 
   equation(L,LT,RT),
      writef('%w = %w\n',[LT,RT]),
   fail.
do(_).


% Ejemplo de uso:   ?- do([2,3,5,7,11]).
