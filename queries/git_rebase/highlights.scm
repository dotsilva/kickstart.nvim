;; queries/git_rebase/highlights.scm
;; extends

;; RED: Halts & Deletions
((command) @keyword.exception
  (#any-of? @keyword.exception "d" "drop" "b" "break"))

;; GREEN: Triggers & Mutations
((command) @function.builtin
  (#any-of? @function.builtin "p" "pick" "r" "reword" "e" "edit" "s" "squash" "f" "fixup" "x" "exec" "m" "merge"))

;; YELLOW: Routing & Logic
((command) @keyword.conditional
  (#any-of? @keyword.conditional "t" "reset"))

;; BLUE: Structure & Definition
((command) @keyword.function
  (#any-of? @keyword.function "l" "label"))

(option) @keyword.modifier

;; CYAN: Ephemeral State
(label) @variable.builtin

;; WHITE: Generic Data
(message) @string @spell

;; BLACK: Comments
(comment) @comment
