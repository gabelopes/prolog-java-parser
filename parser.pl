:- use_module(dcgs/class, [parse_class/7]).

start :-
  read_file_to_string("/Users/sap/Downloads/Employee.java", Source, []),
  parse_class(Source, Modifiers, Name, Parent, Interfaces, Attributes, Methods),
  write("Modifiers are: "),
  writeln(Modifiers),
  write("Name is: "),
  writeln(Name),
  write("Extends: "),
  writeln(Parent),
  write("Implements interfaces: "),
  writeln(Interfaces),
  write("Attributes are: "),
  writeln(Attributes),
  write("Methods are: "),
  writeln(Methods).
  