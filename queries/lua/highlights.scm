;; extends

;; RED: Execution Halts
(function_call
  name: (identifier) @keyword.exception
  (#eq? @keyword.exception "error"))

;; Force 'local' to render as a structural boundary (Blue)
"local" @keyword.function
