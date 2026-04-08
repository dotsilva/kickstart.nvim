;; queries/gitignore/highlights.scm
;; extends

;; YELLOW: Routing & Logic
(negation) @keyword.conditional
(bracket_negation) @keyword.conditional

;; BLUE: Structure & Definition
[
  "["
  "]"
] @punctuation.bracket

[
  (directory_separator)
  (directory_separator_escaped)
] @punctuation.delimiter

;; MAGENTA: Exceptional Data
[
  (wildcard_char_single)
  (wildcard_chars)
  (wildcard_chars_allow_slash)
] @character.special

[
  (pattern_char_escaped)
  (bracket_char_escaped)
] @string.escape

(bracket_range
  "-" @character.special)

(bracket_char_class) @constant.builtin

;; WHITE: Generic Data
(pattern_char) @string
(bracket_char) @string

;; BLACK: Comments
(comment) @comment @spell
