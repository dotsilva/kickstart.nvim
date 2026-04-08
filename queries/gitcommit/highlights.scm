;; queries/gitcommit/highlights.scm
;; extends

;; RED: Halts & Exceptions
(breaking_change
  (token) @keyword.exception)

;; GREEN: Triggers & Mutations
(subject
  (subject_prefix) @function.builtin @nospell)

;; YELLOW: Routing & Logic
(change) @keyword.conditional

(prefix
  "!" @keyword.conditional)

;; BLUE: Structure & Definition
(title) @markup.heading

(subject) @markup.heading @spell

(prefix
  (type) @keyword.function @nospell)

(filepath) @module

(trailer
  (token) @tag)

(arrow) @punctuation.delimiter

(prefix
  [
    "("
    ")"
  ] @punctuation.bracket)

(prefix
  ":" @punctuation.delimiter)

;; CYAN: Ephemeral State
(branch) @variable.builtin

(prefix
  (scope) @variable.parameter @nospell)

;; WHITE: Generic Data
(message) @string @spell

(breaking_change
  (value) @string @spell)

;; BLACK: Comments
(comment) @comment
(generated_comment) @comment
(scissor) @comment
