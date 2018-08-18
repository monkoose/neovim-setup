setlocal complete+=t
setlocal formatoptions-=t
setlocal define=^\s*\\(def\\\\|class\\)

let b:delimitMate_nesting_quotes = ['"']

function! SelectionWithPython(line1, line2) range
  write
  exec printf('Topen | T sed -n "%s,%s p" %s | python', a:line1, a:line2, expand('%'))
endfunction
vmap <script> <silent> <F9> :call SelectionWithPython(line("'<"), line("'>"))<CR>
nmap <script> <silent> <F9> :call SelectionWithPython(1, line("$"))<CR>
let g:jedi#goto_command = '<space>d'
let g:jedi#rename_command = '<space>r'
let g:jedi#goto_assignments_command = '<space>jd'
let g:jedi#usages_command = '<space>ju'
let g:jedi#documentation_command = 'K'

