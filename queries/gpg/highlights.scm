;; extends

;; ==========================================
;; GENERIC FALLBACKS 
;; ==========================================

;; WHITE: Generic Data
(string
  (content) @string)

[
  (value)
  "clear"
] @string

(filter_value) @string

;; BLUE: Structure & Definition
(option
  .
  _ @keyword.function)

"sensitive:" @keyword.modifier
"=" @punctuation.delimiter

(filter_scope) @module

[
  "\""
  "'"
  ","
] @punctuation.delimiter

;; ==========================================
;; SPECIFIC OVERRIDES 
;; ==========================================

;; WHITE OVERRIDES (Protected Values)
[
  (number)
  (expire_time)
  (iso_time)
] @number

;; YELLOW: Routing & Logic
[
  (filter_op0)
  (filter_op1)
  (filter_lc)
] @keyword.conditional

"!" @keyword.conditional
(option "no-" @keyword.conditional)

;; CYAN: Ephemeral State & References
(option
  (name) @variable.parameter)

(filter_name) @variable.parameter
(filter_property) @property
(key) @variable.builtin

(url) @property

((string
  (content) @property)
  (#lua-match? @property "^[~./]"))

;; MAGENTA: Exceptional Data
(format) @character.special

;; BLACK: Comments
(comment) @comment @spell
