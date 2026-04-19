;; extends

;; BLUE: Structure & Definition
(pair
  key: (string) @tag)

[
  ","
  ":"
] @punctuation.delimiter

[
  "["
  "]"
  "{"
  "}"
] @punctuation.bracket

;; MAGENTA: Exceptional Data
[
  (true)
  (false)
] @boolean

(null) @constant.builtin

(escape_sequence) @string.escape

;; WHITE: Generic Data
(pair
  value: (string) @string)

(array
  (string) @string)

(number) @number

;; BLACK: Comments
(comment) @comment @spell

;; CONCEAL: UI Formatting
("\"" @conceal
  (#set! conceal ""))

((escape_sequence) @conceal
  (#eq? @conceal "\\\"")
  (#set! conceal "\""))
