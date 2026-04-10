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
[
  (index)
  (file_change)
  (similarity)
  (binary_change)
] @keyword

;; CYAN: Ephemeral State
(commit) @property
(command (argument) @property)
(filename) @property

;; Catch 'commit <hash>' lines (which the parser treats as generic context)
((context) @property
  (#match? @property "^commit "))

;; Optional: Do the same for Author and Date if you want them Cyan
((context) @property
  (#match? @property "^Author: "))

((context) @property
  (#match? @property "^Date: "))

;; WHITE: Generic Data
(mode) @number

(similarity
  (score) @number
  "%" @operator)

;; BLACK: Comments
(comment) @comment @spell
