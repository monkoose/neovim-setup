Plug 'w0rp/ale'                               " adds asynchronous linting
let g:ale_linters = {
    \ 'javascript': ['eslint'],
    \ 'python': ['flake8'],
    \ 'css': ['stylelint'],
    \ 'html': ['HTMLHint'],
    \ 'haskell': ['hlint', 'hdevtools']
    \ }
    "\ 'haskell': ['hie'],
let g:ale_fixers = {
      \ 'haskell': ['brittany'],
      \ '*' :['remove_trailing_lines', 'trim_whitespace']
      \}
let g:ale_python_flake8_args   = '--ignore=E501'
let g:ale_sign_error           = 'E'
let g:ale_sign_warning         = 'W'
let g:ale_echo_msg_format      = '[%linter%] %s'
let g:ale_lint_on_enter        = 0
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_insert_leave = 0
let g:ale_statusline_format    = ['E:%d', 'W:%d', '']
" let g:ale_set_highlights       = 0
