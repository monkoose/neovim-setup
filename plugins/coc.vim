Plug 'neoclide/coc.nvim', {'branch': 'release'}
" CocInstall coc-git coc-vimlsp coc-yank coc-lists coc-highlight coc-json
" coc-snippets coc-yaml coc-python coc-tsserver coc-html coc-css

let g:coc_snippet_next = '<M-e>'
let g:coc_snippet_prev = '<M-f>'
inoremap <silent><expr>   <M-e>       pumvisible() ? coc#_select_confirm() : coc#refresh()
nmap     <silent>         <space>kd   <Plug>(coc-declaration)
nmap     <silent>         <space>kr   <Plug>(coc-references)
nmap     <silent>         <space>kR   <Plug>(coc-rename)
nmap     <silent>         <space>ka   :CocList actions<CR>
nmap     <silent>         <space>kf   <Plug>(coc-format)
nmap     <silent>         <space>ki   <Plug>(coc-diagnostic-info)
nmap     <silent>         <space>ko   :CocList outline<CR>
nmap     <silent>         <space>gi   <Plug>(coc-git-chunkinfo)
nnoremap <silent>         <space>kl   :call CocActionAsync('diagnosticList')<CR>
vmap     <silent>         <space>ka   <Plug>(coc-codeaction-selected)
vmap     <silent>         <space>kf   <Plug>(coc-format-selected)

augroup CocFiletypeMaps
  autocmd!
  autocmd FileType css,scss,javascript,typescript,html,python,haskell,json,yaml,vim
        \ nnoremap <buffer><silent>  K          :call CocActionAsync('doHover')<CR>
  autocmd FileType css,scss,javascript,typescript,html,python,haskell,json,yaml,vim
        \ nmap     <buffer><silent>  <space>d   <Plug>(coc-definition)
  autocmd FileType css,scss,javascript,typescript,html,python,haskell,json,yaml,vim
        \ nmap <buffer>      <space>l   <Plug>(coc-diagnostic-next)
  autocmd FileType css,scss,javascript,typescript,html,python,haskell,json,yaml,vim
        \ nmap <buffer>      <space>L   <Plug>(coc-diagnostic-prev)
  autocmd FileType haskell vmap <buffer><silent> K :call CocActionAsync('doHoever')<CR>
augroup END
