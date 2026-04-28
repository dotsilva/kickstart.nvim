;;extends

;; BLACK: Passive
(comment) @comment @spell
((comment) @comment @nospell
  (#lua-match? @comment "^;+%s*format%-ignore%s*$"))

;; WHITE: Generic Data
(string) @string
((parameters (identifier) @number)
  (#match? @number "^[-+]?[0-9]+(.[0-9]+)?$"))

;; MAGENTA: Exceptional Data
"_" @character.special
(escape_sequence) @string.escape

;; CYAN: Ephemeral State (Captures)
(capture (identifier) @variable)

;; BLUE: Structure & Definition
(named_node name: (identifier) @type)
(missing_node name: (identifier) @type)
(field_definition name: (identifier) @tag)

"MISSING" @keyword.function

[ "[" "]" "(" ")" ] @punctuation.bracket
[ ":" "/" "." ] @punctuation.delimiter

[ "@" "#" ] @punctuation.special
(predicate "." @punctuation.special)
(predicate_type) @punctuation.special

;; YELLOW: Logic & Flow (Branching/Operators)
(negated_field "!" @keyword.conditional)
(quantifier) @keyword.conditional

;; Matching Predicates (Logic)
(predicate
  name: (identifier) @keyword.conditional)

;; Inherits/Extends (Engine routing)
((program . (comment)* . (comment) @keyword.import)
  (#lua-match? @keyword.import "^;+ *inherits *:"))
((program . (comment)* . (comment) @keyword.import)
  (#lua-match? @keyword.import "^;+ *extends *$"))

;; GREEN: Triggers & Mutations (State-changing Predicates)
((predicate
  name: (identifier) @function.builtin)
  (#any-of? @function.builtin "set!" "offset!" "gsub!" "rewrite!" "set" "gsub"))
