; Technically functions in a package are methods too, but there is no way to disambiguate between them for now
; (source_file
;   (package_statement)
; (subroutine_declaration_statement
;     name: (bareword) @name
;    (#set! role method)
;   ) @subtree
; )

(subroutine_declaration_statement
  name: (bareword) @name
 (#set! role function)
) @subtree

; ambiguous_function_call_expression with a string literal then sub is what Mojolicious routes look like
(ambiguous_function_call_expression
  (function) @name
  (string_literal) @name
  (anonymous_subroutine_expression
  (#set! role function)
)) @subtree

(source_file
  (package_statement
    name: (package) @name
  )
  (#set! role class)
) @subtree

(variable_declaration
    variable: (scalar
    (varname) @name
    (#set! role variable)
)) @subtree

(variable_declaration
    variable: (hash
    (varname) @name
    (#set! role variable)
)) @subtree

(variable_declaration
    variable: (array
    (varname) @name
    (#set! role variable)
)) @subtree

(class_statement
 name: (package) @name
 (#set! role class)
) @subtree