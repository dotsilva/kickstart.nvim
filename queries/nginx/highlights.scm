;; queries/nginx/highlights.scm
;; extends

;; RED: Halts & Exceptions
((keyword) @keyword.exception
  (#any-of? @keyword.exception "return" "break"))

;; GREEN: Triggers & Mutations
((keyword) @function.builtin
  (#any-of? @function.builtin "rewrite" "proxy_pass" "fastcgi_pass" "uwsgi_pass" "scgi_pass" "memcached_pass" "grpc_pass" "set" "add_header" "echo" "try_files"))

;; YELLOW: Routing & Logic
[
  "if"
  "map"
] @keyword.conditional

(location_modifier) @keyword.conditional

;; BLUE: Structure & Definition
(keyword) @keyword.function

"location" @keyword.function

"=" @keyword.modifier

";" @punctuation.delimiter

[
  "{"
  "}"
] @punctuation.bracket

;; CYAN: Ephemeral State
(var) @variable.builtin

(directive
  (variable
    (keyword) @variable.parameter))

;; MAGENTA: Exceptional Data
(boolean) @boolean

[
  (auto)
  (constant)
  (level)
  (connection_method)
  (condition)
] @constant.builtin

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

;; BLACK: Comments
(comment) @comment @spell
