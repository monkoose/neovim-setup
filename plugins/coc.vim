Plug 'neoclide/coc.nvim', {'branch': 'release'}
" CocInstall coc-git coc-vimlsp coc-yank coc-lists coc-highlight coc-json
" coc-snippets coc-yaml coc-python coc-tsserver coc-html coc-css

let g:coc_snippet_next = '<M-e>'
let g:coc_snippet_prev = '<s-tab>'
inoremap <silent><expr>   <M-e>       pumvisible() ? coc#_select_confirm() : coc#refresh()
nmap     <silent>         <space>kd   <Plug>(coc-declaration)
nmap     <silent>         <space>kr   <Plug>(coc-references)
nmap     <silent>         <space>kR   <Plug>(coc-rename)
nmap     <silent>         <space>ka   :CocList actions
nmap     <silent>         <space>kf   <Plug>(coc-format)
nmap     <silent>         <space>ki   <Plug>(coc-diagnostic-info)
nmap     <silent>         <space>ko   :CocList outline<CR>
nnoremap <silent>         <space>kl   :call CocActionAsync('diagnosticList')<CR>
nnoremap <silent>         <space>kh   :call CocActionAsync('highlight')<CR>
vmap     <silent>         <space>ka   <Plug>(coc-codeaction-selected)
vmap     <silent>         <space>kf   <Plug>(coc-format-selected)
nmap     <silent>         <space>gi   <Plug>(coc-git-chunkinfo)
nmap     <silent>         <M-2>       :CocList quickfix<CR>
nmap     <silent>         <M-3>       :CocList locationlist<CR>
nmap                      <space>fm   :CocList mru<CR>
nmap                      <space>ff   :CocList files -L<CR>
nmap                      <space>ss   :CocList grep<CR>
nmap                      <space>sm   :CocList maps<CR>
nmap                      <space>sl   :CocList lines<CR>
nmap                      <space>sw   :CocList words<CR>
nmap                      <space>;    :CocList buffers<CR>

augroup CocFiletypeMaps
  autocmd!
  autocmd FileType css,scss,javascript,html,python,haskell,json,yaml
        \ nnoremap <buffer><silent>  K          :call CocActionAsync('doHover')<CR>
  autocmd FileType css,scss,javascript,html,python,haskell,json,yaml
        \ nmap     <buffer><silent>  <space>d   <Plug>(coc-definition)
  autocmd FileType css,scss,javascript,html,python,haskell,json,yaml
        \ nmap <buffer>      <space>l   <Plug>(coc-diagnostic-next-error)
  autocmd FileType css,scss,javascript,html,python,haskell
        \ nmap <buffer>      <space>L   <Plug>(coc-diagnostic-prev-error)
augroup END
