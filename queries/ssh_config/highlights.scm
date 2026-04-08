;; queries/ssh_config/highlights.scm
;; extends

;; GREEN: Triggers & Mutations
[
  "+"
  "-"
  "^"
] @function.builtin

[
  "${"
  "}"
] @function.builtin

;; YELLOW: Routing & Logic
"Match" @keyword.conditional

"!" @keyword.conditional

;; BLUE: Structure & Definition
"Host" @keyword.function

(parameter
  keyword: _ @keyword.function)

(host_declaration
  argument: _ @module)

"=" @keyword.modifier

[
  "\""
  ","
  ":"
  "@"
] @punctuation.delimiter

;; CYAN: Ephemeral State
(match_declaration
  (condition
    criteria: _ @property))

[
  "SSH_AUTH_SOCK"
  (variable)
] @variable.builtin

[
  (kex)
  (mac)
  (cipher)
  (key_sig)
] @variable.parameter

;; MAGENTA: Exceptional Data
[
  "yes"
  "no"
] @boolean

[
  "ask"
  "auto"
  "none"
  "any"
  "always"
  "autoask"
  "md5"
  "sha256"
  "unbound"
  "host-bound"
  "force"
  "subsystem"
  "default"
  "accept-new"
  "off"
  "point-to-point"
  "ethernet"
  (ipqos)
  (verbosity)
  (facility)
  (authentication)
  "all"
] @constant.builtin

(pattern) @string.regexp

[
  "*"
  "?"
] @character.special

;; WHITE: Generic Data
[
  (string)
  (uri)
  (token)
] @string

[
  (number)
  (bytes)
  (time)
] @number

;; BLACK: Comments
(comment) @comment @spell
