:- module(class, [parse_class/7]).

:- use_module(identifier).
:- use_module(common).
:- use_module(modifiers).
:- use_module(attribute).
:- use_module('../utilities/arrays', [extract/3]).

% Grammar
class(Modifiers, Identifier, Parent, Interfaces, Members) -->
  space,
  modifiers(Modifiers),
  rspace,
  class,
  rspace,
  identifier(Identifier),
  rspace,
  extensions(Parent, Interfaces),
  space,
  left_brace,
  space,
  body(Members),
  space,
  right_brace,
  space.

extensions(Parent, Interfaces) -->
  extends(Parent),
  rspace,
  implements(Interfaces).
extensions(Parent, Interfaces) -->
  implements(Interfaces),
  rspace,
  extends(Parent).

extends([]) --> [].
extends(Parent) --> 
  extends,
  rspace,
  identifier(Parent).

implements([]) --> [].
implements(Interfaces) -->
  implements,
  rspace,
  interfaces(Interfaces).

interfaces([Interface]) --> identifier(Interface).
interfaces([Interface|Rest]) -->
  identifier(Interface),
  space,
  comma,
  space,
  interfaces(Rest).

body([]) --> [].
body([Member]) --> member(Member).
body([Member|Rest]) -->
  member(Member),
  space,
  body(Rest).

member(attribute(Modifiers, Type, Name)) --> attribute(Modifiers, Type, Name).

% Parser
parse_class(Source, Modifiers, Identifier, Parent, Interfaces, Attributes, Methods) :-
  string_codes(Source, Codes),
  phrase(class(Modifiers, Identifier, Parent, Interfaces, Members), Codes),
  extract(Members, 'attribute', Attributes),
  extract(Members, 'method', Methods).
