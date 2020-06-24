Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'antoinemadec/coc-fzf'
" CocInstall coc-vimlsp coc-yank coc-lists coc-json
" coc-snippets coc-yaml coc-python coc-tsserver coc-html coc-css

let g:coc_snippet_next = '<M-e>'
let g:coc_snippet_prev = '<M-r>'
inoremap <silent><expr>   <M-e>       pumvisible() ? coc#_select_confirm() : coc#refresh()
nmap     <silent>         <space>kk   :CocRestart<CR>
nmap     <silent>         <space>D    <Plug>(coc-declaration)
nmap     <silent>         <space>kr   <Plug>(coc-references)
nmap     <silent>         <space>kR   <Plug>(coc-rename)
nmap     <silent>         <space>ka   :CocFzfList actions<CR>
nmap     <silent>         <space>kD   :CocFzfList diagnostics<CR>
nmap     <silent>         <space>kd   :CocFzfList diagnostics --current-buf<CR>
nmap     <silent>         <space>ky   :CocFzfList yank<CR>
nmap     <silent>         <space>ks   :CocFzfList symbols<CR>
nmap     <silent>         <space>kf   <Plug>(coc-format)
nmap     <silent>         <space>ki   <Plug>(coc-diagnostic-info)
nmap     <silent>         <space>ko   :CocFzfList outline<CR>
nmap     <silent>         <space>kl   :CocFzfList<CR>
vmap     <silent>         <space>ka   <Plug>(coc-codeaction-selected)
vmap     <silent>         <space>kf   <Plug>(coc-format-selected)

augroup CocFiletypeMaps
  autocmd!
  autocmd FileType css,scss,javascript,typescript,html,python,haskell,json,yaml,vim,svelte,sh
        \ nnoremap <buffer><silent>  K          :call CocActionAsync('doHover')<CR>
  autocmd FileType css,scss,javascript,typescript,html,python,haskell,json,yaml,vim,svelte,sh
        \ nmap     <buffer><silent>  <space>d   <Plug>(coc-definition)
  autocmd FileType css,scss,javascript,typescript,html,python,haskell,json,yaml,vim,svelte,sh
        \ nmap <buffer>      <space>l   <Plug>(coc-diagnostic-next)
  autocmd FileType css,scss,javascript,typescript,html,python,haskell,json,yaml,vim,svelte,sh
        \ nmap <buffer>      <space>L   <Plug>(coc-diagnostic-prev)
  autocmd FileType haskell vmap <buffer><silent> K :call CocActionAsync('doHover')<CR>
augroup END
