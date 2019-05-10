:- module(terms, [atoms_chars/2]).

atoms_chars([], []).
atoms_chars([Atom|AtomsRest], [Chars|CharsRest]) :-
  atom_chars(Atom, Chars),
  atoms_chars(AtomsRest, CharsRest).