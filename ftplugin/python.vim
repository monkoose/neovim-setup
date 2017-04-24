setlocal complete+=t
setlocal formatoptions-=t
setlocal define=^\s*\\(def\\\\|class\\)
let b:delimitMate_nesting_quotes = ['"']
