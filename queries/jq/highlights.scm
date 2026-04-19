;; extends

;; ==========================
;; TOP: GENERAL RULES
;; ==========================

;; RED: Halts & Exceptions
[
  "break"
  "try"
  "catch"
] @keyword.exception

;; GREEN: Triggers & Mutations
(funcdef
  (identifier) @function)

((funcname) @function.call
  .
  "(")

[
  "+"
  "-"
  "*"
  "/"
  "%"
] @function.builtin

[
  "import"
  "include"
] @keyword.import

((funcname) @function.builtin
  (#any-of? @function.builtin
    "IN" "INDEX" "JOIN" "abs" "acos" "acosh" "add" "all" "any" "arrays" "ascii_downcase"
    "ascii_upcase" "asin" "asinh" "atan" "atan2" "atanh" "booleans" "bsearch" "builtins" "capture"
    "cbrt" "ceil" "combinations" "contains" "copysign" "cos" "cosh" "debug" "del" "delpaths" "drem"
    "empty" "endswith" "env" "erf" "erfc" "exp" "exp10" "exp2" "explode" "expm1" "fabs"
    "fdim" "finites" "first" "flatten" "floor" "fma" "fmax" "fmin" "fmod" "frexp"
    "from_entries" "fromdate" "fromdateiso8601" "fromjson" "fromstream" "gamma" "get_jq_origin"
    "get_prog_origin" "get_search_list" "getpath" "gmtime" "group_by" "gsub" "has" "hypot"
    "implode" "in" "index" "indices" "infinite" "input" "input_filename" "input_line_number"
    "inputs" "inside" "isempty" "isfinite" "isinfinite" "isnan" "isnormal" "iterables" "j0"
    "j1" "jn" "join" "keys" "keys_unsorted" "last" "ldexp" "length" "lgamma" "lgamma_r" "limit"
    "localtime" "log" "log10" "log1p" "log2" "logb" "ltrimstr" "map" "map_values" "match" "max"
    "max_by" "min" "min_by" "mktime" "modf" "modulemeta" "nan" "nearbyint" "nextafter"
    "nexttoward" "normals" "not" "now" "nth" "nulls" "numbers" "objects" "path" "paths" "pick"
    "pow" "pow10" "range" "remainder" "repeat" "reverse" "rindex" "rint" "round" "rtrimstr"
    "scalars" "scalb" "scalbln" "scan" "select" "setpath" "significand" "sin" "sinh" "sort"
    "sort_by" "split" "splits" "sqrt" "startswith" "stderr" "strflocaltime" "strftime" "strings"
    "strptime" "sub" "tan" "tanh" "test" "tgamma" "to_entries" "todate" "todateiso8601" "tojson"
    "tonumber" "tostream" "tostring" "transpose" "trunc" "truncate_stream" "type" "unique"
    "unique_by" "utf8bytelength" "values" "walk" "with_entries" "y0" "y1" "yn"))

;; YELLOW: Routing & Logic
[
  "if"
  "then"
  "elif"
  "else"
  "end"
] @keyword.conditional

[
  "or"
  "and"
  "=="
  "!="
  ">"
  ">="
  "<="
  "<"
  "|"
  "?"
  "//"
  "?//"
  (recurse)
] @keyword.conditional

[
  "reduce"
  "foreach"
] @keyword.repeat

((funcname) @keyword.repeat
  (#any-of? @keyword.repeat "while" "until" "recurse"))

;; BLUE: Structure & Definition
[
  "def"
  "as"
  "label"
  "module"
] @keyword.function

[
  "="
  "+="
  "-="
  "*="
  "/="
  "%="
  "//="
  "|="
] @keyword.modifier

[
  ";"
  ","
  ":"
] @punctuation.delimiter

[
  "["
  "]"
  "{"
  "}"
  "("
  ")"
] @punctuation.bracket

(objectkey (identifier) @tag)
(objectkeyval (string) @tag)
(constobjectkeyval (identifier) @tag)

;; CYAN: Ephemeral State
(variable) @variable
(funcdefargs (identifier) @variable.parameter)
(index (identifier) @property)
(query label: (variable) @label)
(query break_statement: (variable) @label)

((variable) @variable.builtin
  (#eq? @variable.builtin "$ENV"))

;; MAGENTA: Exceptional Data
[
  "true"
  "false"
] @boolean

"null" @constant.builtin

((variable) @constant.builtin
  (#eq? @constant.builtin "$__loc__"))

;; WHITE: Generic Data
(number) @number
(string) @string

;; BLACK: Comments
(comment) @comment @spell

;; ==========================
;; BOTTOM: OVERRIDES (Max Priority)
;; ==========================

;; RED: Halts (Override massive list)
((funcname) @keyword.exception
  (#any-of? @keyword.exception "error" "halt" "halt_error")
  (#set! priority 300))

;; GREEN: Formats (@csv, @tsv, etc)
((format) @function.builtin
  (#set! priority 300))

;; GREEN: String Interpolation Bounds
(string_interp
  "\\(" @function.builtin
  ")" @function.builtin
  (#set! priority 300))

;; BLUE: Dot Structural
("." @punctuation.delimiter
  (#set! priority 300))

;; BLUE: Quotes Scaffolding
("\"" @punctuation.bracket
  (#set! priority 300))
