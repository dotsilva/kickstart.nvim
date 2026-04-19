;; extends

;; YELLOW: Routing & Logic
[
  "|"
  "="
  "!"
] @keyword.conditional

;; BLUE: Structure & Definition
[
  "("
  ")"
  "(?"
  "(?:"
  "(?<"
  "<"
  ">"
  "["
  "]"
  "{"
  "}"
] @punctuation.bracket

"," @punctuation.delimiter

;; CYAN: Ephemeral State
(group_name) @property
"\\k" @variable.builtin

;; MAGENTA: Exceptional Data
[
  "*"
  "+"
  "?"
  "-"
  (lazy)
] @character.special

[
  (start_assertion)
  (end_assertion)
  (any_character)
] @character.special

[
  (control_letter_escape)
  (character_class_escape)
  (control_escape)
  (boundary_assertion)
  (non_boundary_assertion)
] @string.escape

;; WHITE: Generic Data
(identity_escape) @string
(class_character) @string
(decimal_digits) @number
