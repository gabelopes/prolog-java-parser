:- module(common, [
  whitespace/2,
  space/2,
  rspace/2,
  class/2,
  extends/2,
  implements/2,
  comma/2,
  left_parenthesis/2,
  right_parenthesis/2,
  left_brace/2,
  right_brace/2,
  semicolon/2
]).

% Parsers
whitespace --> " ", space.
whitespace --> [].

space --> blank, space.
space --> [].

% Required space.
rspace --> blank, space.
rspace --> blank.

blank --> " ".
blank --> "\n".
blank --> "\f".
blank --> "\r".
blank --> "\t".
blank --> "\v".

% Keywords
class --> "class".
extends --> "extends".
implements --> "implements".

% Tokens
comma --> ",".
semicolon --> ";".
left_parenthesis --> "(".
right_parenthesis --> ")".
left_brace --> "{".
right_brace --> "}".