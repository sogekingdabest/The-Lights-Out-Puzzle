%%% LightsOutParallelTogAdya %%%
%% Descripcion %%
% Esta implmentacion del puzzle LightOut nos permite clicar en mas de una casilla a la vez
% aunque estas sean adyacentes.
%%% %%%

#program initial.
action(tog(X,Y)) :- cell(X,Y).

#program dynamic.
{ o(A) : _action(A) }.


h(cell(X,Y), on) :- 'h(cell(X,Y), off), cambio(X,Y).
h(cell(X,Y), off) :- 'h(cell(X,Y), on), cambio(X,Y).
h(cell(X,Y), off) :- 'h(cell(X,Y), off), not cambio(X,Y).
h(cell(X,Y), on) :- 'h(cell(X,Y), on), not cambio(X,Y).

% cambios de cinco tog
cambio(X,Y) :- o(tog(X,Y)), o(tog(X+1,Y)), o(tog(X,Y+1)), o(tog(X-1,Y)),o(tog(X,Y-1)).

% cambios de uno tog
cambio(X,Y) :- o(tog(X,Y)), not o(tog(X+1,Y)), not o(tog(X,Y+1)), not o(tog(X-1,Y)), not o(tog(X,Y-1)).
cambio(X,Y) :- not o(tog(X,Y)), o(tog(X+1,Y)), not o(tog(X,Y+1)), not o(tog(X-1,Y)), not o(tog(X,Y-1)).
cambio(X,Y) :- not o(tog(X,Y)), not o(tog(X+1,Y)), o(tog(X,Y+1)), not o(tog(X-1,Y)), not o(tog(X,Y-1)).
cambio(X,Y) :- not o(tog(X,Y)), not o(tog(X+1,Y)), not o(tog(X,Y+1)), o(tog(X-1,Y)), not o(tog(X,Y-1)).
cambio(X,Y) :- not o(tog(X,Y)), not o(tog(X+1,Y)), not o(tog(X,Y+1)), not o(tog(X-1,Y)), o(tog(X,Y-1)).

% cambios de tres tog
cambio(X,Y) :- not o(tog(X,Y)), not o(tog(X+1,Y)), o(tog(X,Y+1)), o(tog(X-1,Y)), o(tog(X,Y-1)).
cambio(X,Y) :- not o(tog(X,Y)), o(tog(X+1,Y)), not o(tog(X,Y+1)), o(tog(X-1,Y)), o(tog(X,Y-1)).
cambio(X,Y) :- not o(tog(X,Y)), o(tog(X+1,Y)), o(tog(X,Y+1)), not o(tog(X-1,Y)), o(tog(X,Y-1)).
cambio(X,Y) :- not o(tog(X,Y)), o(tog(X+1,Y)), o(tog(X,Y+1)), o(tog(X-1,Y)), not o(tog(X,Y-1)).

cambio(X,Y) :- o(tog(X,Y)), not o(tog(X+1,Y)), not o(tog(X,Y+1)), o(tog(X-1,Y)), o(tog(X,Y-1)).
cambio(X,Y) :- o(tog(X,Y)), not o(tog(X+1,Y)), o(tog(X,Y+1)), not o(tog(X-1,Y)), o(tog(X,Y-1)).
cambio(X,Y) :- o(tog(X,Y)), not o(tog(X+1,Y)), o(tog(X,Y+1)), o(tog(X-1,Y)), not o(tog(X,Y-1)).

cambio(X,Y) :- o(tog(X,Y)), o(tog(X+1,Y)), not o(tog(X,Y+1)), not o(tog(X-1,Y)), o(tog(X,Y-1)).
cambio(X,Y) :- o(tog(X,Y)), o(tog(X+1,Y)), not o(tog(X,Y+1)), o(tog(X-1,Y)), not o(tog(X,Y-1)).

cambio(X,Y) :- o(tog(X,Y)), o(tog(X+1,Y)), o(tog(X,Y+1)), not o(tog(X-1,Y)), not o(tog(X,Y-1)).

h(F,V) :- 'h(F,V), not c(F).
c(F)   :- 'h(F,V), h(F,W), V!=W.


toggled(X,Y) :- o(tog(X,Y)).
toggled(X,Y) :- 'toggled(X,Y).
:- o(tog(X,Y)), 'toggled(X,Y).

#program final.
:- h(cell(_,_),on).
#minimize { 1,X,Y : toggled(X,Y) }.

#show o/1.