Plug 'kassio/neoterm'

let g:neoterm_size         = 22
let g:neoterm_autoscroll   = 1
let g:neoterm_autoinsert   = 1
let g:neoterm_default_mod  = "belowright"
let g:neoterm_automap_keys = '<space>t'

nnoremap    <silent>    <M-`>        :Ttoggle<cr>
tnoremap    <silent>    <M-`>        <C-\><C-n>:Ttoggle<cr>
nnoremap    <silent>    <space>tc    :Tclose<cr>
nnoremap    <silent>    <space>tt    :Ttoggle<cr>
nnoremap    <silent>    <space>tl    :Tclear<cr>
" kills the current job (send a <c-c>)
nnoremap    <silent>    <space>tk    :Tkill<cr>
