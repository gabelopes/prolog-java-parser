:- module(modifiers, [modifiers/3]).

:- use_module(common, [rspace/2]).

modifiers([Modifier|Rest]) -->
  modifier(Modifier),
  rspace,
  modifiers(Rest).
modifiers([Modifier]) --> modifier(Modifier).
modifiers([]) --> [].

modifier('abstract') --> "abstract".
modifier('final') --> "final".
modifier('interface') --> "interface".
modifier('native') --> "native".
modifier('private') --> "private".
modifier('protected') --> "protected".
modifier('public') --> "public".
modifier('static') --> "static".
modifier('strictfp') --> "strictfp".
modifier('synchronized') --> "synchronized".
modifier('transient') --> "transient".
modifier('volatile') --> "volatile".
