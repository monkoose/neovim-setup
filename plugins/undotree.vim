Plug 'mbbill/undotree'                        " for visualizing undo history

let g:undotree_SetFocusWhenToggle = 1
let g:undotree_WindowLayout       = 2
let g:undotree_ShortIndicators    = 1
let g:undotree_HelpLine           = 0
nmap <silent>     <M-4>         :UndotreeToggle<CR>
