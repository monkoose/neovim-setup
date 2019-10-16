Plug 'SirVer/ultisnips'                       " adds snippets support
Plug 'honza/vim-snippets'                     " adds snippets support

let g:UltiSnipsJumpForwardTrigger  = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsSnippetsDir         = $HOME . '/.local/share/nvim/site/mysnippets'
let g:UltiSnipsSnippetDirectories  = ['UltiSnips', 'mysnippets']
let g:ultisnips_python_style       = 'sphinx'
