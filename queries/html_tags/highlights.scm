;; NO EXTENDS - This completely replaces the default parser to kill @markup violations

;; GENERIC FALLBACKS 
;; WHITE: Generic Data
(text) @string @spell
(attribute_value) @string

;; BLUE: Structure & Definition
(tag_name) @tag

"=" @punctuation.delimiter

[
  "<"
  ">"
  "</"
  "/>"
  "\""
  "'"
] @punctuation.bracket

;; SPECIFIC OVERRIDES 
;; CYAN: Ephemeral State & References
(attribute_name) @tag.attribute

((attribute
  (attribute_name) @_attr
  (quoted_attribute_value
    (attribute_value) @property))
  (#any-of? @_attr "href" "src"))

((attribute
  (attribute_name) @_attr
  (attribute_value) @property)
  (#any-of? @_attr "href" "src"))

;; BLACK: Comments
(comment) @comment @spell
