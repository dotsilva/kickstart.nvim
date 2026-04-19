;; extends

;; BLUE
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

;; GREEN: Triggers & Mutations
(function_name) @function.builtin

;; Math operators inside calc() or similar functions
(binary_expression [ "+" "-" "*" "/" ] @function.builtin)

;; YELLOW: Routing & Logic
[
  "and"
  "or"
  "not"
  "only"
] @keyword.conditional

;; Selector Combinators (Routing)
(child_selector ">" @keyword.conditional)
(sibling_selector "~" @keyword.conditional)
(adjacent_sibling_selector "+" @keyword.conditional)
(namespace_selector "|" @keyword.conditional)

;; Attribute Query Logic
(attribute_selector [ "=" "^=" "|=" "~=" "$=" "*=" ] @keyword.conditional)

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
(universal_selector "*" @character.special)

;; WHITE: Generic Data
[
  (string_value)
  (color_value)
  (unit)
] @string

(integer_value) @number
(float_value) @number.float
(plain_value) @string

;; BLACK: Comments
(comment) @comment @spell
(js_comment) @comment @spell
