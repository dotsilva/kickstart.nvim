;; queries/editorconfig/highlights.scm
;; extends

;; YELLOW: Routing & Logic
"!" @keyword.conditional

;; BLUE: Structure & Definition
(property) @tag

"=" @keyword.modifier

[
  "["
  "]"
  "{"
  "}"
] @punctuation.bracket

[
  ","
  ".."
  "/"
  "-"
] @punctuation.delimiter

;; MAGENTA: Exceptional Data
(header
  (glob) @character.special)

(wildcard) @character.special

(character_escape) @string.escape

;; WHITE: Generic Data
(string) @string
(character) @string
(integer) @number

;; BLACK: Comments
(comment) @comment @spell
