;; extends

;; ==========================================
;; GENERIC FALLBACKS 
;; ==========================================

;; WHITE: Generic Data
(string) @string
(integer) @number

;; BLUE: Structure & Definition
(section_name) @markup.heading
(subsection_name) @module
(variable
  (name) @tag)

"=" @punctuation.delimiter

[
  "["
  "]"
  "\""
] @punctuation.bracket

;; ==========================================
;; SPECIFIC OVERRIDES 
;; ==========================================

;; GREEN: Triggers & Mutations
((section_name) @keyword.import
  (#any-of? @keyword.import "include" "includeif"))

(shell_command) @function.builtin

;; YELLOW: Routing & Logic
((section_name) @keyword.conditional
  (#any-of? @keyword.conditional "includeIf" "includeif"))

;; CYAN: Ephemeral State & References
((string) @property
  (#lua-match? @property "^[.]?[.]?[/]"))

((string) @property
  (#lua-match? @property "^[~]"))

((variable
  (name) @_name
  value: (string) @property)
  (#any-of? @_name "path" "url" "insteadOf" "insteadof" "fetch" "push"))

((section_header
  (section_name) @_name
  (subsection_name) @property)
  (#any-of? @_name "credential" "url" "includeIf" "includeif"))

;; MAGENTA: Exceptional Data
[
  (true)
  (false)
] @boolean

(escape_sequence) @string.escape

;; BLACK: Comments
(comment) @comment @spell
