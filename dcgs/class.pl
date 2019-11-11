:- module(class, [parse_class/7]).

:- use_module(identifier).
:- use_module(common).
:- use_module(modifiers).
:- use_module(attribute).
:- use_module(method).
:- use_module('../utilities/arrays', [extract/3]).

% Grammar
class(Modifiers, Identifier, Parent, Interfaces, Members) -->
  space,
  modifiers(Modifiers),
  rspace,
  class,
  rspace,
  identifier(Identifier),
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
  implements(Interfaces).
extensions(Parent, Interfaces) -->
  implements(Interfaces),
  extends(Parent).

extends(Parent) -->
  rspace,
  extends,
  rspace,
  identifier(Parent).
extends([]) --> [].

implements(Interfaces) -->
  rspace,
  implements,
  rspace,
  interfaces(Interfaces).
implements([]) --> [].

interfaces([Interface|Rest]) -->
  identifier(Interface),
  space,
  comma,
  space,
  interfaces(Rest).
interfaces([Interface]) --> identifier(Interface).

body([Member|Rest]) -->
  member(Member),
  space,
  body(Rest).
body([Member]) --> member(Member).
body([]) --> [].

member(attribute(Modifiers, Type, Name)) --> attribute(Modifiers, Type, Name).
member(method(Modifiers, Return, Name, Parameters)) --> method(Modifiers, Return, Name, Parameters).

% Parser
parse_class(Source, Modifiers, Identifier, Parent, Interfaces, Attributes, Methods) :-
  string_codes(Source, Codes),
  phrase(class(Modifiers, Identifier, Parent, Interfaces, Members), Codes),
  extract(Members, 'attribute', Attributes),
  extract(Members, 'method', Methods).
