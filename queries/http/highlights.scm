;; queries/http/highlights.scm
;; extends

;; RED: Halts, Exceptions & Deletions
((method) @keyword.exception
  (#any-of? @keyword.exception "DELETE"))

;; GREEN: Triggers & Mutations
((method) @function.builtin
  (#any-of? @function.builtin "POST" "PUT" "PATCH"))

;; BLUE: Structure & Definition
(header
  name: (_) @tag)

(comment
  "=" @keyword.modifier)

(variable_declaration
  "=" @keyword.modifier)

(variable_declaration
  "@" @keyword.modifier)

(comment
  "@" @keyword.modifier
  name: (_) @keyword.function)

[
  "{{"
  "}}"
  "{%"
  "%}"
] @punctuation.bracket

(header
  ":" @punctuation.delimiter)

">" @punctuation.delimiter

;; CYAN: Ephemeral State
((method) @variable.builtin
  (#any-of? @variable.builtin "GET" "HEAD" "OPTIONS" "TRACE" "CONNECT"))

(identifier) @variable

;; WHITE: Generic Data
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
[
  (comment)
  (request_separator)
] @comment @spell
