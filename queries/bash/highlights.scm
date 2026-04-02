;; extends

;; YELLOW: Logical Routing
;; Forces AND/OR to be treated as conditional branches
[
  "&&"
  "||"
] @keyword.conditional

;; GREEN: Execution Triggers
;; Forces pipes and redirections to act as engine triggers
[
  "|"
  "|&"
  ">"
  ">>"
  "<"
  "<<"
] @function.builtin

;; Force all standard Bash commands (like echo, awk, sed) to register as triggers
(command_name) @function.builtin

;; GREEN: Execution Triggers (Command Substitution & Variable Expansion)
(command_substitution
  "$(" @function.builtin
  ")" @function.builtin)

(command_substitution
  "`" @function.builtin)

(expansion
  "${" @function.builtin
  "}" @function.builtin)
