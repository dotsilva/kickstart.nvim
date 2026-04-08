;; queries/markdown_inline/highlights.scm
;; extends

;; GREEN: Triggers & Mutations
(code_span) @markup.raw @nospell

;; YELLOW: Routing & Logic
(emphasis) @markup.italic
(strong_emphasis) @markup.strong

;; BLUE: Structure & Definition
([
  (code_span_delimiter)
  (emphasis_delimiter)
] @punctuation.delimiter
  (#set! conceal ""))

(inline_link
  [
    "["
    "]"
    "("
    ")"
  ] @punctuation.bracket
  (#set! conceal ""))

(image
  "!" @punctuation.special
  (#set! conceal ""))

(image
  [
    "["
    "]"
    "("
    ")"
  ] @punctuation.bracket
  (#set! conceal ""))

(full_reference_link
  [
    "["
    "]"
  ] @punctuation.bracket
  (#set! conceal ""))

(collapsed_reference_link
  [
    "["
    "]"
  ] @punctuation.bracket
  (#set! conceal ""))

(shortcut_link
  [
    "["
    "]"
  ] @punctuation.bracket
  (#set! conceal ""))

;; CYAN: Ephemeral State
[
  (link_label)
  (link_text)
  (link_title)
  (image_description)
] @markup.link.label

(full_reference_link
  (link_label) @markup.link.label
  (#set! conceal ""))

(shortcut_link
  (link_text) @markup.link.label @nospell)

;; MAGENTA: Exceptional Data
[
  (backslash_escape)
  (hard_line_break)
] @string.escape

(entity_reference) @character.special @nospell

((entity_reference) @character.special
  (#eq? @character.special "&nbsp;")
  (#set! conceal " "))

((entity_reference) @character.special
  (#eq? @character.special "&lt;")
  (#set! conceal "<"))

((entity_reference) @character.special
  (#eq? @character.special "&gt;")
  (#set! conceal ">"))

((entity_reference) @character.special
  (#eq? @character.special "&amp;")
  (#set! conceal "&"))

((entity_reference) @character.special
  (#eq? @character.special "&quot;")
  (#set! conceal "\""))

((entity_reference) @character.special
  (#any-of? @character.special "&ensp;" "&emsp;")
  (#set! conceal " "))

;; BLACK: Comments & Passive Data
[
  (uri_autolink)
  (email_autolink)
] @markup.link.url @nospell

(link_destination) @markup.link.url @nospell

(inline_link
  (link_destination) @markup.link.url
  (#set! conceal ""))

(image
  (link_destination) @markup.link.url
  (#set! conceal ""))

(strikethrough) @comment

;; Meta / UI Links
((inline_link
  (link_destination) @_url) @_label
  (#set! @_label url @_url))

((image
  (link_destination) @_url) @_label
  (#set! @_label url @_url))

((uri_autolink) @_url
  (#offset! @_url 0 1 0 -1)
  (#set! @_url url @_url))
