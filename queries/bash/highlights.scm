;; queries/bash/highlights.scm
;; extends

;; GREEN: Triggers & Mutations
(command_name (word) @function.builtin)

;; Command & Process substitutions are execution triggers
(command_substitution "$(" @function.builtin ")" @function.builtin)
(command_substitution "`" @function.builtin "`" @function.builtin)
(process_substitution [ "<(" ">(" ] @function.builtin ")" @function.builtin)
(arithmetic_expansion [ "$((" "((" ] @function.builtin "))" @function.builtin)
(arithmetic_expansion "," @function.builtin)

;; String Evaluation/Interpolation Execution
(simple_expansion "$" @function.builtin)
(expansion "${" @function.builtin "}" @function.builtin)

;; Math Operators
(binary_expression operator: [ "+" "-" "*" "/" "%" ] @function.builtin)
(unary_expression operator: [ "+" "-" ] @function.builtin)
(postfix_expression operator: [ "++" "--" ] @function.builtin)

;; RED: Halts & Exceptions
((command_name (word) @keyword.exception)
  (#any-of? @keyword.exception "break" "continue" "exit" "return" "kill"))

;; YELLOW: Routing & Logic
[
  "if"
  "then"
  "else"
  "elif"
  "fi"
  "case"
  "in"
  "esac"
] @keyword.conditional

[
  "for"
  "do"
  "done"
  "select"
  "until"
  "while"
] @keyword.repeat

;; Routing/Logic operators
[
  ">"
  ">>"
  "<"
  "<<"
  "&&"
  "|"
  "|&"
  "||"
  "=~"
  "=="
  "!="
  "&>"
  "&>>"
  "<&"
  ">&"
  ">|"
  "<&-"
  ">&-"
  "<<-"
  "<<<"
  "!"
] @keyword.conditional

(binary_expression operator: [ "==" "!=" "<" ">" "<=" ">=" ] @keyword.conditional)
(unary_expression operator: "!" @keyword.conditional)

;; BLUE: Structure & Definition
[
  "declare"
  "typeset"
  "readonly"
  "local"
  "unset"
  "unsetenv"
  "export"
  "function"
] @keyword.function

;; Shell Flags
(command argument: (word) @keyword.modifier (#lua-match? @keyword.modifier "^%-"))

;; Assignment
[ "=" "+=" ] @keyword.modifier
(variable_assignment "=" @keyword.modifier)
(variable_assignment "+=" @keyword.modifier)

;; Heredoc boundaries
[ (heredoc_start) (heredoc_end) ] @keyword.function

;; Punctuation
[
  "("
  ")"
  "{"
  "}"
  "["
  "]"
  "[["
  "]]"
  "(("
  "))"
] @punctuation.bracket

[
  ";"
  ";;"
  ";&"
  ";;&"
  "&"
] @punctuation.delimiter

;; CYAN: Ephemeral State
(special_variable_name) @variable.builtin
(variable_name) @variable
(command argument: (word) @variable.parameter)
(case_item value: (word) @variable.parameter)
(declaration_command (word) @variable.parameter)

((variable_name) @variable.builtin
  (#any-of? @variable.builtin
    "CDPATH" "HOME" "IFS" "MAIL" "MAILPATH" "OPTARG" "OPTIND" "PATH" "PS1" "PS2"
    "_" "BASH" "BASHOPTS" "BASHPID" "BASH_ALIASES" "BASH_ARGC" "BASH_ARGV" "BASH_ARGV0" "BASH_CMDS"
    "BASH_COMMAND" "BASH_COMPAT" "BASH_ENV" "BASH_EXECUTION_STRING" "BASH_LINENO"
    "BASH_LOADABLES_PATH" "BASH_REMATCH" "BASH_SOURCE" "BASH_SUBSHELL" "BASH_VERSINFO"
    "BASH_VERSION" "BASH_XTRACEFD" "CHILD_MAX" "COLUMNS" "COMP_CWORD" "COMP_LINE" "COMP_POINT"
    "COMP_TYPE" "COMP_KEY" "COMP_WORDBREAKS" "COMP_WORDS" "COMPREPLY" "COPROC" "DIRSTACK" "EMACS"
    "ENV" "EPOCHREALTIME" "EPOCHSECONDS" "EUID" "EXECIGNORE" "FCEDIT" "FIGNORE" "FUNCNAME"
    "FUNCNEST" "GLOBIGNORE" "GROUPS" "histchars" "HISTCMD" "HISTCONTROL" "HISTFILE" "HISTFILESIZE"
    "HISTIGNORE" "HISTSIZE" "HISTTIMEFORMAT" "HOSTFILE" "HOSTNAME" "HOSTTYPE" "IGNOREEOF" "INPUTRC"
    "INSIDE_EMACS" "LANG" "LC_ALL" "LC_COLLATE" "LC_CTYPE" "LC_MESSAGES" "LC_NUMERIC" "LC_TIME"
    "LINENO" "LINES" "MACHTYPE" "MAILCHECK" "MAPFILE" "OLDPWD" "OPTERR" "OSTYPE" "PIPESTATUS"
    "POSIXLY_CORRECT" "PPID" "PROMPT_COMMAND" "PROMPT_DIRTRIM" "PS0" "PS3" "PS4" "PWD" "RANDOM"
    "READLINE_ARGUMENT" "READLINE_LINE" "READLINE_MARK" "READLINE_POINT" "REPLY" "SECONDS" "SHELL"
    "SHELLOPTS" "SHLVL" "SRANDOM" "TIMEFORMAT" "TMOUT" "TMPDIR" "UID"))

;; MAGENTA: Exceptional Data
[ (regex) (extglob_pattern) ] @string.regexp

((variable_name) @constant.builtin
  (#lua-match? @constant.builtin "^[A-Z][A-Z_0-9]*$"))
