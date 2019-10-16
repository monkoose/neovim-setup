Plug 'mhinz/vim-startify'                     " adds welcome screen

let g:startify_custom_header          = ['    -== NEOVIM ==-']
let g:startify_session_dir            = '~/.local/share/nvim/sessions'
let g:startify_files_number           = 10
let g:startify_session_persistence    = 1
let g:startify_session_delete_buffers = 1
let g:startify_change_to_dir          = 0
let g:startify_enable_special         = 0
let g:startify_list_order = [
    \ ['    -== SESSIONS ==-'],
    \ 'sessions',
    \ ['    -== MRU ==-          ' . getcwd()],
    \ 'dir',
    \ ['    -== BOOKMARKS ==-'],
    \ 'bookmarks',
    \ ]
