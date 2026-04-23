;; extends

;; GREEN: Mutations/Execution
(fenced_code_block) @markup.raw.block
(indented_code_block) @markup.raw.block
(html_block) @markup.raw.block

;; BLUE: Structure
(atx_heading) @markup.heading
(setext_heading) @markup.heading

[
  (atx_h1_marker)
  (atx_h2_marker)
  (atx_h3_marker)
  (atx_h4_marker)
  (atx_h5_marker)
  (atx_h6_marker)
  (setext_h1_underline)
  (setext_h2_underline)
] @markup.heading

[
  (list_marker_plus)
  (list_marker_minus)
  (list_marker_star)
  (list_marker_dot)
  (list_marker_parenthesis)
] @markup.list

(block_quote_marker) @markup.quote
(pipe_table_header
  (pipe_table_cell) @markup.heading)

;; BLUE: Table Pipes
(pipe_table_header "|" @punctuation.delimiter)
(pipe_table_row "|" @punctuation.delimiter)
(pipe_table_delimiter_row "|" @punctuation.delimiter)

(fenced_code_block_delimiter) @punctuation.delimiter

;; BLUE: Task Brackets (Alias to delimiter for Blue)
[
  (task_list_marker_unchecked)
  (task_list_marker_checked)
] @punctuation.delimiter

;; CYAN: Task 'x' (Slice inner char)
((task_list_marker_checked) @property
  (#offset! @property 0 1 0 -1))

;; CYAN: Ephemeral State
(info_string (language) @label)
(link_reference_definition
  (link_label) @markup.link.label)

;; WHITE: Generic Data (Addresses/URLs)
(link_reference_definition
  (link_destination) @string)

