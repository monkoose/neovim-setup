Plug 'kassio/neoterm'                         " for better terminal experience
let g:neoterm_size         = 22
let g:neoterm_autoscroll   = 1
let g:neoterm_autoinsert   = 1
let g:neoterm_default_mod  = "belowright"
let g:neoterm_automap_keys = '<space>t'
nnoremap <silent>     <f10>       :Topen \| TREPLSendFile<cr>
nnoremap <silent>     <f9>        :Topen \| TREPLSendLine<cr>
vnoremap <silent>     <f9>        :Topen \| TREPLSendSelection<cr>
" toggle neoterm
nnoremap <silent>     <M-`>       :Ttoggle<cr>
tnoremap <silent>     <M-`>       <C-\><C-n>:Ttoggle<cr>
" close last neoterm
nnoremap <silent>     <space>tc   :Tclose<cr>
" toggle last neoterm
nnoremap <silent>     <space>tt   :Ttoggle<cr>
" clear neoterm
nnoremap <silent>     <space>tl   :Tclear<cr>
" kills the current job (send a <c-c>)
nnoremap <silent>     <space>tk   :Tkill<cr>
