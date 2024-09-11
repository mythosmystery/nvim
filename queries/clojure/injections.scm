(list_lit
  (sym_lit
    (sym_name) @fn-name (#eq? @fn-name "sql"))
  (str_lit) @injection.content
  (#offset! @injection.content 0 1 0 -1)
(#set! injection.language "sql"))
