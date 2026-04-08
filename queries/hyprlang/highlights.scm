;; queries/hyprlang/highlights.scm
;; extends

;; GREEN: Triggers & Mutations
[
  "source"
  "exec"
  "execr"
  "exec-once"
  "execr-once"
  "exec-shutdown"
] @function.builtin

[
  "rgb"
  "rgba"
] @function.builtin

[
  "-"
  "+"
] @function.builtin

;; BLUE: Structure & Definition
(keyword
  (name) @keyword.function)

(window_rule
  (name) @keyword.function)

(section
  (name) @module)

(assignment
  (name) @tag)

(mod) @keyword.modifier

"=" @keyword.modifier
"$" @keyword.modifier

[
  ","
  ";"
  ":"
  "x"
  "@"
] @punctuation.delimiter

[
  "("
  ")"
  "{"
  "}"
  "["
  "]"
] @punctuation.bracket

;; CYAN: Ephemeral State
(variable) @variable

(section
  device: (device_name) @variable.parameter)

;; MAGENTA: Exceptional Data
(boolean) @boolean

;; WHITE: Generic Data
[
  "deg"
  (string)
  (string_literal)
] @string

[
  (number)
  (legacy_hex)
  (angle)
  (hex)
] @number

;; BLACK: Comments
(comment) @comment @spell
