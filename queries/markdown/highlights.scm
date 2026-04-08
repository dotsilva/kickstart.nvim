;; queries/markdown/highlights.scm
;; extends

;; GREEN: Triggers & Mutations
(indented_code_block) @markup.raw.block

((fenced_code_block) @markup.raw.block
  (#set! priority 90))

(fenced_code_block
  (fenced_code_block_delimiter) @markup.raw.block
  (#set! conceal "")
  (#set! conceal_lines ""))

;; BLUE: Structure & Definition
(setext_heading
  (paragraph) @markup.heading
  (setext_h1_underline) @markup.heading)

(setext_heading
  (paragraph) @markup.heading
  (setext_h2_underline) @markup.heading)

(atx_heading
  (atx_h1_marker)) @markup.heading

(atx_heading
  (atx_h2_marker)) @markup.heading

(atx_heading
  (atx_h3_marker)) @markup.heading

(atx_heading
  (atx_h4_marker)) @markup.heading

(atx_heading
  (atx_h5_marker)) @markup.heading

(atx_heading
  (atx_h6_marker)) @markup.heading

(pipe_table_header
  (pipe_table_cell) @markup.heading)

[
  (list_marker_plus)
  (list_marker_minus)
  (list_marker_star)
  (list_marker_dot)
  (list_marker_parenthesis)
  (task_list_marker_unchecked)
  (task_list_marker_checked)
] @markup.list

((block_quote) @markup.quote
  (#set! priority 90))

([
  (plus_metadata)
  (minus_metadata)
] @keyword.function
  (#set! priority 90))

(pipe_table_header
  "|" @punctuation.delimiter)

(pipe_table_row
  "|" @punctuation.delimiter)

(pipe_table_delimiter_row
  "|" @punctuation.delimiter)

(pipe_table_delimiter_cell) @punctuation.delimiter

((link_label)
  .
  ":" @punctuation.delimiter)

[
  (block_continuation)
  (block_quote_marker)
  (thematic_break)
] @punctuation.special

;; CYAN: Ephemeral State
(info_string) @label

(fenced_code_block
  (info_string
    (language) @label
    (#set! conceal "")
    (#set! conceal_lines "")))

[
  (link_title)
  (link_label)
] @markup.link.label

;; MAGENTA: Exceptional Data
(backslash_escape) @string.escape

;; BLACK: Comments & Passive Data
(link_destination) @markup.link.url

;; WHITE: Generic Data & Spellcheck
(inline) @spell
