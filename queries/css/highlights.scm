;; queries/css/highlights.scm
;; extends

;; GREEN: Triggers & Mutations
(function_name) @function.builtin

[
  "+"
  "-"
  "*"
  "/"
] @function.builtin

;; YELLOW: Routing & Logic
[
  "~"
  ">"
  "="
  "^="
  "|="
  "~="
  "$="
  "*="
] @keyword.conditional

[
  "and"
  "or"
  "not"
  "only"
] @keyword.conditional

;; BLUE: Structure & Definition
[
  "@media"
  "@charset"
  "@namespace"
  "@supports"
  "@keyframes"
  (at_keyword)
] @keyword.function

"@import" @keyword.function

[
  (to)
  (from)
] @keyword.function

(tag_name) @tag
(class_name) @type
(id_name) @tag
(namespace_name) @module

[
  "#"
  ","
  "."
  ":"
  "::"
  ";"
] @punctuation.delimiter

[
  "{"
  ")"
  "("
  "}"
  "["
  "]"
] @punctuation.bracket

;; CYAN: Ephemeral State
[
  (property_name)
  (feature_name)
] @property

(attribute_name) @tag.attribute

(pseudo_element_selector
  "::"
  (tag_name) @tag.attribute)

(pseudo_class_selector
  (class_name) @tag.attribute)

(keyframes_name) @variable
(nesting_selector) @variable.builtin

((property_name) @variable
  (#lua-match? @variable "^[-][-]"))

((plain_value) @variable
  (#lua-match? @variable "^[-][-]"))

;; MAGENTA: Exceptional Data
(important) @constant.builtin
(universal_selector) @character.special

;; WHITE: Generic Data
[
  (string_value)
  (color_value)
  (unit)
] @string

(integer_value) @number
(float_value) @number.float
