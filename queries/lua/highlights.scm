;; extends

;; RED: Halts & Exceptions
[
  "return"
  "break"
  "goto"
] @keyword.exception

(function_call
  (identifier) @keyword.exception
  (#any-of? @keyword.exception "error" "assert"))

;; GREEN: Triggers & Mutations
(function_call
  name: [
    (identifier) @function.call
    (dot_index_expression
      field: (identifier) @function.call)
    (method_index_expression
      method: (identifier) @function.method.call)
  ])

(function_call
  (identifier) @function.builtin
  (#any-of? @function.builtin
    "collectgarbage" "dofile" "getfenv" "getmetatable" "ipairs" "load" "loadfile"
    "loadstring" "next" "pairs" "pcall" "print" "rawequal" "rawget" "rawlen" "rawset"
    "require" "select" "setfenv" "setmetatable" "tonumber" "tostring" "type" "unpack" "xpcall"))

[
  "+"
  "-"
  "*"
  "/"
  "%"
  "^"
  "//"
  ".."
  "#"
  "&"
  "|"
  "~"
  "<<"
  ">>"
] @function.builtin

;; YELLOW: Routing & Logic
[
  "if"
  "elseif"
  "else"
  "then"
] @keyword.conditional

[
  "while"
  "repeat"
  "until"
  "for"
] @keyword.repeat

[
  "and"
  "or"
  "not"
  "=="
  "~="
  "<"
  "<="
  ">"
  ">="
] @keyword.conditional

;; BLUE: Structure & Definition
[
  "function"
  "local"
  "in"
  "do"
  "end"
] @keyword.function

"=" @keyword.modifier

(function_call
  (identifier) @keyword.function
  (#eq? @keyword.function "module"))

((identifier) @module
  (#any-of? @module "_G" "debug" "io" "jit" "math" "os" "package" "string" "table" "utf8"))

((identifier) @module
  (#eq? @module "coroutine"))

[
  ";"
  ":"
  "::"
  ","
  "."
] @punctuation.delimiter

[
  "("
  ")"
  "["
  "]"
  "{"
  "}"
] @punctuation.bracket

(function_declaration
  name: [
    (identifier) @function
    (dot_index_expression
      field: (identifier) @function)
  ])

(function_declaration
  name: (method_index_expression
    method: (identifier) @function.method))

(assignment_statement
  (variable_list
    .
    name: [
      (identifier) @function
      (dot_index_expression
        field: (identifier) @function)
    ])
  (expression_list
    .
    value: (function_definition)))

(table_constructor
  (field
    name: (identifier) @function
    value: (function_definition)))

;; CYAN: Ephemeral State
(identifier) @variable

(field
  name: (identifier) @property)

(dot_index_expression
  field: (identifier) @variable.member)

((identifier) @variable.builtin
  (#eq? @variable.builtin "self"))

(parameters
  (identifier) @variable.parameter)

(vararg_expression) @variable.parameter.builtin

(label_statement
  (identifier) @label)

(goto_statement
  (identifier) @label)

(variable_list
  (attribute
    (identifier) @attribute))

;; MAGENTA: Exceptional Data
[
  (false)
  (true)
] @boolean

(nil) @constant.builtin

((identifier) @constant.builtin
  (#eq? @constant.builtin "_VERSION"))

((identifier) @constant.builtin
  (#lua-match? @constant.builtin "^[A-Z][A-Z_0-9]*$"))

(escape_sequence) @string.escape

(function_call
  (dot_index_expression
    field: (identifier) @_method
    (#any-of? @_method "find" "match" "gmatch" "gsub"))
  arguments: (arguments
    .
    (_)
    .
    (string
      content: (string_content) @string.regexp)))

(function_call
  (method_index_expression
    method: (identifier) @_method
    (#any-of? @_method "find" "match" "gmatch" "gsub"))
  arguments: (arguments
    .
    (string
      content: (string_content) @string.regexp)))

;; WHITE: Generic Data
(number) @number
(string) @string

;; BLACK: Comments
(comment) @comment @spell

((comment) @comment.documentation
  (#lua-match? @comment.documentation "^[-][-][-]"))

((comment) @comment.documentation
  (#lua-match? @comment.documentation "^[-][-](%s?)@"))

(hash_bang_line) @comment
