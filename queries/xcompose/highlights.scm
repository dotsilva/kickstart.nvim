;; extends

;; GREEN: Triggers & Mutations
"include" @keyword.import

;; YELLOW: Routing & Logic
[
  "!"
  "~"
] @keyword.conditional

;; BLUE: Structure & Definition
[
  (modifier)
  "None"
] @keyword.modifier

[
  ":"
  "\""
] @punctuation.delimiter

[
  "<"
  ">"
] @punctuation.bracket

;; CYAN: Ephemeral State
(keysym) @property

[
  "%L"
  "%H"
  "%S"
] @variable.builtin

;; MAGENTA: Exceptional Data
((keysym) @constant.builtin
  (#eq? @constant.builtin "Multi_key"))

;; WHITE: Generic Data
(text) @string

[
  (octal)
  (hex)
] @number

;; BLACK: Comments
(comment) @comment @spell
