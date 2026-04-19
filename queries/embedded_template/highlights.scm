;; extends

;; YELLOW: Routing & Logic
[
  "<%"
  "<%="
  "<%=="
  "<%%"
  "<%_"
  "<%-"
  "%>"
  "-%>"
  "_%>"
  "%%>"
] @keyword.conditional

;; BLACK: Comments
(comment_directive) @comment @spell

(comment_directive
  "%>" @comment
  (#set! priority 110))
