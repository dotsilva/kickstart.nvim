;; extends

;; BLUE: Structure & Definition
[
  (bare_key)
  (quoted_key)
] @tag

"=" @keyword.modifier

[
  "."
  ","
] @punctuation.delimiter

[
  "["
  "]"
  "[["
  "]]"
  "{"
  "}"
] @punctuation.bracket

;; MAGENTA: Exceptional Data
(boolean) @boolean

[
  (local_date)
  (local_date_time)
  (local_time)
  (offset_date_time)
] @constant.builtin

(escape_sequence) @string.escape

;; WHITE: Generic Data
(string) @string

(integer) @number

(float) @number

;; BLACK: Comments
(comment) @comment @spell
