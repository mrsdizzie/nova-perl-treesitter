((source_file . (comment) @processing)
(#lua-match? @processing "^#!/"))

[ "use" "no" "require" ] @keyword

[ "if" "elsif" "unless" "else" ] @keyword.condition

(conditional_expression [ "?" ":" ] @keyword.condition)

[ "BEGIN" "INIT" "CHECK" "UNITCHECK" "END" ] @keyword.condition

[ "while" "until" "for" "foreach" ] @keyword.condition

"return" @keyword

"sub" @keyword.construct

; technically an operator but used more like a builtin function
[ "qw" "eval" "map" "grep" ] @identifier.core

"package" @definition.package

[
  "do"
  "my" "our" "local"
  "last" "next" "redo" "goto"
  "undef"
] @keyword

(_ operator: _ @operator)
"\\" @operator

(phaser_statement phase: _ @keyword.phaser)

[
  "or" "and" "||"
  "eq" "ne" "cmp" "lt" "le" "ge" "gt"
  "isa"
] @keyword.operator

(eof_marker) @processing
(data_section) @comment

(pod) @comment

[
  (number)
  (version)
] @value.number

; these must be above string below to get priority in nova
((package) (string_literal) @string-template.value )
((package) (quoted_word_list) @string-template.value)


[
  (string_literal) 
  (interpolated_string_literal)
  (command_string) 
  (heredoc_content)
] @string

[
  (quoted_word_list)
  (heredoc_token)
  (command_heredoc_token)
  (heredoc_end)
] @string-template.value

[(escape_sequence) (escaped_delimiter)] @string-template.value

[  
 (quoted_regexp modifiers: _? @character.special)
 (match_regexp  modifiers: _? @character.special)
] @regex

(autoquoted_bareword _?) @string-template.value

(use_statement (package) @type)
(package_statement (package) @type)
(require_expression (bareword) @type)
((package) (quoted_word_list) @string-template.value)


(subroutine_declaration_statement name: (_) @identifier.function)
(attribute_name) @decorator
(attribute_value) @string

(label) @identifier.constant

(statement_label label: _ @identifier.constant)

(relational_expression operator: "isa" right: (bareword) @type)

(function_call_expression (function) @identifier.function)
(method_call_expression (method) @identifier.method)
(method_call_expression invocant: (bareword) @keyword.construct)

(func0op_call_expression function: _ @identifier.core)
(func1op_call_expression function: _ @identifier.core)

([(function)(expression_statement (bareword))] @identifier.core
 (#set! "priority" 101)
 (#match? @identifier.core
   "^(accept|atan2|bind|binmode|bless|crypt|chmod|chown|connect|die|dbmopen|exec|fcntl|flock|getpriority|getprotobynumber|gethostbyaddr|getnetbyaddr|getservbyname|getservbyport|getsockopt|glob|index|ioctl|join|kill|link|listen|mkdir|msgctl|msgget|msgrcv|msgsend|opendir|print|printf|push|pack|pipe|return|rename|rindex|read|recv|reverse|say|select|seek|semctl|semget|semop|send|setpgrp|setpriority|seekdir|setsockopt|shmctl|shmread|shmwrite|shutdown|socket|socketpair|split|sprintf|splice|substr|system|symlink|syscall|sysopen|sysseek|sysread|syswrite|tie|truncate|unlink|unpack|utime|unshift|vec|warn|waitpid|formline|open|sort)$"
))

(function) @identifier.function

; (ERROR) @invalid

(_
  "{" @punctuation.special
  (varname)
  "}" @punctuation.special
)
(varname 
  (block
    "{" @punctuation.special 
    "}" @punctuation.special 
  )
)

(
  [(varname) (filehandle)] @variable.builtin
  (#match? @variable.builtin "^((ENV|ARGV|INC|ARGVOUT|SIG|STDIN|STDOUT|STDERR)|[_ab]|\\W|\\d+|\\^.*)$")
)

(quoted_word_list) @string-template.value
(command_string) @string


(scalar) @identifier.variable
(scalar_deref_expression ["->" "$" "*"] @identifier.variable)
[(array) (arraylen)] @identifier.variable
(array_deref_expression [ "@" "*"] @identifier.variable)
(hash) @identifier.variable
(hash_deref_expression [ "%" "*"] @identifier.variable)

(array_element_expression array:(_) @identifier.variable)
(slice_expression array:(_) @identifier.variable)
(keyval_expression array:(_) @identifier.variable)

(hash_element_expression hash:(_) @identifier.variable)
(slice_expression hash:(_) @identifier.variable)
(keyval_expression hash:(_) @identifier.variable)

(hash_element_expression key: (autoquoted_bareword) @string.key)

(comment) @comment

(
  [ "=>" "," ";" "->" ] @punctuation.delimiter
)

(
  [ "[" "]" "{" "}" "(" ")" ] @bracket
  ; priority hack so nvim + ts-cli behave the same
  (#set! "priority" 90)
)
