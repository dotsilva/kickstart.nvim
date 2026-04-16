;; extends

;; ==========================================
;; 1. BROAD FALLBACKS (Lowest Priority)
;; ==========================================
;; Assume all command arguments are Generic Data (WHITE) by default
(command argument: (word) @string)
(case_item value: (word) @string)
(declaration_command (word) @string)

;; ==========================================
;; 2. SPECIFIC OVERRIDES (Higher Priority)
;; ==========================================
;; Shell Flags (-rf) override generic arguments to BLUE
(command argument: (word) @keyword.modifier (#lua-match? @keyword.modifier "^%-+"))

;; Globs (*.tmp) override generic arguments to MAGENTA
(command argument: (word) @string.regexp (#lua-match? @string.regexp "[%*%?]"))
((word) @string.regexp (#lua-match? @string.regexp "[%*%?]"))

;; Variable Assignment LHS (error_count=0) overrides to CYAN
(variable_assignment name: _ @variable)
(declaration_command (variable_assignment name: _ @variable))

;; Function Definition Names (process_stream) override to BLUE
(function_definition name: (word) @function)

;; ==========================================
;; 3. STRUCTURE & DEFINITION (BLUE)
;; ==========================================
[ "(" ")" "{" "}" "[" "]" "[[" "]]" "((" "))" ] @punctuation.bracket
[ ";" ";;" ";&" ";;&" "&" ] @punctuation.delimiter

[ "declare" "typeset" "readonly" "local" "unset" "unsetenv" "export" "function" ] @keyword.function

[ (heredoc_start) (heredoc_end) ] @keyword.function

[ "=" "+=" ] @keyword.modifier
(variable_assignment "=" @keyword.modifier)
(variable_assignment "+=" @keyword.modifier)

(test_operator) @keyword.modifier

;; ==========================================
;; 4. ROUTING & LOGIC (YELLOW)
;; ==========================================
[ "if" "then" "else" "elif" "fi" "case" "in" "esac" ] @keyword.conditional
[ "for" "do" "done" "select" "until" "while" ] @keyword.repeat
[ ">" ">>" "<" "<<" "&&" "|" "|&" "||" "=~" "==" "!=" "&>" "&>>" "<&" ">&" ">|" "<&-" ">&-" "<<-" "<<<" "!" ] @keyword.conditional

(binary_expression operator: [ "==" "!=" "<" ">" "<=" ">=" ] @keyword.conditional)
(unary_expression operator: "!" @keyword.conditional)

;; ==========================================
;; 5. TRIGGERS & MUTATIONS (GREEN)
;; ==========================================
(command_name (word) @function.builtin)
(command_substitution "$(" @function.builtin ")" @function.builtin)
(command_substitution "`" @function.builtin "`" @function.builtin)
(process_substitution [ "<(" ">(" ] @function.builtin ")" @function.builtin)
(arithmetic_expansion [ "$((" "((" ] @function.builtin "))" @function.builtin)
(arithmetic_expansion "," @function.builtin)

(simple_expansion "$" @function.builtin)
(expansion "${" @function.builtin "}" @function.builtin)

(binary_expression operator: [ "+" "-" "*" "/" "%" ] @function.builtin)
(unary_expression operator: [ "+" "-" ] @function.builtin)
(postfix_expression operator: [ "++" "--" ] @function.builtin)

;; ==========================================
;; 6. HALTS & EXCEPTIONS (RED) (Overrides Green)
;; ==========================================
((command_name (word) @keyword.exception)
  (#any-of? @keyword.exception "break" "continue" "exit" "return" "kill"))

;; ==========================================
;; 7. EPHEMERAL STATE / BUILTINS (CYAN)
;; ==========================================
(special_variable_name) @variable.builtin
(variable_name) @variable

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

;; ==========================================
;; 8. EXCEPTIONAL DATA (MAGENTA)
;; ==========================================
[ (regex) (extglob_pattern) ] @string.regexp

