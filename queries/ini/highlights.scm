;; queries/ini/highlights.scm
;; extends

;; BLUE: Structure & Definition
(section_name
  (text) @markup.heading)

(setting
  (setting_name) @tag)

"=" @keyword.modifier

[
  "["
  "]"
] @punctuation.bracket

;; WHITE: Generic Data
(setting_value) @string

;; BLACK: Comments
(comment) @comment @spell
