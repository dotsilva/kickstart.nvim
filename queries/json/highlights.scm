;; extends

;; WHITE: Generic Data
(string_content) @string
(number) @number

;; BLUE: Structure & Definition
"\"" @punctuation.bracket

(pair
  key: (string
    (string_content) @tag)) ; Maps to BLUE via theme @tag

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

;; BLACK: Comments
(comment) @comment @spell

;; CONCEAL: UI Formatting
("\"" @conceal
  (#set! conceal ""))

((escape_sequence) @conceal
  (#eq? @conceal "\\\"")
  (#set! conceal "\""))
