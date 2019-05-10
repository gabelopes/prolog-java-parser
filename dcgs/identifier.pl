:- module(identifier, [identifier/3]).

identifier(Identifier) -->
  identifier_head(Characters),
  { atom_chars(Identifier, Characters) }.

identifier_head([Letter]) --> letter(Letter).
identifier_head([Letter|Rest]) --> letter(Letter), identifier_tail(Rest).

identifier_tail([Alphanumeric]) --> alphanumeric(Alphanumeric).
identifier_tail([Alphanumeric|Rest]) --> alphanumeric(Alphanumeric), identifier_tail(Rest).

letter(Letter) --> lowercase(Letter).
letter(Letter) --> uppercase(Letter).

alphanumeric(Alphanumeric) --> letter(Alphanumeric).
alphanumeric(Alphanumeric) --> digit(Alphanumeric).

uppercase('A') --> "A".
uppercase('B') --> "B".
uppercase('C') --> "C".
uppercase('D') --> "D".
uppercase('E') --> "E".
uppercase('F') --> "F".
uppercase('G') --> "G".
uppercase('H') --> "H".
uppercase('I') --> "I".
uppercase('J') --> "J".
uppercase('K') --> "K".
uppercase('L') --> "L".
uppercase('M') --> "M".
uppercase('N') --> "N".
uppercase('O') --> "O".
uppercase('P') --> "P".
uppercase('Q') --> "Q".
uppercase('R') --> "R".
uppercase('S') --> "S".
uppercase('T') --> "T".
uppercase('U') --> "U".
uppercase('V') --> "V".
uppercase('W') --> "W".
uppercase('X') --> "X".
uppercase('Y') --> "Y".
uppercase('Z') --> "Z".

lowercase('a') --> "a".
lowercase('b') --> "b".
lowercase('c') --> "c".
lowercase('d') --> "d".
lowercase('e') --> "e".
lowercase('f') --> "f".
lowercase('g') --> "g".
lowercase('h') --> "h".
lowercase('i') --> "i".
lowercase('j') --> "j".
lowercase('k') --> "k".
lowercase('l') --> "l".
lowercase('m') --> "m".
lowercase('n') --> "n".
lowercase('o') --> "o".
lowercase('p') --> "p".
lowercase('q') --> "q".
lowercase('r') --> "r".
lowercase('s') --> "s".
lowercase('t') --> "t".
lowercase('u') --> "u".
lowercase('v') --> "v".
lowercase('w') --> "w".
lowercase('x') --> "x".
lowercase('y') --> "y".
lowercase('z') --> "z".

digit('0') --> "0".
digit('1') --> "1".
digit('2') --> "2".
digit('3') --> "3".
digit('4') --> "4".
digit('5') --> "5".
digit('6') --> "6".
digit('7') --> "7".
digit('8') --> "8".
digit('9') --> "9".
