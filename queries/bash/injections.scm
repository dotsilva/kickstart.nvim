;; AWK & JQ
((command
  name: (command_name (word) @injection.language)
  argument: [
    (string) @injection.content
    (raw_string) @injection.content
  ])
 (#any-of? @injection.language "awk" "jq")
 (#offset! @injection.content 0 1 0 -1))

;; SCRIPT ENGINES (via -c or -e)
((command
  name: (command_name (word) @injection.language)
  argument: (word) @_flag
  argument: [
    (string) @injection.content
    (raw_string) @injection.content
  ])
 (#any-of? @injection.language "bash" "sh" "ruby" "lua" "python" "perl" "node")
 (#any-of? @_flag "-c" "-e")
 (#offset! @injection.content 0 1 0 -1))

;; SQL (sqlite3, psql, mysql)
((command
  name: (command_name (word) @_cmd)
  argument: [
    (string) @injection.content
    (raw_string) @injection.content
  ])
 (#any-of? @_cmd "sqlite3" "psql" "mysql")
 (#offset! @injection.content 0 1 0 -1)
 (#set! injection.language "sql"))

;; REGEX (grep variants)
((command
  name: (command_name (word) @_cmd)
  argument: [
    (string) @injection.content
    (raw_string) @injection.content
  ])
 (#any-of? @_cmd "grep" "egrep" "fgrep")
 (#offset! @injection.content 0 1 0 -1)
 (#set! injection.language "regex"))

;; SED
((command
  name: (command_name (word) @_cmd)
  argument: [
    (string) @injection.content
    (raw_string) @injection.content
  ])
 (#eq? @_cmd "sed")
 (#offset! @injection.content 0 1 0 -1)
 (#set! injection.language "sed"))
