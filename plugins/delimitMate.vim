Plug 'Raimondi/delimitMate'

let g:delimitMate_expand_cr    = 1
let g:delimitMate_expand_space = 1

augroup DelimitMatePython
  autocmd!
  autocmd FileType python let b:delimitMate_nesting_quotes = ['"']
augroup END