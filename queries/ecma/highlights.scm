;; queries/ecma/highlights.scm

;; RED: Halts & Exceptions
[
  "break"
  "continue"
  "return"
  "yield"
  "await"
  "throw"
  "try"
  "catch"
  "finally"
] @keyword.exception

;; GREEN: Triggers & Mutations
(call_expression
  function: (identifier) @function.call)

(call_expression
  function: (member_expression
    property: [
      (property_identifier)
      (private_property_identifier)
    ] @function.method.call))

(call_expression
  function: (await_expression
    (identifier) @function.call))

(call_expression
  function: (await_expression
    (member_expression
      property: [
        (property_identifier)
        (private_property_identifier)
      ] @function.method.call)))

[
  "+"
  "++"
  "-"
  "--"
  "*"
  "**"
  "/"
  "%"
  "~"
] @function.builtin

(unary_expression
  [
    "-"
    "+"
    "~"
  ] @function.builtin)

(binary_expression
  "/" @function.builtin)

[
  "import"
  "from"
  "as"
] @keyword.import

((identifier) @function.builtin
  (#any-of? @function.builtin
    "eval" "isFinite" "isNaN" "parseFloat" "parseInt" "decodeURI" "decodeURIComponent" "encodeURI"
    "encodeURIComponent" "require"))

;; YELLOW: Routing & Logic
[
  "if"
  "else"
  "switch"
  "case"
  "default"
] @keyword.conditional

(switch_default
  "default" @keyword.conditional)

[
  "for"
  "of"
  "do"
  "while"
] @keyword.repeat

[
  "&&"
  "||"
  "!"
  "=="
  "==="
  "!="
  "!=="
  ">"
  ">="
  "<"
  "<="
  "??"
  "&"
  "|"
  "^"
  "<<"
  ">>"
  ">>>"
] @keyword.conditional

(unary_expression
  "!" @keyword.conditional)

(ternary_expression
  [
    "?"
    ":"
  ] @keyword.conditional)

[
  "in"
  "instanceof"
  "typeof"
] @keyword.conditional

;; BLUE: Structure & Definition
[
  "class"
  "extends"
  "function"
  "var"
  "let"
  "const"
  "new"
  "delete"
  "void"
  "get"
  "set"
  "static"
  "target"
  "with"
  "async"
] @keyword.function

[
  "="
  "+="
  "-="
  "*="
  "/="
  "%="
  "**="
  "&="
  "|="
  "^="
  "<<="
  ">>="
  ">>>="
  "&&="
  "||="
  "??="
] @keyword.modifier

[
  "{"
  "}"
  "["
  "]"
  "("
  ")"
] @punctuation.bracket

[
  "."
  ","
  ";"
  ":"
  "..."
] @punctuation.delimiter

(decorator
  "@" @punctuation.special
  (identifier) @tag)

(decorator
  "@" @punctuation.special
  (call_expression
    (identifier) @tag))

(decorator
  "@" @punctuation.special
  (member_expression
    (property_identifier) @tag))

(decorator
  "@" @punctuation.special
  (call_expression
    (member_expression
      (property_identifier) @tag)))

(function_expression
  name: (identifier) @function)

(function_declaration
  name: (identifier) @function)

(generator_function
  name: (identifier) @function)

(generator_function_declaration
  name: (identifier) @function)

(method_definition
  name: [
    (property_identifier)
    (private_property_identifier)
  ] @function.method)

(method_definition
  name: (property_identifier) @constructor
  (#eq? @constructor "constructor"))

(pair
  key: (property_identifier) @function.method
  value: (function_expression))

(pair
  key: (property_identifier) @function.method
  value: (arrow_function))

(assignment_expression
  left: (member_expression
    property: (property_identifier) @function.method)
  right: (arrow_function))

(assignment_expression
  left: (member_expression
    property: (property_identifier) @function.method)
  right: (function_expression))

(variable_declarator
  name: (identifier) @function
  value: (arrow_function))

(variable_declarator
  name: (identifier) @function
  value: (function_expression))

(assignment_expression
  left: (identifier) @function
  right: (arrow_function))

(assignment_expression
  left: (identifier) @function
  right: (function_expression))

(new_expression
  constructor: (identifier) @constructor)

((identifier) @type
  (#lua-match? @type "^[A-Z]"))

((identifier) @type.builtin
  (#any-of? @type.builtin
    "Object" "Function" "Boolean" "Symbol" "Number" "Math" "Date" "String" "RegExp" "Map" "Set"
    "WeakMap" "WeakSet" "Promise" "Array" "Int8Array" "Uint8Array" "Uint8ClampedArray" "Int16Array"
    "Uint16Array" "Int32Array" "Uint32Array" "Float32Array" "Float64Array" "ArrayBuffer" "DataView"
    "Error" "EvalError" "InternalError" "RangeError" "ReferenceError" "SyntaxError" "TypeError"
    "URIError"))

(statement_identifier) @label

;; CYAN: Ephemeral State
(identifier) @variable

(property_identifier) @variable.member

(shorthand_property_identifier) @variable.member

(private_property_identifier) @variable.member

(object_pattern
  (shorthand_property_identifier_pattern) @variable)

(object_pattern
  (object_assignment_pattern
    (shorthand_property_identifier_pattern) @variable))

[
  (this)
  (super)
] @variable.builtin

((identifier) @variable.builtin
  (#eq? @variable.builtin "self"))

((identifier) @variable.builtin
  (#any-of? @variable.builtin "arguments" "module" "console" "window" "document"))

((identifier) @module.builtin
  (#eq? @module.builtin "Intl"))

;; MAGENTA: Exceptional Data
[
  (true)
  (false)
] @boolean

[
  (null)
  (undefined)
] @constant.builtin

((identifier) @constant.builtin
  (#any-of? @constant.builtin "NaN" "Infinity"))

((identifier) @constant.builtin
  (#lua-match? @constant.builtin "^_*[A-Z][A-Z%d_]*$"))

((shorthand_property_identifier) @constant.builtin
  (#lua-match? @constant.builtin "^_*[A-Z][A-Z%d_]*$"))

(escape_sequence) @string.escape

(regex_pattern) @string.regexp

(regex_flags) @character.special

(regex
  "/" @character.special)

;; WHITE: Generic Data
(string) @string
(template_string) @string
(number) @number

;; BLACK: Comments
[
  (comment)
  (html_comment)
] @comment @spell

((comment) @comment.documentation
  (#lua-match? @comment.documentation "^/[*][*][^*].*[*]/$"))

(hash_bang_line) @comment

((string_fragment) @comment
  (#eq? @comment "use strict"))

(template_substitution
  [
    "${"
    "}"
  ] @comment) @none
