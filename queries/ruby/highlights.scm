;; extends
;; RED: Halts & Exceptions
[
  "return"
  "yield"
] @keyword.return

[
  "rescue"
  "ensure"
  "break"
  "next"
] @keyword.exception

((identifier) @keyword.exception
  (#any-of? @keyword.exception "raise" "fail" "catch" "throw"))

;; GREEN: Triggers & Mutations
(call
  receiver: (constant)? @type
  method: [
    (identifier)
    (constant)
  ] @function.call)

"defined?" @function.call

(program
  (call
    (identifier) @keyword.import)
  (#any-of? @keyword.import "require" "require_relative" "load"))

((identifier) @function.builtin
  (#any-of? @function.builtin "attr_reader" "attr_writer" "attr_accessor" "module_function"))

((call
  !receiver
  method: (identifier) @function.builtin)
  (#any-of? @function.builtin "include" "extend" "prepend" "refine" "using"))

[
  "+"
  "-"
  "*"
  "/"
  "%"
  "**"
] @function.builtin

(interpolation
  "#{" @function.builtin
  "}" @function.builtin)

;; YELLOW: Routing & Logic
[
  "case"
  "else"
  "elsif"
  "if"
  "unless"
  "when"
  "then"
  "and"
  "or"
  "in"
  "not"
] @keyword.conditional

(in_clause "in" @keyword.conditional)
(if "end" @keyword.conditional)

[
  "for"
  "until"
  "while"
  "redo"
  "retry"
] @keyword.repeat

(in "in" @keyword.repeat)

[
  "!"
  "=="
  "==="
  "<=>"
  ">"
  "<"
  ">="
  "<="
  "&"
  "|"
  "^"
  "<<"
  ">>"
  "&&"
  "||"
  "||="
  "&&="
  "!="
  "=~"
  "!~"
  "?"
  ":"
  ".."
  "..."
] @keyword.conditional

"&." @keyword.conditional

;; BLUE: Structure & Definition
[
  "alias"
  "begin"
  "do"
  "end"
  "module"
  "def"
  "undef"
  "class"
  "->"
] @keyword.function

(method "end" @keyword.function)

((identifier) @keyword.modifier
  (#any-of? @keyword.modifier "private" "protected" "public"))

[
  "="
  "+="
  "-="
  "*="
  "/="
  "%="
] @keyword.modifier

[
  (heredoc_beginning)
  (heredoc_end)
] @keyword.function

(method
  name: [
    (identifier) @function
    (constant) @type
  ])

(singleton_method
  name: [
    (identifier) @function
    (constant) @type
  ])

(setter
  (identifier) @function)

(alias
  (identifier) @function)

(class
  name: (constant) @type)

(module
  name: (constant) @type)

(superclass
  (constant) @type)

(constant) @type

((constant) @type
  (#not-lua-match? @type "^[A-Z0-9_]+$"))

[
  ","
  ";"
  "."
  "::"
  "=>"
] @punctuation.delimiter

(regex
  "/" @punctuation.bracket)

(pair
  ":" @punctuation.delimiter)

(keyword_pattern
  ":" @punctuation.delimiter)

[
  "("
  ")"
  "["
  "]"
  "{"
  "}"
  "%w("
  "%i("
] @punctuation.bracket

(block_parameters
  "|" @punctuation.bracket)

;; CYAN: Ephemeral State
[
  (identifier)
  (global_variable)
] @variable

[
  (class_variable)
  (instance_variable)
] @variable.member

[
  (self)
  (super)
] @variable.builtin

(method_parameters (identifier) @variable.parameter)
(lambda_parameters (identifier) @variable.parameter)
(block_parameters (identifier) @variable.parameter)
(splat_parameter (identifier) @variable.parameter)
(hash_splat_parameter (identifier) @variable.parameter)
(optional_parameter (identifier) @variable.parameter)
(destructured_parameter (identifier) @variable.parameter)
(block_parameter (identifier) @variable.parameter)
(keyword_parameter (identifier) @variable.parameter)

;; MAGENTA: Exceptional Data
[
  (true)
  (false)
] @boolean

(nil) @constant.builtin

((identifier) @constant.builtin
  (#any-of? @constant.builtin
    "__callee__" "__dir__" "__id__" "__method__" "__send__" "__ENCODING__" "__FILE__" "__LINE__"))

(regex (string_content) @string.regexp)
(escape_sequence) @string.escape

;; WHITE: Generic Data
[
  (string_content)
  (heredoc_content)
  "\""
  "`"
] @string

[
  (bare_symbol)
  (simple_symbol)
  (hash_key_symbol)
] @string.special.symbol

(delimited_symbol
  ":\"" @string.special.symbol
  (string_content) @string.special.symbol
  "\"" @string.special.symbol)

(integer) @number
(float) @number.float

;; BLACK: Comments
(comment) @comment @spell

((program
  .
  (comment) @comment @nospell)
  (#lua-match? @comment "^#!/"))

(program
  (comment)+ @comment.documentation
  (class))

(module
  (comment)+ @comment.documentation
  (body_statement
    (class)))

(class
  (comment)+ @comment.documentation
  (body_statement
    (method)))

(body_statement
  (comment)+ @comment.documentation
  (method))
