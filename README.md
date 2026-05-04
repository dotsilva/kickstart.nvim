
# karpos.nvim

* This is the specification for the syntax highlight in karpos.nvim neovim theme, using an operational approach it assigns colors to elements based on what they do instead of their grammatical identity.

## The Axioms of Operational Syntax
* *Green (To Work):* Elements that mutate, execute processes or write to disk (function/method calls, mutations, triggers, commands, etc).
* *Cyan (To Reference):* Elements that passively link to memory or act as inert pointers to data like placeholders (e.g. calling a variable, calling json key through jq, links, file paths, etc).
* *Blue (To Define):* Elements that build structural scaffolding, establish boundaries, define abstractions (structural punctuation, class/variable declarations, type definitions, function/method/variable definitions, etc).
* *Yellow (To Route):* Elements that actively dictate flow, fork or loop the path of execution through that defined architecture (``if``, ``else``, ``switch``, loops, quantifiers, etc).
* *Magenta (To Signal):* Special data that alert the compiler/interpreter to exceptional states (escape characters, boolean values, `null`, etc).
* *White (To Say):* Arbitrary literal normal data (standard numbers, literal text strings, etc).
* *Red (To Stop):* Commands that stop or pause code execution, either of the whole program or just some code block/line within it (``break``, ``await``, etc).
* *Black (To Comment):* Elements that are moot, structurally ignored by the compiler/interpreter, and exist only as passive human notes, even stuff like luadoc (comments, docstrings, etc).
