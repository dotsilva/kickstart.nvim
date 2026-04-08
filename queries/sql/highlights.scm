;; queries/sql/highlights.scm
;; extends

;; RED: Halts, Exceptions & Destructive Operations
[
  (keyword_delete)
  (keyword_drop)
  (keyword_truncate)
] @keyword.exception

;; GREEN: Triggers & Mutations
[
  (keyword_insert)
  (keyword_update)
  (keyword_alter)
  (keyword_create)
  (keyword_merge)
  (keyword_replace)
  (keyword_set)
] @function.builtin

(invocation
  (object_reference
    name: (identifier) @function.call))

[
  (keyword_gist)
  (keyword_btree)
  (keyword_hash)
  (keyword_spgist)
  (keyword_gin)
  (keyword_brin)
  (keyword_array)
  (keyword_object_id)
] @function.call

(term
  value: (cast
    name: (keyword_cast) @function.call
    parameter: (literal)?))

[
  "+"
  "-"
  "*"
  "/"
  "%"
  "^"
] @function.builtin

;; YELLOW: Routing & Logic
[
  (keyword_where)
  (keyword_join)
  (keyword_on)
  (keyword_group)
  (keyword_order)
  (keyword_having)
  (keyword_by)
  (keyword_case)
  (keyword_when)
  (keyword_then)
  (keyword_else)
  (keyword_if)
  (keyword_exists)
  (keyword_union)
  (keyword_except)
  (keyword_intersect)
  (keyword_in)
  (keyword_and)
  (keyword_or)
  (keyword_not)
  (keyword_is)
  (keyword_between)
  (keyword_like)
  (keyword_similar)
  (keyword_any)
  (keyword_all)
  (keyword_some)
] @keyword.conditional

[
  "<"
  "<="
  "!="
  ">="
  ">"
  "<>"
  (op_other)
  (op_unary_other)
] @keyword.conditional

;; BLUE: Structure & Definition
[
  (keyword_from)
  (keyword_into)
  (keyword_table)
  (keyword_tables)
  (keyword_view)
  (keyword_schema)
  (keyword_database)
  (keyword_index)
  (keyword_column)
  (keyword_columns)
  (keyword_primary)
  (keyword_foreign)
  (keyword_key)
  (keyword_references)
  (keyword_constraint)
  (keyword_partition)
  (keyword_window)
  (keyword_values)
  (keyword_value)
  (keyword_as)
  (keyword_with)
  (keyword_without)
  (keyword_left)
  (keyword_right)
  (keyword_outer)
  (keyword_inner)
  (keyword_full)
  (keyword_cross)
  (keyword_lateral)
  (keyword_natural)
  (keyword_distinct)
  (keyword_limit)
  (keyword_offset)
  (keyword_using)
  (keyword_begin)
  (keyword_commit)
  (keyword_rollback)
  (keyword_transaction)
  (keyword_end)
  (keyword_default)
] @keyword.function

[
  (keyword_materialized)
  (keyword_recursive)
  (keyword_temp)
  (keyword_temporary)
  (keyword_unlogged)
  (keyword_external)
  (keyword_volatile)
  (keyword_restrict)
  (keyword_unbounded)
  (keyword_unique)
  (keyword_cascade)
  (keyword_local)
  (keyword_cascaded)
  (keyword_asc)
  (keyword_desc)
] @keyword.modifier

[
  ":="
  "="
] @keyword.modifier

((object_reference
  name: (identifier) @type) @_obj_ref
  (#not-has-parent? @_obj_ref invocation))

(cte
  (identifier) @type)

(column_definition
  name: (identifier) @tag)

[
  (keyword_int)
  (keyword_null)
  (keyword_boolean)
  (keyword_binary)
  (keyword_varbinary)
  (keyword_image)
  (keyword_bit)
  (keyword_inet)
  (keyword_character)
  (keyword_smallserial)
  (keyword_serial)
  (keyword_bigserial)
  (keyword_smallint)
  (keyword_mediumint)
  (keyword_bigint)
  (keyword_tinyint)
  (keyword_decimal)
  (keyword_float)
  (keyword_double)
  (keyword_numeric)
  (keyword_real)
  (double)
  (keyword_money)
  (keyword_smallmoney)
  (keyword_char)
  (keyword_nchar)
  (keyword_varchar)
  (keyword_nvarchar)
  (keyword_varying)
  (keyword_text)
  (keyword_string)
  (keyword_uuid)
  (keyword_json)
  (keyword_jsonb)
  (keyword_xml)
  (keyword_bytea)
  (keyword_enum)
  (keyword_date)
  (keyword_datetime)
  (keyword_time)
  (keyword_datetime2)
  (keyword_datetimeoffset)
  (keyword_smalldatetime)
  (keyword_timestamp)
  (keyword_timestamptz)
  (keyword_geometry)
  (keyword_geography)
  (keyword_box2d)
  (keyword_box3d)
  (keyword_interval)
] @type.builtin

[
  "("
  ")"
] @punctuation.bracket

[
  ";"
  ","
  "."
] @punctuation.delimiter

;; CYAN: Ephemeral State & Observation
[
  (keyword_select)
  (keyword_show)
  (keyword_explain)
  (keyword_analyze)
] @variable.builtin

(relation
  alias: (identifier) @variable)

(term
  alias: (identifier) @variable)

(field
  name: (identifier) @property)

(parameter) @variable.parameter

;; MAGENTA: Exceptional Data
[
  (keyword_true)
  (keyword_false)
] @boolean

;; WHITE: Generic Data
(literal) @string

((literal) @number
  (#lua-match? @number "^%d+$"))

((literal) @number.float
  (#lua-match? @number.float "^[-]?%d*%.%d*$"))

;; BLACK: Comments
(comment) @comment @spell
(marginalia) @comment
