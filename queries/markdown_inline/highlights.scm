;; extends

;; YELLOW: Branches/Logic
(strong_emphasis) @markup.strong
(emphasis) @markup.italic

;; YELLOW: Force strikethrough (Alias to strong for Yellow)
(strikethrough) @markup.strong

;; BLUE: Structure
(html_tag) @tag

;; Link/Image Brackets
(inline_link ["[" "]" "(" ")"] @punctuation.bracket)
(image ["[" "]" "(" ")"] @punctuation.bracket)

;; GREEN: Mutations/Execution
(code_span) @markup.raw

;; BLUE: Delimiter Override (must follow code_span)
(code_span_delimiter) @punctuation.delimiter

;; CYAN: Ephemeral State
(link_text) @markup.link.label
(image_description) @markup.link.label

;; WHITE: Generic Data (Addresses/URLs)
(link_destination) @string

;; AUTOLINKS: BLUE Brackets (Base node)
[
  (uri_autolink)
  (email_autolink)
] @punctuation.bracket

;; AUTOLINKS: CYAN inner text (Slice < >)
((uri_autolink) @property
  (#offset! @property 0 1 0 -1))
((email_autolink) @property
  (#offset! @property 0 1 0 -1))

;; MAGENTA: Exceptional Data
(image "!" @character.special)
(backslash_escape) @string.escape
(entity_reference) @character.special
(numeric_character_reference) @character.special
