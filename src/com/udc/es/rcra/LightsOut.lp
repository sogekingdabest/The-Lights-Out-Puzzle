%%% LightsOut %%%
%% Descripción %%
% Esta implmentación del puzzle LightsOut solo nos permitiría clickar en una casilla a la vez por estado.
%%% %%%

#program initial.
action(tog(X,Y)) :- cell(X,Y).

#program dynamic.
1 { o(A) : _action(A) } 1.

h(cell(X,Y), on) :- 'h(cell(X,Y), off), o(tog(X,Y)).
h(cell(X+1,Y), on) :- 'h(cell(X+1,Y), off), o(tog(X,Y)).
h(cell(X-1,Y), on) :- 'h(cell(X-1,Y), off), o(tog(X,Y)).
h(cell(X,Y+1), on) :- 'h(cell(X,Y+1), off), o(tog(X,Y)).
h(cell(X,Y-1), on) :- 'h(cell(X,Y-1), off), o(tog(X,Y)).

h(cell(X,Y), off) :- 'h(cell(X,Y), on), o(tog(X,Y)).
h(cell(X+1,Y), off) :- 'h(cell(X+1,Y), on), o(tog(X,Y)).
h(cell(X-1,Y), off) :- 'h(cell(X-1,Y), on), o(tog(X,Y)).
h(cell(X,Y+1), off) :- 'h(cell(X,Y+1), on), o(tog(X,Y)).
h(cell(X,Y-1), off) :- 'h(cell(X,Y-1), on), o(tog(X,Y)).

h(F,V) :- 'h(F,V), not c(F).
c(F)   :- 'h(F,V), h(F,W), V!=W.

#program final.
:- h(cell(_,_),on).

#show o/1.