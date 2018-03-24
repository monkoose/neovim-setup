nnoremap <buffer> <silent> K :DUddoc<CR>
nnoremap <buffer> <silent> <space>d :DUjump<CR>
setlocal shiftwidth=4 softtabstop=-1

nnoremap <script> <silent> <F9> :<C-u>exec 'Topen \| T dmd -run ' . expand("%")<CR>
