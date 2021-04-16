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

#program final.
:- h(cell(_,_),on).

#show o/1.