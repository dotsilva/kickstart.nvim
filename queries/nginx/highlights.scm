;; BLACK: Comments
(comment) @comment @spell

;; WHITE: Generic Data
(value) @string

[
  (string_literal)
  (quoted_string_literal)
  (file)
  (mask)
  (location_route)
] @string

[
  (numeric_literal)
  (time)
  (size)
  (cpumask)
] @number

;; MAGENTA: Exceptional Data
(boolean) @boolean

[
  (auto)
  (constant)
  (level)
  (connection_method)
] @constant.builtin

;; CYAN: Ephemeral State
(var) @variable.builtin

;; Catch variables passed as generic values (e.g., in `set`)
((value) @variable.builtin
  (#match? @variable.builtin "^\\$"))

(directive
  (variable
    (keyword) @variable.parameter))

;; BLUE: Structure & Definition
(keyword) @keyword.function

"location" @keyword.function

";" @punctuation.delimiter

[
  "{"
  "}"
] @punctuation.bracket

;; YELLOW: Routing & Logic
[
  "if"
  "map"
] @keyword.conditional

[
  (location_modifier)
  "="
  "~"
  "^~"
] @keyword.conditional

;; GREEN: Triggers & Mutations
((keyword) @function.builtin
  (#any-of? @function.builtin "rewrite" "proxy_pass" "fastcgi_pass" "uwsgi_pass" "scgi_pass" "memcached_pass" "grpc_pass" "set" "add_header" "echo" "try_files"))

;; RED: Halts & Exceptions
((keyword) @keyword.exception
  (#any-of? @keyword.exception "return" "break"))

;; =========================================================
;; CONDITION BLOCK: Engine Limitation Bypass
;; =========================================================

;; 1. Base condition node = BLUE (Captures `(` and `)`)
(condition) @punctuation.bracket

;; 2. Sliced inner condition = WHITE (Nginx AST parses this as one solid unbreakable string)
((condition) @string
  (#offset! @string 0 1 0 -1))
