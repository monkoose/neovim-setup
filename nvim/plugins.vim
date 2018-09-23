" ALE
let g:ale_linters = {
    \ 'javascript': ['jshint'],
    \ 'python': ['flake8'],
    \ 'css': ['csslint'],
    \ 'html': ['HTMLHint'],
    \ 'd': ['dmd'],
    \ 'haskell': ['hie', 'hlint']
    \ }

let g:ale_fixers = {
\   'haskell': ['hlint'],
\}
let g:ale_python_flake8_args = '--ignore=E501'
let g:ale_sign_error = 'E'
let g:ale_sign_warning = 'W'
let g:ale_echo_msg_format = '[%linter%] %s'
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 0
let g:ale_statusline_format = ['E:%d', 'W:%d', '']
let g:ale_set_highlights = 0

" Delimitmate
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1

" Denite
" call denite#custom#var('grep', 'command', ['ag'])
" call denite#custom#var('grep', 'default_opts',
"                 \ ['-i', '--vimgrep'])
" call denite#custom#var('grep', 'recursive_opts', [])
" call denite#custom#var('grep', 'pattern_opt', [])
" call denite#custom#var('grep', 'separator', ['--'])
" call denite#custom#var('grep', 'final_opts', [])

" Deoplete
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option({
      \ 'max_list': 100,
      \ })
" call deoplete#custom#source('jedi', 'server_timeout', 25)
" let g:deoplete#sources#d#load_dub = 1
" let g:deoplete#sources#d#std_path = '/home/monkoose/.dub/packages/'

" Easymotion
nmap <silent> <space><space> <Plug>(easymotion-overwin-f)

" Esearch
let g:esearch#cmdline#help_prompt = 0
call esearch#out#win#map('<C-n>', 'next-file')
call esearch#out#win#map('<C-p>', 'prev-file')
call esearch#out#win#map('S', 'split-silent')
call esearch#out#win#map('I', 'vsplit-silent')
call esearch#out#win#map('<C-t>', 'tab')
call esearch#out#win#map('<C-x>', 'split')
call esearch#out#win#map('<C-v>', 'vsplit')
nmap <space>se <Plug>(esearch)
nmap <space>sw <Plug>(esearch-word-under-cursor)

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
nnoremap <space>ge :Gedit<CR>

" Fzf
let g:fzf_command_prefix = 'Fzf'

command! -bang -nargs=* FzfMyAg call fzf#vim#ag(<q-args>, fzf#vim#with_preview('up:60%:wrap'), <bang>0)
command! -bang -nargs=* FzfGFiles call fzf#vim#gitfiles(<q-args>, {'options': '--preview-window up:60%'}, <bang>0)
command! -bang FzfCommits call fzf#vim#commits({'options': '--preview-window up:60%'}, <bang>0)
command! -bang FzfBCommits call fzf#vim#buffer_commits({'options': '--preview-window up:60%'}, <bang>0)

" Open QuickFix with marked items from fzf
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

let g:fzf_colors =
  \ { 'info':    ['fg', 'PreProc'],
    \ 'prompt':  ['fg', 'Special'] }

" Gista
nnoremap <space>gl :Gista list<CR>
nnoremap <space>gp :Gista post -P -d=""<Left>
nnoremap <space>gP :Gista patch<CR>

" JavaScript libraries syntax
" let g:used_javascript_libs = 'jquery'
" let g:javascript_plugin_jsdoc = 1
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
let g:jedi#completions_command = ''

" Language Client
let g:LanguageClient_serverCommands = {
    \ 'haskell': ['hie-wrapper'],
    \ 'javascript': ['javascript-typescript-stdio'],
    \ }
let g:LanguageClient_diagnosticsEnable = 0
let g:LanguageClient_hasSnippetSupport = 0
let g:LanguageClient_hoverPreview = "Always"
let g:LanguageClient_selectionUI = "fzf"

" NeoTerm
let g:neoterm_automap_keys = '<space>t'
let g:neoterm_autoscroll = 1
let g:neoterm_default_mod = "belowright"
let g:neoterm_autoinsert = 1
let g:neoterm_size=22
nnoremap <silent> <f10> :Topen \| TREPLSendFile<cr>
nnoremap <silent> <f9> :Topen \| TREPLSendLine<cr>
vnoremap <silent> <f9> :Topen \| TREPLSendSelection<cr>
" hide/close terminal
nnoremap <M-`> :Ttoggle<cr>
tnoremap <M-`> <C-\><C-n>:Ttoggle<cr>
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

augroup GnuPGExtra
  autocmd!
  autocmd BufReadCmd,FileReadCmd *.\(gpg\|asc\|pgp\) set fdm=marker fcl=all
augroup END

" vim-lua-ftplugin
let g:lua_check_syntax = 0
let g:lua_complete_omni = 1
let g:lua_complete_dynamic = 0
let g:lua_define_completion_mappings = 0

" vimwiki
let g:vimwiki_list = [{'path': '~/.vimwiki/'}]
nmap <leader>ww <Plug>VimwikiIndex
