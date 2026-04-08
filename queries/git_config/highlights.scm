;; queries/git_config/highlights.scm
;; extends

;; YELLOW: Routing & Logic
((section_name) @keyword.conditional
  (#any-of? @keyword.conditional "includeIf" "includeif"))

;; BLUE: Structure & Definition
(section_name) @markup.heading

((section_name) @keyword.function
  (#eq? @keyword.function "include"))

(variable
  (name) @tag)

"=" @keyword.modifier

(section_header
  [
    "\""
    (subsection_name)
  ] @module)

[
  "["
  "]"
] @punctuation.bracket

;; MAGENTA: Exceptional Data
[
  (true)
  (false)
] @boolean

(escape_sequence) @string.escape

;; WHITE: Generic Data
(string) @string
(integer) @number

((string) @string
  (#lua-match? @string "^[.]?[.]?[/]"))

((string) @string
  (#lua-match? @string "^[~]"))

((section_header
  (section_name) @_name
  (subsection_name) @string)
  (#any-of? @_name "credential" "url"))

((variable
  (name) @_name
  value: (string) @string)
  (#any-of? @_name "insteadOf" "insteadof"))

;; BLACK: Comments
(comment) @comment @spell
