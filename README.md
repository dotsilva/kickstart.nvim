# cromanomy

## Telos Semantics (TeloS)

### The 4 axioms

1. Mutate vs. Observe (Green vs. Cyan): Actions that mutate state, execute processes, or write to disk are Green. Elements that simply read state, reference memory, or act as parameterless observations are Cyan.

2. Structure vs. Flow (Blue vs. Yellow): Elements that build scaffolding, define types, or label data are Blue. Elements that dictate the path of execution through that architecture are Yellow.

3. Exceptional vs. Generic Data (Magenta vs. White): Keyworded, exceptional, or unprintable data states are Magenta. Literal, inert text and standard numbers are White.

4. Halt vs. Passive (Red vs. Black): Commands that actively kill the current execution path or throw errors are Red. Code ignored by the compiler or terminal output is Black.

### Color semantics for code/text highlight

* **Background (`#1E1E1E`; `#363636`; `#4E4E4E`; `#666666`)**
  * `#1E1E1E` is the main code background and is not reused as background for other elements.

* **Black (`#8A8A8A`)**
  * Comments.

* **Red (`#F34E4E`): Halts and terminations.**
  * Control flow: `return`, `break`, `continue`, `next`, `yield`, `await`, `panic!`, `assert`.
  * Exceptions: `raise`, `throw`, `catch`, `error`, `rescue`, `ensure`, `finally`.
  * Git: deletions/diff deletions.
  * Database/Network: `DELETE`, `DROP`, `TRUNCATE`, `REVOKE`.

* **Green (`#36DB36`): Invocation and execution.**
  * Function calls: explicit method invocations and built-in commands: `require`, `puts`, `echo`, `user.save!`, `string.gsub()`, `jq`.
  * Transformations: arithmetic operators: `+`, `-`, `*`, `/`, `%`, `++`, `--`.
  * String evaluation: Interpolation boundaries `#{ }`, `${ }`, invoking execution inside strings.
  * Macros: C/Zig macros, Make directives.
  * Infra/Build: `RUN`, `CMD`, `ENTRYPOINT`.
  * Shell triggers: command substitutions: `$()`,``` `` ```.
  * Database/Network: `INSERT`, `UPDATE`, `ALTER`, `CREATE`,`POST`, `PUT`, `PATCH`.
  * Git: additions/diff additions.

* **Yellow (`#CFCF2A`): Routing and logic.**
  * Conditionals: `if`, `else`, `elsif`, `match`, `switch`, `case`.
  * Loops: `for`, `while`, `do`, `until`.
  * Logic and comparisons: `&&`, `||`, `!`, `and`, `or`, `==`, `!=`, `>`, `<`, `>=`, `<=`.
  * Bitwise: `&`, `|`, `^`, `<<`, `>>`.
  * Safe-navigation operators: `&.`, `?.`.
  * Null-coalescing operators: `??`, `||=`.
  * Data flow: bash pipes: `|`, redirections: `>`, `<`.
  * Embedded templates:  template execution bounds: `<%`, `<%=`, `%>`.
  * Database: `WHERE`, `JOIN`, `ON`, `GROUP BY`, `ORDER BY`, `HAVING`.
  * Git: git diff changed hunks (@@)

* **Blue (`#7E7EFF`): Structure and definition.**
  * `class`, `module`, `def`, `local`, `function`, `struct`, `enum`, `interface`, `var`, `let`, `const`...
  * Types and Constants: defined classes (`String`, `User`), primitives types (`int`, `bool`), and uppercase constants.
  * Punctuation: braces `{}`, brackets `[]`, parentheses `()`, commas `,`, colons `:`, semicolons `;`.
  * Assignment: `=`, `:=`, `+=`, `-=`.
  * Decorators and annotations (`@override`, `[derive(Debug)]`).
  * Modifiers (`public`, `private`, `static`, `extern`, `async`).
  * Shell flags (`-v`, `--force`)
  * Type Mechanics: generics (`<T>`), casts/coercions (`as type`).
  * Object plumbing: the dot operator (`.`) in `user.name`, this is structural glue.
  * Heredoc boundaries (`<<EOF`, `EOF`).
  * String boundaries (`''`, `""`).
  * Data Formats: json/toml keys, html/xml tags, css selectors, http headers.
  * Markup: Markdown headings `#`, list markers (`*`, `-`).
  * Database/Infra: Table names, column definitions `VARCHAR`, `FROM`, `EXPOSE`, `VOLUME`, `WORKDIR`.

* **Magenta/Purple (`#E742E7`): Exceptional data.**
  * Booleans (`true`, `false`).
  * Nulls (`nil`, `null`, `undefined`, `None`...).
  * Globs and wildcards (`*.txt`).
  * Regex pattern descriptors and instructions: anchors, quantifiers and escape sequences (`^`, `$`, `*`, `+`, `?`, `{m,n}`, `\w`, `\d`, `\b`)
  * Escapes: string escape sequences (`\n`, `\t`, `\u0000`, `\x1b`...)
  
* **Cyan (`#38D5D5`): Ephemeral state and references.**
  * Variables: local variables, function parameters, arguments.
  * State observation: object fields, table properties and parameterless getters (`user.name`, `user.empty?`)
  * Memory/pointers: dereferencing `*ptr`, address-of `&val`.
  * Self-reference: `self`, `this`, instance variables `@var`, class variables `@@var`.
  * Treesitter query captures (`@function`, `@keyword`)
  * jq key targets
  * Environment: bash environment variables `$PATH`, docker (`ENV`, `ARG`).
  * Data formats: html/xml attributes, css properties.
  * Database/network: `SELECT`, `SHOW`, `DESCRIBE`, `GET`, `HEAD`, `OPTIONS`.

* **White (`#D2D2D2`): Generic data.**
  * String content (`'text inside is white, quotes are blue'`, `"text inside is white, quotes are blue"`...)
  * Numbers (`12`, `12.5`, `0xff`...)
  * Regex: literal characters to be matched.
  * Markup: standard paragraph text.
