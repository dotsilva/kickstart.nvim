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
;; BLUE: Structure & Definition
;; Override base parser's @label (priority 100) for BuildKit heredocs
((heredoc_marker) @keyword.function (#set! priority 105))
((heredoc_end) @keyword.function (#set! priority 105))
;; Add to BLUE: Structure & Definition
[ "[" "]" "," ] @punctuation.bracket

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

;; WHITE: Generic Data
(double_quoted_string) @string

((heredoc_block
  (heredoc_line) @string)
  (#set! priority 90))

(expose_instruction
  (expose_port) @number)

;; BLACK: Comments
(comment) @comment @spell
