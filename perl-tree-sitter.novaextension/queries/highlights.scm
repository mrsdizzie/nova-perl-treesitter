[
  "use" "no"
  "package"
  "sub"
  "if" "elsif" "else" "unless"
  "while" "until"
  "for" "foreach"
  "do"
  "my" "our" "local"
  "require"
  "last" "next" "redo" "goto"
  "undef"
  "return"
] @keyword.condition

[ "BEGIN" "INIT" "CHECK" "UNITCHECK" "END" ] @keyword.condition

[
  "or" "and" "||"
  "eq" "ne" "cmp" "lt" "le" "ge" "gt"
  "isa"
] @keyword.operator

; technically an operator but used more like a builtin function
[ "qw" ] @identifier.core
[ "eval" ] @identifier.core

(comment) @comment

(eof_marker) @processing
(data_section) @comment

(pod) @comment

(number) @value.number
(version) @value.number

((package) (string_literal) @string-template.value)
(string_literal) @string
(interpolated_string_literal) @string
((package) (quoted_word_list) @string-template.value)

(quoted_word_list) @string-template.value
(command_string) @string
[(heredoc_token) (command_heredoc_token)] @string-template.value
(heredoc_content) @string
(heredoc_end) @string-template.value
[(escape_sequence) (escaped_delimiter)] @string-template.value

(autoquoted_bareword _?) @string-template.value

(scalar) @identifier.variable
(scalar_deref_expression ["->" "$" "*"] @identifier.variable)
(array) @identifier.variable
(array_deref_expression ["->" "@" "*"] @identifier.variable) @identifier.variable
(hash) @identifier.variable
(hash_deref_expression ["->" "%" "*"] @identifier.variable)
(array_element_expression [array:(_) "->" "[" "]"] @identifier.variable)
(hash_element_expression [hash:(_) "->" "{" "}"] @identifier.variable)

(hash_element_expression key: (bareword) @string.key)

(use_statement (package) @type)
(package_statement (package) @type)
(require_expression (bareword) @type)


(subroutine_declaration_statement name: (_) @identifier.function)
(attrlist (attribute) @decorator)
[(quoted_regexp) (match_regexp)] @regex
(goto_expression (label) @label)
(loopex_expression (label) @label)

(statement_label label: _ @label)

(function_call_expression (function) @identifier.function)
(method_call_expression (method) @identifier.method)
(method_call_expression invocant: (bareword) @keyword.construct)

(func0op_call_expression function: _ @identifier.core)
(func1op_call_expression function: _ @identifier.core)

(function) @identifier.function

; (ERROR) @invalid
