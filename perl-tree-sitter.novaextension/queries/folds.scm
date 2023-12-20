; Functions
(subroutine_declaration_statement
  body: (block
    "{" @start
    "}" @end)
  (#set! role function)
)

(anonymous_subroutine_expression
  body: (block
    "{" @start
    "}" @end)
  (#set! role function)
)

(eval_expression
  (block
    "{" @start
    "}" @end)
  (#set! role block)
)

(loop_statement
  (block
    "{" @start
    "}" @end)
  (#set! role block)
)

(for_statement
  (block
    "{" @start
    "}" @end)
  (#set! role block)
)

(conditional_statement
  block: (block
    "{" @start
    "}" @end)
)

(else
  block: (block
    "{" @start
    "}" @end)
  (#set! role block)
)

(elsif
  block: (block
    "{" @start
    "}" @end)
  (#set! role block)
)
