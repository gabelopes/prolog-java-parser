:- module(attribute, [attribute/5]).

:- use_module(common).
:- use_module(identifier).
:- use_module(modifiers).

attribute(Modifiers, Type, Name) -->
  modifiers(Modifiers),
  rspace,
  identifier(Type),
  rspace,
  identifier(Name),
  space,
  semicolon.
