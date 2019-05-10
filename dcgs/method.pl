:- module(method, [method/3]).

:- use_module(common).
:- use_module(identifier).
:- use_module(modifiers).

method(method(Modifiers, Return, Name, Parameters)) -->
  modifiers(Modifiers),
  rspace,
  identifier(Return),
  rspace,
  identifier(Name),
  space,
  left_parenthesis,
  space,
  parameters(Parameters),
  space,
  right_parenthesis,
  space,
  left_brace,
  space,
  right_brace.

parameters([]) --> [].
parameters(Parameters) --> parameters_production(Parameters).

parameters_production([Parameter]) --> parameter(Parameter).
parameters_production([Parameter|Rest]) -->
  parameter(Parameter),
  space,
  comma,
  space,
  parameters_production(Rest).

parameter(parameter(Modifiers, Type, Name)) -->
  modifiers(Modifiers),
  rspace,
  identifier(Type),
  rspace,
  identifier(Name).