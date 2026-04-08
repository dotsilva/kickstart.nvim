;; queries/html_tags/highlights.scm
;; extends

;; BLUE: Structure & Definition
"=" @keyword.modifier

;; WHITE: Generic Data
(text) @string @spell

((attribute
  (attribute_name) @_attr
  (quoted_attribute_value
    (attribute_value) @string))
  (#any-of? @_attr "href" "src")
  (#set! @string url @string))
