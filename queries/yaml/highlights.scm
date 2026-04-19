;; extends

;; GREEN: Triggers & Mutations
[
  (yaml_directive)
  (tag_directive)
  (reserved_directive)
] @keyword.directive

;; BLUE: Structure & Definition
(block_mapping_pair
  key: (flow_node
    [
      (double_quote_scalar)
      (single_quote_scalar)
    ] @tag))

(block_mapping_pair
  key: (flow_node
    (plain_scalar
      (string_scalar) @tag)))

(flow_mapping
  (_
    key: (flow_node
      [
        (double_quote_scalar)
        (single_quote_scalar)
      ] @tag)))

(flow_mapping
  (_
    key: (flow_node
      (plain_scalar
        (string_scalar) @tag))))

(tag) @type

[
  ","
  "-"
  ":"
  ">"
  "?"
  "|"
] @punctuation.delimiter

[
  "["
  "]"
  "{"
  "}"
] @punctuation.bracket

[
  "---"
  "..."
] @punctuation.special

;; CYAN: Ephemeral State
[
  (anchor_name)
  (alias_name)
] @label

[
  "*"
  "&"
] @variable.builtin

;; MAGENTA: Exceptional Data
(boolean_scalar) @boolean

(null_scalar) @constant.builtin

(escape_sequence) @string.escape

; Norway problem boolean overrides
(block_mapping_pair
  value: (block_node
    (block_sequence
      (block_sequence_item
        (flow_node
          (plain_scalar
            (string_scalar) @boolean
            (#any-of? @boolean "TRUE" "FALSE" "True" "False")))))))

(block_mapping_pair
  value: (flow_node
    (plain_scalar
      (string_scalar) @boolean
      (#any-of? @boolean "TRUE" "FALSE" "True" "False"))))

;; WHITE: Generic Data
(double_quote_scalar) @string

(single_quote_scalar) @string

((block_scalar) @string
  (#set! priority 99))

(string_scalar) @string

(integer_scalar) @number

(float_scalar) @number

;; BLACK: Comments
(comment) @comment @spell
