Plug 'rhysd/vim-grammarous', {'on': 'GrammarousCheck'}

let g:grammarous#languagetool_cmd = 'languagetool'
let g:grammarous#disabled_rules = {
      \ '*': ['DASH_RULE', 'EN_QUOTES', 'WHITESPACE_RULE', 'WORD_CONTAINS_UNDERSCORE', 'UPPERCASE_SENTENCE_START']
      \ }

nmap <space>n [grammarous]
nmap [grammarous]c :GrammarousCheck<CR>
nmap [grammarous]r :GrammarousReset<CR>
nmap [grammarous]f <Plug>(grammarous-fixit)
nmap [grammarous]F <Plug>(grammarous-fixall)
nmap [grammarous]D <Plug>(grammarous-disable-rule)
nmap [grammarous]d <Plug>(grammarous-remove-error)
nmap [grammarous]n <Plug>(grammarous-move-to-next-error)
nmap [grammarous]p <Plug>(grammarous-move-to-previous-error)
