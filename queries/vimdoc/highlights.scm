;; queries/vimdoc/highlights.scm
;; extends

;; RED: Halts & Exceptions
((note) @error
  (#any-of? @error "Deprecated:" "DEPRECATED:"))

;; GREEN: Triggers & Mutations
(codespan
  "`" @markup.raw
  (#set! conceal ""))

(codespan
  text: (_) @markup.raw)

((codeblock) @markup.raw.block
  (#set! priority 90))

(codeblock
  ">" @markup.raw
  (#set! conceal ""))

(block
  "<" @markup.raw
  (#set! conceal ""))

(modeline) @keyword.directive

;; YELLOW: Routing & Logic
((note) @markup.strong
  (#any-of? @markup.strong "Warning:" "WARNING:"))

;; BLUE: Structure & Definition
(h1
  (delimiter) @markup.heading
  (heading) @markup.heading)

(h2
  (delimiter) @markup.heading
  (heading) @markup.heading)

(h3
  (heading) @markup.heading)

(column_heading
  (heading) @markup.heading)

(column_heading
  (delimiter) @markup.heading
  (#set! conceal ""))

;; CYAN: Ephemeral State
(tag
  "*" @label
  (#set! conceal ""))

(tag
  text: (_) @label)

(taglink
  "|" @markup.link.label
  (#set! conceal ""))

(taglink
  text: (_) @markup.link.label)

(optionlink
  text: (_) @markup.link.label)

(codeblock
  (language) @label
  (#set! conceal ""))

(argument) @variable.parameter

;; MAGENTA: Exceptional Data
(keycode) @character.special

;; BLACK: Comments & Passive Data
((url) @markup.link.url
  (#set! @markup.link.url url @markup.link.url))

((note) @comment
  (#any-of? @comment "Note:" "NOTE:" "Notes:"))
