Plug 'rhysd/vim-grammarous'

let g:grammarous#languagetool_cmd = 'languagetool'
let g:grammarous#disabled_rules = {
      \ '*': ['DASH_RULE', 'EN_QUOTES', 'WHITESPACE_RULE', 'WORD_CONTAINS_UNDERSCORE', 'UPPERCASE_SENTENCE_START']
      \ }

nmap <space>nf <Plug>(grammarous-fixit)
nmap <space>nF <Plug>(grammarous-fixall)
nmap <space>nD <Plug>(grammarous-disable-rule)
nmap <space>nd <Plug>(grammarous-remove-error)
nmap <space>nn <Plug>(grammarous-move-to-next-error)
nmap <space>np <Plug>(grammarous-move-to-previous-error)
