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

;; CYAN: Ephemeral State & References
(pattern_char) @property
(bracket_char) @property

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

;; BLACK: Comments
(comment) @comment @spell
