;; queries/tmux/highlights.scm
;; extends

;; RED: Halts & Exceptions
((command) @keyword.exception
  (#any-of? @keyword.exception "kill-pane" "kill-server" "kill-session" "kill-window"))

;; GREEN: Triggers & Mutations
(command) @function.builtin
(hidden_keyword) @function.builtin

(source_file_directive
  (command) @keyword.import)

(function_name) @function.call

[
  "#{"
  "}"
] @function.builtin

;; YELLOW: Routing & Logic
[
  (if_keyword)
  (elif_keyword)
  (else_keyword)
  (endif_keyword)
] @keyword.conditional

"?" @keyword.conditional

;; BLUE: Structure & Definition
(command_line_option) @keyword.modifier

"=" @keyword.modifier

[
  ";"
  "';'"
  ","
  ":"
] @punctuation.delimiter

[
  "#["
  "]"
  "["
  "{"
] @punctuation.bracket

"#" @punctuation.special

;; CYAN: Ephemeral State
[
  (option)
  (name)
] @variable

((option) @variable.builtin
  (#not-lua-match? @variable.builtin "^@"))

(attribute) @property

;; MAGENTA: Exceptional Data
(backslash_escape) @string.escape

;; WHITE: Generic Data
[
  "'"
  (str_single_quotes)
  (str_double_quotes)
  (path)
] @string

(int) @number

;; BLACK: Comments
(comment) @comment @spell
