(subroutine_declaration_statement
  name: (bareword) @name
 (#set! role function)
) @subtree

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
