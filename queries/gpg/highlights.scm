;; queries/gpg/highlights.scm
;; extends

;; YELLOW: Routing & Logic
[
  (filter_op0)
  (filter_op1)
  (filter_lc)
] @keyword.conditional

"!" @keyword.conditional
(option "no-" @keyword.conditional)

;; BLUE: Structure & Definition
(option
  .
  _ @keyword.function)

"sensitive:" @keyword.modifier
"=" @keyword.modifier

(filter_scope) @module

[
  "\""
  "'"
  ","
] @punctuation.delimiter

;; CYAN: Ephemeral State
(option
  (name) @variable.parameter)

(filter_name) @variable.parameter
(filter_property) @property
(key) @variable.builtin

;; MAGENTA: Exceptional Data
(format) @character.special

;; WHITE: Generic Data
(string
  (content) @string)

[
  (value)
  "clear"
] @string

(url) @string
(filter_value) @string

[
  (number)
  (expire_time)
  (iso_time)
] @number

;; BLACK: Comments
(comment) @comment @spell
