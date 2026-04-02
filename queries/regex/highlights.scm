;; YELLOW: Conditional Branches & Routing Logic
[
  (optional)
  (zero_or_more)
  (one_or_more)
  (count_quantifier)
  (start_assertion)
  (end_assertion)
  (boundary_assertion)
  (non_boundary_assertion)
  (identity_escape)
  (character_class_escape)
  (control_escape)
  (character_class)
  "|"
] @keyword.conditional

;; BLUE: Structural Architecture
[
  "("
  ")"
  "["
  "]"
  "{"
  "}"
  "(?"
  "(?:"
  "(?<"
  ">"
] @keyword.function
