setlocal complete+=t
setlocal formatoptions-=t
setlocal define=^\s*\\(def\\\\|class\\)

let b:delimitMate_nesting_quotes = ['"']

function! SelectionWithPython(line1, line2) range
  write
  let l:range = string(a:line1) . ',' . string(a:line2) . ' p'
  let l:string = 'sed -n "' . l:range . '" % | python'
  exec 'T ' . l:string
  return
endfunction
vmap <script> <silent> <F9> :call SelectionWithPython(line("'<"), line("'>"))<CR>
nmap <script> <silent> <F9> :call SelectionWithPython(1, line("$"))<CR>
