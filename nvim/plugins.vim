" ALE
let g:ale_linters = {
    \ 'javascript': ['jshint'],
    \ 'python': ['flake8'],
    \ 'css': ['csslint'],
    \ 'html': ['HTMLHint'],
    \ }
let g:ale_python_flake8_args = '--ignore=E501'
let g:ale_sign_error = 'E'
let g:ale_sign_warning = 'W'
let g:ale_echo_msg_format = '[%linter%] %s'
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 0
let g:ale_statusline_format = ['E:%d', 'W:%d', '']
let g:ale_set_highlights = 0

" Auto-pairs
" let g:AutoPairsShortcutFastWrap = ''

" Delimitmate
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1

" Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#jedi#statement_length = 60
let g:deoplete#sources#jedi#server_timeout = 25
let g:python3_host_prog = '/usr/bin/python'
let g:deoplete#max_list = 40
let g:deoplete#max_abbr_width = 60
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
let g:deoplete#omni#input_patterns.lua = '\w+|[^. *\t][.:]\w*'
if !exists('g:deoplete#omni#functions')
  let g:deoplete#omni#functions = {}
endif
let g:deoplete#omni#functions.lua = 'xolox#lua#omnifunc'

" Easymotion
nmap <space><space> <Plug>(easymotion-s)

" Echodoc
let g:echodoc#enable_at_startup = 1
let g:echodoc#highlight_identifier = 'Function'

" Open in url in browser
nmap gG <Plug>(openbrowser-smart-search)
vmap gG <Plug>(openbrowser-smart-search)

" Fugitive
nnoremap <space>gg :Gstatus<CR>
nnoremap <space>gb :Gblame<CR>
nnoremap <space>gc :Gcommit<CR>
nnoremap <space>gd :Gdiff<CR>
nnoremap <space>gp :Gpush<CR>

" Fzf
let g:fzf_command_prefix = 'Fzf'

command! -bang -nargs=* FzfRg
  \ call fzf#vim#grep(
  \   'rg --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%:wrap')
  \           : fzf#vim#with_preview('right:50%:hidden:wrap', '?'),
  \   <bang>0)

" Gist-vim
let g:gist_show_privates = 1
let g:gist_post_private = 1

" JavaScript libraries syntax
let g:used_javascript_libs = 'jquery'
let g:javascript_plugin_jsdoc = 1

" Jedi-vim
let g:jedi#auto_initialization = 1
let g:jedi#force_py_version = 3
let g:jedi#auto_vim_configuration = 0
let g:jedi#popup_on_dot = 0
let g:jedi#show_call_signatures = 0
let g:jedi#show_call_signatures_delay = 0
let g:jedi#completions_enabled = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#use_tag_stack = 0
let g:jedi#goto_command = '<space>jg'
let g:jedi#rename_command = '<space>jr'
let g:jedi#goto_assignments_command = '<space>jd'
let g:jedi#usages_command = '<space>ju'
let g:jedi#documentation_command = 'K'
let g:jedi#completions_command = ''

" NeoTerm
let g:neoterm_automap_keys = '<space>t'
let g:neoterm_autoscroll = 1
nnoremap <silent> <f10> :TREPLSendFile<cr>
nnoremap <silent> <f9> :TREPLSendLine<cr>
vnoremap <silent> <f9> :TREPLSendSelection<cr>
" hide/close terminal
nnoremap <silent> <space>tc :Tclose<cr>
" toggle last terminal
nnoremap <silent> <space>tt :Ttoggle<cr>
" clear terminal
nnoremap <silent> <space>tl :Tclear<cr>
" kills the current job (send a <c-c>)
nnoremap <silent> <space>tk :Tkill<cr>

" NERDTree
nmap <silent> <M-1> :NERDTreeToggle<CR>
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeQuitOnOpen = 1
let NERDTreeRespectWildIgnore = 1

" Python syntax
let g:python_highlight_all = 1
let g:python_highlight_space_errors = 0

" Startify
let g:startify_custom_header = ['    -== NEOVIM ==-']
let g:startify_session_dir = '~/.local/share/nvim/session'
let g:startify_files_number = 8
let g:startify_session_persistence = 1
let g:startify_session_delete_buffers = 1
let g:startify_change_to_dir = 0
let g:startify_enable_special = 0

let g:startify_list_order = [
    \ ['    -== SESSIONS ==-'],
    \ 'sessions',
    \ ['    -== MRU ==-          ' . getcwd()],
    \ 'dir',
    \ ['    -== BOOKMARKS ==-'],
    \ 'bookmarks',
    \ ]

" UltiSnips
let g:UltiSnipsExpandTrigger = '<M-e>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsSnippetsDir = $HOME . '/.local/share/nvim/site/mysnippets'
let g:UltiSnipsSnippetDirectories = ['UltiSnips', 'mysnippets']
" let g:ultisnips_python_style = 'google'
let g:ultisnips_python_style = 'sphinx'

" UndoTree
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_WindowLayout = 2
nmap <silent> <M-4> :UndotreeToggle<CR>

" vim-gnupg
let g:GPGPreferArmor = 1
let g:GPGPreferSign = 1

function! SetGPGOptions()
  set updatetime=60000
  set foldmethod=marker
  set foldclose=all
endfunction

augroup GnuPGExtra
  autocmd!
  autocmd BufReadCmd,FileReadCmd *.\(gpg\|asc\|pgp\) call SetGPGOptions()
  autocmd CursorHold *.\(gpg\|asc\|pgp\) quit
augroup END

"vim-lua-ftplugin
let g:lua_check_syntax = 0
let g:lua_complete_omni = 1
let g:lua_complete_dynamic = 0
let g:lua_define_completion_mappings = 0

" vimwiki
let g:vimwiki_list = [{'path': '~/.vimwiki/'}]
nmap <leader>ww :VimwikiIndex<CR>
