Plug 'neoclide/coc.nvim', {'branch': 'release'}                 " adds autocompletion and langserver

let g:coc_snippet_next = '<tab>'
let g:coc_snippet_prev = '<s-tab>'
inoremap <silent><expr> <M-e> pumvisible() ? "\<C-y>" : coc#refresh()
nmap <silent>     <space>kd     <Plug>(coc-declaration)
nmap <silent>     <space>kr     <Plug>(coc-references)
nmap <silent>     <space>kR     <Plug>(coc-rename)
nmap <silent>     <space>ka     <Plug>(coc-codeaction)
nmap <silent>     <space>kf     <Plug>(coc-format)
nmap <silent>     <space>ki     <Plug>(coc-diagnostic-info)
nnoremap <silent> <space>kl     :call CocActionAsync('diagnosticList')<CR>
vmap <silent>     <space>ka     <Plug>(coc-codeaction-selected)
vmap <silent>     <space>kf     <Plug>(coc-format-selected)

nmap <space>fm :CocList mru<CR>
nmap <space>ff :CocList files<CR>
nmap <space>ss :CocList grep<CR>
nmap <space>;  :CocList buffers<CR>
