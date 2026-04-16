;; extends

;; RED: Halts & Exceptions
(breaking_change
  (token) @keyword.exception)

(deleted) @keyword.exception

;; GREEN: Triggers & Mutations
(subject
  (subject_prefix) @function.builtin @nospell)

(new) @function.builtin

;; YELLOW: Routing & Logic
[
  (modified)
  (renamed)
] @keyword.conditional

(prefix
  "!" @keyword.conditional)

;; BLUE: Structure & Definition
(title) @markup.heading

(prefix
  (type) @keyword.function @nospell)

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

;; CYAN: Ephemeral State & References
(branch) @variable.builtin

(prefix
  (scope) @variable.parameter @nospell)

(typechange) @property

(filepath) @property

;; WHITE: Generic Data
(subject) @string @spell

(message) @string @spell

(breaking_change
  (value) @string @spell)

;; BLACK: Comments
(comment) @comment
(generated_comment) @comment
(scissor) @comment
