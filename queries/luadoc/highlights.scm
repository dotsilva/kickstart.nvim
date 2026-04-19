;; extends

;; YELLOW: Routing & Logic
"|" @keyword.conditional

;; BLUE: Structure & Definition
[
  "@module"
  "@package"
  "@class"
  "@type"
  "@param"
  "@alias"
  "@field"
  "@generic"
  "@vararg"
  "@diagnostic"
  "@cast"
  "@deprecated"
  "@meta"
  "@source"
  "@version"
  "@operator"
  "@nodiscard"
  "@overload"
  "@enum"
  "@language"
  "@see"
  "@as"
  "@async"
  "@return"
] @tag @nospell

(language_injection
  "@language"
  (identifier) @tag @nospell)

(function_type
  [
    "fun"
    "function"
  ] @keyword.function @nospell)

[
  "extends"
  (diagnostic_identifier)
] @keyword @nospell

[
  "public"
  "protected"
  "private"
  "package"
  "@public"
  "@protected"
  "@private"
  "(exact)"
  "(key)"
] @keyword.modifier @nospell

(alias_annotation
  (identifier) @type.definition @nospell)

(member_type
  (identifier) @module @nospell)

(member_type
  (identifier) @type @nospell .)

(table_type
  "table" @type.builtin @nospell)

(builtin_type) @type.builtin @nospell

(class_annotation
  (identifier) @type @nospell)

(enum_annotation
  (identifier) @type @nospell)

((array_type
  [
    "["
    "]"
  ] @type)
  (#set! priority 105))

(type) @type

(module_annotation
  (string) @module @nospell)

[
  "["
  "]"
  "[["
  "]]"
  "[=["
  "]=]"
  "{"
  "}"
  "("
  ")"
  "<"
  ">"
] @punctuation.bracket

[
  ","
  "."
  "#"
  ":"
] @punctuation.delimiter

[
  "@"
  "?"
  "+"
  "-"
] @punctuation.special

;; CYAN: Ephemeral State
(identifier) @variable @nospell

[
  "..."
  "self"
] @variable.builtin @nospell

(param_annotation
  (identifier) @variable.parameter @nospell)

(parameter
  (identifier) @variable.parameter @nospell)

(field_annotation
  (identifier) @variable.member @nospell)

(table_literal_type
  field: (identifier) @variable.member @nospell)

(member_type
  [
    "#"
    "."
  ]
  .
  (identifier) @variable.member @nospell)

;; MAGENTA: Exceptional Data
(version_annotation
  version: _ @constant.builtin @nospell)

;; WHITE: Generic Data
[
  (string)
  (literal_type)
  "`"
] @string

(source_annotation
  filename: (identifier) @string @nospell
  extension: (identifier) @string @nospell)

[
  (number)
  (numeric_literal_type)
] @number

;; BLACK: Comments
(comment) @comment @spell

(at_comment
  (identifier) @type @nospell
  (_) @comment @spell)

(class_at_comment
  (identifier) @type @nospell
  ("extends"?
    (identifier)? @type @nospell)
  (_) @comment @spell)
