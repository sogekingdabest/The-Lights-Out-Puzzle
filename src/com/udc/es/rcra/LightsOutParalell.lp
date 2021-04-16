#program initial.
action(tog(X,Y)) :- cell(X,Y).

adyacente(A,B,X,Y) :- cell(X,Y), cell(A,B), A==X+1, B==Y+1.
adyacente(A,B,X,Y) :- cell(X,Y), cell(A,B), A==X, B==Y+1.
adyacente(A,B,X,Y) :- cell(X,Y), cell(A,B), A==X+1, B==Y.
adyacente(A,B,X,Y) :- cell(X,Y), cell(A,B), A==X+2, B==Y.
adyacente(A,B,X,Y) :- cell(X,Y), cell(A,B), A==X, B==Y+2.
adyacente(A,B,X,Y) :- cell(X,Y), cell(A,B), A==X+1, B==Y-1.
adyacente(X,Y,A,B):- adyacente(A,B,X,Y).

#program dynamic.
{ o(E) : _action(E) }.

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


:- o(tog(X,Y)), o(tog(X1,Y1)), (X,Y)!=(X1,Y1), _adyacente(X1,Y1,X,Y).

toggled(X,Y) :- o(tog(X,Y)).
toggled(X,Y) :- 'toggled(X,Y).
:- o(tog(X,Y)), 'toggled(X,Y).

#program final.
:- h(cell(_,_),on).
%#minimize { 1,X,Y : toggled(X,Y) }.

#show o/1.