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

;; MAGENTA: Exceptional Data
((setting_value) @boolean
 (#match? @boolean "\\c^(true|false|yes|no|on|off)$"))

((setting_value) @constant.builtin
 (#match? @constant.builtin "\\c^(null|none)$"))
