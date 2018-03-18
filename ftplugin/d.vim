nnoremap <buffer> <silent> K :DUddoc<CR>
nnoremap <buffer> <silent> <space>d :DUjump<CR>
setlocal shiftwidth=4 softtabstop=-1

nmap <script> <silent> <F9> :exec 'T dmd -run ' . expand("%")<CR>
