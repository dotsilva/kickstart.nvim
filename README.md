
# Chromanomy

* This is the specification for the syntax highlight in Chromanomy neovim theme, using an operational approach it assigns colors to elements based on what they do instead of their grammatical identity.

## The 4 Axioms of Operational Syntax

**1. The Execution Axis: Working (Green) vs Referencing (Cyan)**
* *Green (To Work):* Actions that permanently alter state, execute processes, burn CPU cycles, or write to disk. (Function calls, mutations, triggers).
* *Cyan (To Reference):* Elements that passively link to memory, fetch existing state, or act as inert pointers to data. (Variable usage, object properties being read, parameters).

**2. The Architecture Axis: Defining (Blue) vs Routing (Yellow)**
* *Blue (To Define):* Elements that build structural scaffolding, declare types, establish boundaries, or shape data containers. (Brackets, class/variable declarations, type definitions).
* *Yellow (To Route):* Elements that actively dictate, branch, or loop the path of execution through that defined architecture. (If/else, switch, loops, quantifiers).

**3. The Data Axis: Signaling (Magenta) vs Saying (White)**
* *Magenta (To Signal):* Elements that alert the compiler to exceptional states, system-level overrides, or unprintable/special constants. (Escape characters, boolean keywords like `true`/`false`, decorators, `null`).
* *White (To Say):* The literal, raw, inert data the program is actively communicating. (Standard numbers, literal text strings).

**4. The Terminal Axis: Stopping (Red) vs Commenting (Black)**
* *Red (To Stop):* Commands that actively kill the current execution path, throw errors, or force an immediate exit. (Return, throw, break, exceptions).
* *Black (To Comment):* Elements that are entirely moot, structurally ignored by the compiler, and exist only as passive human notes. (Comments, docstrings).

