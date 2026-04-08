;; queries/dockerfile/highlights.scm
;; extends

;; GREEN: Triggers & Mutations
[
  "RUN"
  "CMD"
  "ENTRYPOINT"
] @function.builtin

(expansion
  [
    "$"
    "{"
    "}"
  ] @function.builtin)

;; BLUE: Structure & Definition
[
  "FROM"
  "AS"
  "LABEL"
  "EXPOSE"
  "ADD"
  "COPY"
  "VOLUME"
  "USER"
  "WORKDIR"
  "ONBUILD"
  "STOPSIGNAL"
  "HEALTHCHECK"
  "SHELL"
  "MAINTAINER"
  "CROSS_BUILD"
] @keyword.function

[
  (heredoc_marker)
  (heredoc_end)
] @keyword.function

[
  ":"
  "@"
] @punctuation.delimiter

(image_spec
  (image_tag
    ":" @punctuation.special)
  (image_digest
    "@" @punctuation.special))

;; CYAN: Ephemeral State
[
  "ENV"
  "ARG"
] @variable.builtin

(arg_instruction
  .
  (unquoted_string) @variable)

(env_instruction
  (env_pair
    .
    (unquoted_string) @variable))

(variable) @variable

;; MAGENTA: Exceptional Data
((variable) @constant.builtin
  (#lua-match? @constant.builtin "^[A-Z][A-Z_0-9]*$"))

;; WHITE: Generic Data
(double_quoted_string) @string

((heredoc_block
  (heredoc_line) @string)
  (#set! priority 90))

(expose_instruction
  (expose_port) @number)

;; BLACK: Comments
(comment) @comment @spell
