;; queries/awk/highlights.scm
;; extends

;; RED: Halts & Exceptions
[
  (break_statement)
  (continue_statement)
  (next_statement)
  (nextfile_statement)
] @keyword.exception

;; GREEN: Triggers & Mutations
(delete_statement) @function.builtin

(binary_exp [ "^" "**" "*" "/" "%" "+" "-" ] @function.builtin)
(unary_exp [ "+" "-" ] @function.builtin)
(update_exp [ "++" "--" ] @function.builtin)

;; YELLOW: Routing & Logic
(binary_exp [ "<" ">" "<=" ">=" "==" "!=" "~" "!~" "in" "&&" "||" ] @keyword.conditional)
(unary_exp "!" @keyword.conditional)
(ternary_exp [ "?" ":" ] @keyword.conditional)
(redirected_io_statement [ ">" ">>" ] @keyword.conditional)
(piped_io_statement [ "|" "|&" ] @keyword.conditional)
(piped_io_exp [ "|" "|&" ] @keyword.conditional)

;; BLUE: Structure & Definition
(assignment_exp [ "=" "+=" "-=" "*=" "/=" "%=" "^=" ] @keyword.modifier)
"@namespace" @keyword.modifier
[ "BEGIN" "END" "BEGINFILE" "ENDFILE" ] @keyword.function

;; CYAN: Ephemeral State
((identifier) @variable.builtin
  (#any-of? @variable.builtin
    "ARGC" "ARGV" "ARGIND" "ENVIRON" "ERRNO" "FILENAME" "FNR" "NF" "FUNCTAB" "NR" "PROCINFO"
    "RLENGTH" "RSTART" "RT" "SYMTAB"))
