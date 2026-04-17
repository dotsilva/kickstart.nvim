;; queries/xml/highlights.scm
;; extends

;; GREEN: Triggers & Mutations
(PI) @keyword.directive
(XMLDecl "xml" @keyword.directive)
(XmlModelPI "xml-model" @keyword.directive)
(StyleSheetPI "xml-stylesheet" @keyword.directive)

(PEDecl "%" @function.macro)

;; YELLOW: Routing & Logic
"|" @keyword.conditional

;; BLUE: Structure & Definition
[
  "ELEMENT"
  "ENTITY"
  "ATTLIST"
  "DOCTYPE"
  "NOTATION"
  "NDATA"
  "PUBLIC"
  "SYSTEM"
] @keyword.function

[
  "EMPTY"
  "ANY"
] @keyword.modifier

(STag (Name) @tag)
(ETag (Name) @tag)
(EmptyElemTag (Name) @tag)
(elementdecl (Name) @tag)
(doctypedecl (Name) @type.definition)

[
  (StringType)
  (TokenizedType)
  "#PCDATA"
] @type.builtin

(NotationType "NOTATION" @type.builtin)

"=" @keyword.modifier

[
  "<?"
  "?>"
  "<"
  ">"
  "</"
  "/>"
  "<!"
  "]]>"
] @tag.delimiter

(CDSect
  (CDStart) @tag.delimiter
  "]]>" @tag.delimiter)

[
  "("
  ")"
  "["
  "]"
] @punctuation.bracket

[
  "\""
  "'"
  ","
] @punctuation.delimiter

;; CYAN: Ephemeral State
(Attribute (Name) @tag.attribute)
(AttDef (Name) @tag.attribute)
(PseudoAtt (Name) @tag.attribute)
(contentspec (_ (Name) @tag.attribute))

(XMLDecl
  [
    "version"
    "encoding"
    "standalone"
  ] @tag.attribute)

(EntityRef) @variable.builtin
(PEReference) @variable.builtin
(PEDecl (Name) @variable.builtin)
(NDataDecl (Name) @label)
(NotationDecl (Name) @label)

;; MAGENTA: Exceptional Data
(XMLDecl
  [
    "yes"
    "no"
  ] @boolean)

((EntityRef) @constant.builtin
  (#any-of? @constant.builtin "&amp;" "&lt;" "&gt;" "&quot;" "&apos;"))

[
  "#REQUIRED"
  "#IMPLIED"
  "#FIXED"
] @constant.builtin

(CharRef) @string.escape

[
  "*"
  "?"
  "+"
] @character.special

;; WHITE: Generic Data
(Attribute (AttValue) @string)
(PseudoAtt (PseudoAttValue) @string)
(GEDecl (EntityValue) @string)
(PEDecl (EntityValue) @string)

(XMLDecl (EncName) @string)
(XMLDecl (VersionNum) @number)

(CharData) @string @spell
(CDSect (CData) @string)

(PubidLiteral) @string
(SystemLiteral (URI) @string)
(AttDef (Enumeration (Nmtoken) @string))

;; BLACK: Comments
(Comment) @comment @spell
