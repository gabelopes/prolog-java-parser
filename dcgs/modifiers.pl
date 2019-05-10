:- module(modifiers, [modifiers/3]).

:- use_module(common, [rspace/2]).

modifiers([]) --> [].
modifiers([Modifier]) --> modifier(Modifier).
modifiers([Modifier|Rest]) -->
  modifier(Modifier),
  rspace,
  modifiers(Rest).

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
