;; queries/c/highlights.scm

;; RED: Halts & Exceptions
[
  "return"
  "break"
  "continue"
  "goto"
] @keyword.exception

;; GREEN: Triggers & Mutations
(call_expression
  function: (identifier) @function.call)

(preproc_call
  directive: (preproc_directive) @function.macro)

"#include" @keyword.import
"#define" @keyword.directive

[
  "+" "-" "*" "/" "%" "++" "--" "~"
] @function.builtin

;; YELLOW: Routing & Logic
[
  "if" "else" "switch" "case" "default"
  "while" "for" "do"
] @keyword.conditional

[
  "==" "!=" ">" "<" ">=" "<=" "&&" "||" "!" "?"
  "&" "|" "^" "<<" ">>" 
] @keyword.conditional

;; BLUE: Structure & Definition
[
  "struct" "enum" "union" "typedef"
  "static" "extern" "inline" "const" "volatile" "register"
  "sizeof" "offsetof"
] @keyword.modifier

(primitive_type) @type.builtin
(type_identifier) @type
(function_declarator
  declarator: (identifier) @function)

[
  "=" "+=" "-=" "*=" "/=" "%=" "&=" "|=" "^=" "<<=" ">>="
] @keyword.modifier

[
  "(" ")" "[" "]" "{" "}"
] @punctuation.bracket

[
  ";" ":" "," "." "->"
] @punctuation.delimiter

;; MAGENTA: Exceptional Data
"NULL" @constant.builtin

[
  (true)
  (false)
] @boolean

(escape_sequence) @string.escape

;; CYAN: Ephemeral State
(system_lib_string) @variable
(identifier) @variable
(field_identifier) @property
(statement_identifier) @label

;; Pointer dereference and address-of
(pointer_expression
  ["*" "&"] @variable)

;; Pointer declaration
(pointer_declarator
  "*" @variable)

;; WHITE: Generic Data
(string_literal) @string
(number_literal) @number
(char_literal) @string

;; BLACK: Comments
(comment) @comment

;; fixes
(call_expression
  arguments: (argument_list
    "(" @function.builtin
    ")" @function.builtin))

