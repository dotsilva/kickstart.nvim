;; extends

;; RED: Halts, Exceptions & Deletions
((method) @keyword.exception
  (#any-of? @keyword.exception "DELETE"))

;; GREEN: Triggers & Mutations
((method) @function.builtin
  (#any-of? @function.builtin "POST" "PUT" "PATCH"))

;; BLUE: Structure & Definition
((comment
  name: (_)) @keyword.declaration
  (#set! priority 105))

((comment
  name: (_) @keyword.function)
  (#set! priority 110))

((comment
  "=" @punctuation.delimiter)
  (#set! priority 120))

(header
  name: (_) @tag)

(variable_declaration
  "=" @keyword.modifier)

(variable_declaration
  "@" @keyword.modifier)

[
  "{{"
  "}}"
  "{%"
  "%}"
] @punctuation.bracket

(header
  ":" @punctuation.delimiter)

">" @punctuation.delimiter

(request_separator) @punctuation.delimiter

(res_handler_script 
  ">" @punctuation.delimiter)

;; CYAN: Ephemeral State
((method) @variable.builtin
  (#any-of? @variable.builtin "GET" "HEAD" "OPTIONS" "TRACE" "CONNECT"))

(identifier) @variable

;; WHITE: Generic Data
((comment
  value: (_) @string)
  (#set! priority 110))

(request
  url: (_) @string)

(http_version) @string

(header
  value: (_) @string)

(variable_declaration
  (value) @string)

(status_code) @number
(status_text) @string

(external_body
  path: (_) @string)

;; BLACK: Comments

;; YELLOW: Routing & Logic (Redirections)
;; Global capture ensures it catches the token regardless of AST nesting
"<" @keyword.conditional
