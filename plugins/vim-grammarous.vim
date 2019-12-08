Plug 'rhysd/vim-grammarous'

let g:grammarous#languagetool_cmd = 'languagetool'
let g:grammarous#disabled_rules = {
      \ '*': ['DASH_RULE', 'EN_QUOTES', 'WHITESPACE_RULE', 'WORD_CONTAINS_UNDERSCORE', 'UPPERCASE_SENTENCE_START']
      \ }

nnoremap <space>nf <Plug>(grammarous-fixit)
nnoremap <space>nF <Plug>(grammarous-fixall)
nnoremap <space>nD <Plug>(grammarous-disable-rule)
nnoremap <space>nd <Plug>(grammarous-remove-error)
nnoremap <space>nn <Plug>(grammarous-move-to-next-error)
nnoremap <space>np <Plug>(grammarous-move-to-previous-error)
