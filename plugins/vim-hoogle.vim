Plug 'Twinside/vim-hoogle'

let g:hoogle_search_jump_back = 0
let g:hoogle_search_bin       = 'hoogle -q'

augroup HoogleMaps
  autocmd!
  autocmd FileType haskell nnoremap <buffer>         <space>hs :Hoogle<space>
  autocmd FileType haskell nnoremap <buffer>         <space>hh :Hoogle<CR>
augroup END
