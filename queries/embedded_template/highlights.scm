;; queries/embedded_template/highlights.scm
;; extends

;; YELLOW: Routing & Logic
[
  "<%#"
  "<%"
  "<%="
  "<%_"
  "<%-"
  "%>"
  "-%>"
  "_%>"
] @keyword.conditional

;; BLACK: Comments
(comment_directive) @comment @spell
