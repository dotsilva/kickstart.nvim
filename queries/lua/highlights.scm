;; extends

;; GENERIC FALLBACKS & STATE (CYAN & WHITE & BLACK)
;; BLACK: Comments
(comment) @comment @spell
((comment) @comment.documentation (#lua-match? @comment.documentation "^[-][-][-]"))
((comment) @comment.documentation (#lua-match? @comment.documentation "^[-][-](%s?)@"))
(hash_bang_line) @keyword.directive

;; WHITE: Generic Data
(number) @number
(string) @string

;; CYAN: Ephemeral State
(identifier) @variable
(field name: (identifier) @property)
(dot_index_expression field: (identifier) @variable.member)
((identifier) @variable.builtin (#eq? @variable.builtin "self"))
(parameters (identifier) @variable.parameter)
(vararg_expression) @variable.parameter
(label_statement (identifier) @label)
(goto_statement (identifier) @label)
(variable_list (attribute (identifier) @attribute))

;; STRUCTURE & DEFINITION (BLUE)
[
  "function"
  "local"
  "in"
] @keyword.function

"=" @keyword.modifier

(function_call (identifier) @keyword.function (#eq? @keyword.function "module"))

((identifier) @module
  (#any-of? @module "_G" "debug" "io" "jit" "math" "os" "package" "string" "table" "utf8" "coroutine"))

[ ";" ":" "::" "," "." ] @punctuation.delimiter
[ "(" ")" "[" "]" "{" "}" ] @punctuation.bracket

(function_declaration name: [ (identifier) @function (dot_index_expression field: (identifier) @function) ])
(function_declaration name: (method_index_expression method: (identifier) @function.method))
(assignment_statement (variable_list name: [ (identifier) @function (dot_index_expression field: (identifier) @function) ]) (expression_list value: (function_definition)))
(table_constructor (field name: (identifier) @function value: (function_definition)))

;; Structural scope bounds
(function_declaration "end" @keyword.function)
(function_definition "end" @keyword.function)
(do_statement [ "do" "end" ] @keyword.function)

;; Uppercase constants (TeloS Blue)
((identifier) @constant (#lua-match? @constant "^[A-Z][A-Z_0-9]*$"))

;; ROUTING & LOGIC (YELLOW)
[ "if" "elseif" "else" "then" ] @keyword.conditional
[ "while" "repeat" "until" "for" ] @keyword.repeat
[ "and" "or" "not" "==" "~=" "<" "<=" ">" ">=" ] @keyword.conditional

;; Logic scope bounds (Overrides structural 'end'/'do')
(if_statement "end" @keyword.conditional)
(while_statement [ "do" "end" ] @keyword.repeat)
(for_statement [ "do" "end" ] @keyword.repeat)

;; TRIGGERS & MUTATIONS (GREEN)
(function_call name: [
  (identifier) @function.call
  (dot_index_expression field: (identifier) @function.call)
  (method_index_expression method: (identifier) @function.method.call)
])

(function_call (identifier) @function.builtin
  (#any-of? @function.builtin "collectgarbage" "dofile" "getfenv" "getmetatable" "ipairs" "load" "loadfile" "loadstring" "next" "pairs" "pcall" "print" "rawequal" "rawget" "rawlen" "rawset" "require" "select" "setfenv" "setmetatable" "tonumber" "tostring" "type" "unpack" "xpcall"))

[ "+" "-" "*" "/" "%" "^" "//" ".." "#" "&" "|" "~" "<<" ">>" ] @function.builtin

;; EXCEPTIONAL DATA (MAGENTA)
[ (false) (true) ] @boolean
(nil) @constant.builtin
((identifier) @constant.builtin (#eq? @constant.builtin "_VERSION"))

(escape_sequence) @string.escape

;; string.gsub(text, "regex", "replace")
(function_call
  name: (dot_index_expression field: (identifier) @_method (#any-of? @_method "find" "match" "gmatch" "gsub"))
  arguments: (arguments . (_) . (string content: (string_content) @string.regexp)))

;; text:gsub("regex", "replace")
(function_call
  name: (method_index_expression method: (identifier) @_method (#any-of? @_method "find" "match" "gmatch" "gsub"))
  arguments: (arguments . (string content: (string_content) @string.regexp)))

;; HALTS & EXCEPTIONS (RED) (Highest Priority)
[ "return" "goto" ] @keyword.exception
(break_statement) @keyword.exception

(function_call name: (identifier) @keyword.exception (#any-of? @keyword.exception "error" "assert"))
