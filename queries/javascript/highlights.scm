;; extends
;; queries/javascript/highlights.scm
;; RED: Halts & Exceptions
[
  "break"
  "continue"
  "return"
  "yield"
  "await"
  "throw"
  "catch"
  "finally"
] @keyword.exception

;; GREEN: Triggers & Mutations
(call_expression
  function: (identifier) @function.call)

(call_expression
  function: (member_expression
    property: (property_identifier) @function.method.call))

(template_substitution
  "${" @function.builtin
  "}" @function.builtin)

[
  "+"
  "-"
  "*"
  "/"
  "%"
  "**"
  "++"
  "--"
] @function.builtin

"import" @keyword.import

((call_expression
  function: (identifier) @keyword.import)
  (#eq? @keyword.import "require"))

;; YELLOW: Routing & Logic
[
  "if"
  "else"
  "switch"
  "case"
  "default"
] @keyword.conditional

[
  "for"
  "while"
  "do"
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
] @keyword.conditional

(optional_chain) @keyword.conditional

;; BLUE: Structure & Definition
[
  "class"
  "extends"
  "function"
  "=>"
  "var"
  "let"
  "const"
  "export"
  "new"
] @keyword.function

[
  "="
  "+="
  "-="
  "*="
  "/="
  "%="
  "**="
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
] @punctuation.delimiter

(member_expression
  "." @punctuation.delimiter)

;; MAGENTA: Exceptional Data
[
  (true)
  (false)
] @boolean

[
  (null)
  (undefined)
] @constant.builtin

(regex) @string.regexp

;; CYAN: Ephemeral State
(identifier) @variable
(property_identifier) @property
(this) @variable.builtin

;; Parameters & Destructuring
(formal_parameters
  (identifier) @variable.parameter)

(formal_parameters
  (rest_pattern
    (identifier) @variable.parameter))

(formal_parameters
  (object_pattern
    (shorthand_property_identifier_pattern) @variable.parameter))

(formal_parameters
  (object_pattern
    (object_assignment_pattern
      (shorthand_property_identifier_pattern) @variable.parameter)))

(formal_parameters
  (object_pattern
    (pair_pattern
      value: (identifier) @variable.parameter)))

(formal_parameters
  (array_pattern
    (identifier) @variable.parameter))

(formal_parameters
  (assignment_pattern
    (object_pattern
      (shorthand_property_identifier_pattern) @variable.parameter)))

(formal_parameters
  (assignment_pattern
    (object_pattern
      (object_assignment_pattern
        (shorthand_property_identifier_pattern) @variable.parameter))))

(arrow_function
  parameter: (identifier) @variable.parameter)

(formal_parameters
  (assignment_pattern
    left: (identifier) @variable.parameter))

;; WHITE: Generic Data
(string) @string
(number) @number

;; BLACK: Comments
(comment) @comment @spell

;; recent fixes
((method_definition
  name: (property_identifier) @keyword.function)
  (#eq? @keyword.function "constructor"))

(call_expression
  function: (super)
  arguments: (arguments
    "(" @function.builtin
    ")" @function.builtin))

((template_substitution
  "${" @function.builtin
  "}" @function.builtin)
  (#set! priority 110))

"typeof" @keyword.modifier

((regex "/") @string.regexp (#set! priority 110))

((identifier) @constant.builtin
  (#eq? @constant.builtin "NaN")
  (#set! priority 110))

"delete" @keyword.exception
