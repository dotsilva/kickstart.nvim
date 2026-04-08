;; queries/vim/highlights.scm
;; extends

;; RED: Halts & Exceptions
[
  "try"
  "catch"
  "finally"
  "endtry"
  "throw"
  "break"
  "continue"
  "return"
  "abort"
] @keyword.exception

;; GREEN: Triggers & Mutations
(call_expression
  function: (identifier) @function.call)

(call_expression
  function: (scoped_identifier
    (identifier) @function.call))

(command_name) @function.macro

[
  "call"
  "execute"
  "normal"
  "echo"
  "echon"
  "echohl"
  "echomsg"
  "echoerr"
  "source"
  "lua"
  "ruby"
  "perl"
  "python"
  "substitute"
  "startinsert"
  "stopinsert"
  "runtime"
  "cnext"
  "cprevious"
  "cNext"
  "eval"
] @function.builtin

[
  "+"
  "-"
  "*"
  "/"
  "%"
  ".."
] @function.builtin

;; YELLOW: Routing & Logic
[
  "if"
  "else"
  "elseif"
  "endif"
] @keyword.conditional

[
  "for"
  "endfor"
  "in"
  "while"
  "endwhile"
] @keyword.repeat

[
  "||"
  "&&"
  "&"
  "=="
  "!="
  ">"
  ">="
  "<"
  "<="
  "=~"
  "!~"
  "<<"
  "=<<"
  "->"
  (match_case)
] @keyword.conditional

[
  "is"
  "isnot"
] @keyword.conditional

(unary_operation
  "!" @keyword.conditional)

(ternary_expression
  [
    "?"
    ":"
  ] @keyword.conditional)

;; BLUE: Structure & Definition
[
  "function"
  "endfunction"
  "let"
  "unlet"
  "const"
  "autocmd"
  "augroup"
  "syntax"
  "filetype"
  "highlight"
  "command"
  "delcommand"
  "comclear"
  "colorscheme"
  "scriptencoding"
] @keyword.function

[
  "set"
  "setfiletype"
  "setlocal"
  "silent"
  "global"
  "vertical"
  "leftabove"
  "aboveleft"
  "rightbelow"
  "belowright"
  "topleft"
  "botright"
  "tab"
  "wincmd"
  "edit"
  "enew"
  "find"
  "ex"
  "visual"
  "view"
  "sign"
] @keyword.modifier

(function_declaration
  name: (_) @function)

[
  "="
  "^="
  "+="
  "-="
  "*="
  "/="
  "%="
  ".="
  "..="
] @keyword.modifier

(lua_statement
  "=" @keyword.modifier)

(binary_operation
  "." @punctuation.delimiter)

[
  "("
  ")"
  "{"
  "}"
  "["
  "]"
  "#{"
] @punctuation.bracket

(field_expression
  "." @punctuation.delimiter)

[
  ","
  ":"
] @punctuation.delimiter

[
  (bang)
  (spread)
] @punctuation.special

(hl_group) @type
(augroup_name) @module

(syntax_statement
  [
    "enable"
    "on"
    "off"
    "reset"
    "case"
    "spell"
    "foldlevel"
    "iskeyword"
    "keyword"
    "match"
    "cluster"
    "region"
    "clear"
    "include"
  ] @keyword.modifier)

(filetype_statement
  [
    "detect"
    "plugin"
    "indent"
    "on"
    "off"
  ] @keyword.modifier)

(highlight_statement
  [
    "default"
    "link"
    "clear"
  ] @keyword.modifier)

;; CYAN: Ephemeral State
(identifier) @variable

(parameters
  (identifier) @variable.parameter)

(default_parameter
  (identifier) @variable.parameter)

[
  (no_option)
  (inv_option)
  (default_option)
  (option_name)
] @variable.builtin

[
  (scope)
  "a:"
  "$"
] @module

(hl_attribute
  key: _ @property)

(command_attribute
  name: _ @property)

(literal_dictionary
  (literal_key) @property)

(plus_plus_opt) @property
(plus_cmd) @property

(inv_option
  "!" @property)

(set_item
  "?" @property)

;; MAGENTA: Exceptional Data
((scoped_identifier
  (scope) @_scope
  .
  (identifier) @boolean)
  (#eq? @_scope "v:")
  (#any-of? @boolean "true" "false"))

((identifier) @constant.builtin
  (#lua-match? @constant.builtin "^[A-Z][A-Z_0-9]*$"))

[
  "<buffer>"
  "<nowait>"
  "<silent>"
  "<script>"
  "<expr>"
  "<unique>"
] @constant.builtin

(keycode) @character.special
(au_event) @constant.builtin

(pattern) @string.regexp
(pattern_multi) @string.regexp

;; WHITE: Generic Data
(string_literal) @string
(heredoc (body) @string)

(filename) @string

(integer_literal) @number
(float_literal) @number.float

((set_value) @number
  (#lua-match? @number "^[%d]+(%.[%d]+)?$"))

(command) @string
(syntax_statement (keyword) @string)
(colorscheme_statement (name) @string)
(scriptencoding_statement (encoding) @string)

;; BLACK: Comments
(comment) @comment @spell
(line_continuation_comment) @comment @spell
