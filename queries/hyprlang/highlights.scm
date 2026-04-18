;; extends

;; GREEN: Triggers & Mutations
[
  "source"
  "exec"
  "execr"
  "exec-once"
  "execr-once"
  "exec-shutdown"
] @function.builtin

[
  "rgb"
  "rgba"
] @function.builtin

[
  "-"
  "+"
] @function.builtin


;; BLUE: Structure & Definition
(keyword
  (name) @keyword.function)

(window_rule
  (name) @keyword.function)

(section
  (name) @module)

(assignment
  (name) @tag)

(mod) @keyword.modifier

"=" @keyword.modifier
"$" @keyword.modifier

[
  ","
  ";"
  ":"
  "x"
  "@"
] @punctuation.delimiter

[
  "("
  ")"
  "{"
  "}"
  "["
  "]"
] @punctuation.bracket

;; CYAN: Ephemeral State
(variable) @variable

(section
  device: (device_name) @variable.parameter)

;; MAGENTA: Exceptional Data (Axiom 3)
(boolean) @boolean
(mod) @constant.builtin
;; MAGENTA: Modifier chains with spaces (Axiom 3)
((string) @constant.builtin
  (#match? @constant.builtin "^[ \t]*(SUPER|SHIFT|CTRL|ALT|MOD[1-5]|WIN|LOGO|CAPS|CONTROL)([ \t]+(SUPER|SHIFT|CTRL|ALT|MOD[1-5]|WIN|LOGO|CAPS|CONTROL))*[ \t]*$"))

;; MAGENTA: Single keys, common cases (Axiom 3)
((string) @constant.builtin
  (#match? @constant.builtin "^[ \t]*([a-zA-Z0-9]|Return|RETURN|Space|SPACE|Tab|TAB|Esc|ESC|Escape|ESCAPE|Up|UP|Down|DOWN|Left|LEFT|Right|RIGHT|F[0-9]{1,2}|Home|HOME|End|END|Page_Up|PAGE_UP|Page_Down|PAGE_DOWN|Insert|INSERT|Delete|DELETE|Backspace|BACKSPACE|Print|PRINT)[ \t]*$"))

;; WHITE: Generic Data
[
  "deg"
  (string)
  (string_literal)
] @string

[
  (number)
  (legacy_hex)
  (angle)
  (hex)
] @number

;; MAGENTA: Modifier chains with spaces (Axiom 3)
;; Must stay below generic (string) @string to win precedence
((string) @constant.builtin
  (#match? @constant.builtin "^[ \t]*(SUPER|SHIFT|CTRL|ALT|MOD[1-5]|WIN|LOGO|CAPS|CONTROL)([ \t]+(SUPER|SHIFT|CTRL|ALT|MOD[1-5]|WIN|LOGO|CAPS|CONTROL))*[ \t]*$"))

;; MAGENTA: Single keys, common cases (Axiom 3)
;; Must stay below generic (string) @string to win precedence
((string) @constant.builtin
  (#match? @constant.builtin "^[ \t]*([a-zA-Z0-9]|Return|RETURN|Space|SPACE|Tab|TAB|Esc|ESC|Escape|ESCAPE|Up|UP|Down|DOWN|Left|LEFT|Right|RIGHT|F[0-9]{1,2}|Home|HOME|End|END|Page_Up|PAGE_UP|Page_Down|PAGE_DOWN|Insert|INSERT|Delete|DELETE|Backspace|BACKSPACE|Print|PRINT)[ \t]*$"))

;; GREEN: Dispatchers (Axiom 1)
;; Must stay below generic (string) @string to win precedence
((string) @function.builtin
  (#match? @function.builtin "^[ \t]*(exec|workspace|killactive|togglegroup|pass)[ \t]*$"))

;; BLACK: Comments
(comment) @comment @spell
