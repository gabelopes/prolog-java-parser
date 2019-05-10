:- module(arrays, [
  extract/3
]).

% Extracts elements from list by functor name.
extract([], _, []).
extract([Member|Rest], Name, [Member|Partial]) :-
  Member =.. [Name|_],
  extract(Rest, Name, Partial).
extract([_|Rest], Name, Partial) :-
  extract(Rest, Name, Partial).