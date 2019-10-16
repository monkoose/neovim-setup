augroup ft_load
  autocmd!
  autocmd FileType qf setlocal wrap
  autocmd FileType lua setlocal tabstop=4 softtabstop=4 shiftwidth=4
  autocmd FileType vim setlocal iskeyword-=#
  autocmd FileType python setlocal complete+=t formatoptions-=t define=^\s*\\(def\\\\|class\\)
  autocmd FileType python let b:delimitMate_nesting_quotes = ['"']
  autocmd FileType css,scss setlocal iskeyword+=-
  autocmd FileType css,scss,javascript,html,python nnoremap <buffer><silent>  K          :call CocActionAsync('doHover')<CR>
  autocmd FileType css,scss,javascript,html,python nmap     <buffer><silent>  <space>d   <Plug>(coc-definition)
augroup END

""""""""""""""""""""""""""""""""" haskell
augroup ft_haskell
  autocmd!
  autocmd BufWrite *.hs ALEFix
  autocmd User ALEFixPost write
  autocmd FileType haskell setlocal tabstop=4 softtabstop=4 shiftwidth=4
  autocmd FileType haskell nnoremap <buffer>         <space>hs :Hoogle<space>
  autocmd FileType haskell nnoremap <buffer>         <space>hh :Hoogle<CR>
  autocmd FileType haskell nnoremap <buffer>         K         :HdevtoolsType<CR>
  autocmd FileType haskell nmap     <buffer><silent> <space>/  :nohlsearch <bar> :call hdevtools#type_clear()<CR>
  " autocmd FileType haskell nnoremap <buffer><silent>  K          :call CocActionAsync('doHover')<CR>
  " autocmd FileType haskell nmap <buffer><silent>      <space>d   <Plug>(coc-definition)
augroup END
