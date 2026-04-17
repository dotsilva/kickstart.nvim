;; RED: Halts, Exceptions & Deletions
((method) @keyword.exception
  (#eq? @keyword.exception "DELETE"))

;; GREEN: Triggers & Mutations
((method) @function.builtin
  (#any-of? @function.builtin "POST" "PUT" "PATCH" "GRAPHQL"))

;; CYAN: Ephemeral State & Observations
((method) @variable.builtin
  (#any-of? @variable.builtin "GET" "HEAD" "OPTIONS" "TRACE" "CONNECT" "LIST" "WEBSOCKET"))

(identifier) @variable

;; YELLOW: Routing & Logic (Redirections & Script Bounds)
[
  ">"
  "<"
  "{%"
  "%}"
] @keyword.conditional

;; BLUE: Structure & Definition
(header 
  name: (header_entity) @tag)

(request_separator) @punctuation.delimiter

(variable_declaration
  "@" @keyword.modifier)

(variable_declaration
  "=" @keyword.modifier)

[
  "{{"
  "}}"
] @punctuation.bracket

(header
  ":" @punctuation.delimiter)

;; WHITE: Generic Data
(value) @string
(target_url) @string
(http_version) @string
(status_text) @string
(path) @string
(status_code) @number

;; BLACK: Comments
(comment) @comment @spell
