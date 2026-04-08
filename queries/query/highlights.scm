;; queries/query/highlights.scm
;; extends

;; GREEN: Triggers & Mutations
(predicate
  name: (identifier) @function.builtin)

((program
  .
  (comment)*
  .
  (comment) @keyword.import @nospell)
  (#lua-match? @keyword.import "^;+ *inherits *:"))

((program
  .
  (comment)*
  .
  (comment) @keyword.directive @nospell)
  (#lua-match? @keyword.directive "^;+ *extends *$"))

;; YELLOW: Routing & Logic
(negated_field
  "!" @keyword.conditional)

;; BLUE: Structure & Definition
(named_node
  name: (identifier) @type)

(missing_node
  name: (identifier) @type)

(field_definition
  name: (identifier) @tag)

"MISSING" @keyword.function

[
  "["
  "]"
  "("
  ")"
] @punctuation.bracket

[
  ":"
  "/"
  "."
] @punctuation.delimiter

[
  "@"
  "#"
] @punctuation.special

(predicate
  "." @punctuation.special)

(predicate_type) @punctuation.special

;; CYAN: Ephemeral State
(capture
  (identifier) @variable)

((predicate
  name: (identifier) @_name
  parameters: (parameters
    .
    (capture)?
    .
    (identifier) @property))
  (#eq? @_name "set"))

;; MAGENTA: Exceptional Data
(quantifier) @character.special

"_" @character.special

(escape_sequence) @string.escape

((predicate
  name: (identifier) @_name
  parameters: (parameters
    (string
      "\"" @string
      "\"" @string) @string.regexp))
  (#any-of? @_name "match" "not-match" "vim-match" "not-vim-match" "lua-match" "not-lua-match"))

((predicate
  name: (identifier) @_name
  parameters: (parameters
    (string
      "\"" @string
      "\"" @string) @string.regexp
    .
    (string) .))
  (#any-of? @_name "gsub" "not-gsub"))

;; WHITE: Generic Data
(string) @string

((parameters
  (identifier) @number)
  (#match? @number "^[-+]?[0-9]+(.[0-9]+)?$"))

;; BLACK: Comments
(comment) @comment @spell

((comment) @comment @nospell
  (#lua-match? @comment "^;+%s*format%-ignore%s*$"))
