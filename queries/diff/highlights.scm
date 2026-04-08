;; queries/diff/highlights.scm
;; extends

;; RED: Halts, Exceptions & Deletions
[
  (deletion)
  (old_file)
] @keyword.exception

;; GREEN: Triggers, Mutations & Additions
[
  (addition)
  (new_file)
] @function.builtin

(command "diff" @function.builtin)

;; YELLOW: Routing & Logic
(location) @keyword.conditional

;; BLUE: Structure & Definition
(filename) @module

[
  (binary_change)
  (file_change)
] @keyword.function

(index "index" @keyword.function)

([
  ".."
  "+"
  "++"
  "+++"
  "++++"
  "-"
  "--"
  "---"
  "----"
] @punctuation.special
  (#set! priority 95))

;; CYAN: Ephemeral State
(commit) @variable.builtin
(command (argument) @variable.parameter)

;; WHITE: Generic Data
(mode) @number

(similarity
  (score) @number
  "%" @operator)
  
(similarity) @keyword.function

;; BLACK: Comments
(comment) @comment @spell
