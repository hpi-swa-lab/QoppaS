as yet unclassified
serializedGrammar
^ 'Qoppa <: BuiltInRules {

File = SExpression*

List
  = "(" "vau" SExpression* ")"  -- vau
  |  "(" SExpression* ")"  -- list
  |  "(" SExpression+ "." SExpression ")" -- explicit_cdr

SExpression
  = List   -- list
   | atom -- atom
   | "''" List -- simple_quoted
   | "`" SExpression  -- quasi_quoted

atom
  = number -- number
   | "#" ("t" | "f") -- boolean
   | "''" standard_char+ -- symbol
   | "\"" string_char* "\"" -- string
   | "null" ~ standard_char -- null
   | standard_char+  -- variable

string_char
	= ~("\"" | "\\") any
	| escaped_char

escaped_char 
  = "\\\\" -- backslash
   | "\\\"" -- escaped_quote
   | "\\" standard_char -- escaped

lineTerminator
  = "\n" | "\r" | "\r\n"| "\u2028" | "\u2029"

number
    = "-"? digit+ ("." digit+)?

space
  += ";" (~lineTerminator any)* -- single-line-comment

standard_char
  = letter | digit | ":" | "+" | "?" | "!"
   | "-" | "*" | "/" | "<" | ">" | "=" | "_"}'

