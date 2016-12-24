" CtrlP
let g:ctrlp_by_filename         = 1
let g:ctrlp_match_window        = 'bottom,order:btt,min:10,max:10,results:30'
let g:ctrlp_working_path_mode   = 'a'
set grepprg=ag\ --nogroup\ --nocolor
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_use_caching = 0

" DelimitMate
let delimitMate_expand_cr                = 2
let delimitMate_expand_space             = 1

" Deoplete
let g:deoplete#enable_at_startup             = 1
let g:deoplete#sources#jedi#statement_length = 40
let g:python3_host_prog                      = '/usr/bin/python'
let g:deoplete#max_list                      = 40
let g:deoplete#max_abbr_width                = 40

" Gist-vim
let g:gist_show_privates = 1
let g:gist_post_private = 1

" JavaScript libraries syntax
let g:used_javascript_libs = 'jquery'
let g:javascript_plugin_jsdoc = 1

" Jedi-vim
let g:jedi#auto_initialization         = 1
let g:jedi#force_py_version            = 3
let g:jedi#auto_vim_configuration      = 0
let g:jedi#popup_on_dot                = 0
let g:jedi#show_call_signatures        = 2
let g:jedi#show_call_signatures_delay  = 0
let g:jedi#completions_enabled         = 1
let g:jedi#smart_auto_mappings         = 0
let g:jedi#goto_command                = "<space>g"
let g:jedi#rename_command              = "<space>r"
let g:jedi#goto_assignments_command    = "<space>d"
let g:jedi#usages_command              = "<space>u"
let g:jedi#documentation_command       = "K"
let g:jedi#completions_command         = ""

" NERDTree
let NERDTreeIgnore                   = ['\.git$', '^__pycache__$', '\.pyc$', '\~$']
nmap <silent> <M-1> :NERDTreeToggle<CR>

" Python syntax
let python_highlight_all = 1
let g:python_highlight_docparameters = 1

" Startify
let g:startify_custom_header = ['    -== NEOVIM ==-']
let g:startify_session_dir               = '~/.local/share/nvim/session'
let g:startify_files_number              = 8
let g:startify_session_persistence       = 1
let g:startify_session_delete_buffers    = 1
let g:startify_change_to_dir             = 0
let g:startify_enable_special            = 0

let g:startify_list_order = [
        \ ['    -== SESSIONS ==-'],
        \ 'sessions',
        \ ['    -== MRU ==-          ' . getcwd()],
        \ 'dir',
        \ ['    -== BOOKMARKS ==-'],
        \ 'bookmarks',
        \ ]

" Syntastic
let g:syntastic_always_populate_loc_list    = 1
let g:syntastic_auto_loc_list               = 2
let g:syntastic_mode_map                    = {"mode": "passive"}
let g:syntastic_check_on_wq                 = 0
let g:syntastic_auto_jump                   = 0
let g:syntastic_error_symbol                = "E"
let g:syntastic_warning_symbol              = "W"
let g:syntastic_style_error_symbol          = "S"
let g:syntastic_style_warning_symbol        = "S"
let g:syntastic_python_checkers             = ['flake8']
let g:syntastic_python_flake8_args          = '--ignore=E501'
let g:syntastic_javascript_checkers         = ['jshint']
let g:syntastic_html_checkers               = ['jshint']
let g:syntastic_xhtml_checkers              = ['jshint']
let g:syntastic_css_checkers                = ['csslint']
" Save buffer and check for errors and update lightline
function! LightLineSyntasticCheck()
    write
    SyntasticCheck
    call lightline#update()
endfunction
nmap <silent><F4> :call LightLineSyntasticCheck()<CR>

" Tagbar
let g:tagbar_autofocus               = 1
let g:tagbar_sort                    = 0
nmap <silent> <M-8> :TagbarToggle<CR>
nmap <silent> <leader>tt :TagbarCurrentTag('fs')<CR>

" UltiSnips
let g:UltiSnipsExpandTrigger         ="<tab>"
let g:UltiSnipsJumpForwardTrigger    ="<tab>"
let g:UltiSnipsJumpBackwardTrigger   ="<s-tab>"
let g:UltiSnipsSnippetsDir           = $HOME . "/.local/share/nvim/site/mysnippets"
let g:UltiSnipsSnippetDirectories    = ["UltiSnips", "mysnippets"]
let g:ultisnips_python_style         = 'google'
" let g:ultisnips_python_style         = 'sphinx'

" UndoTree
let g:undotree_SetFocusWhenToggle            = 1
let g:undotree_WindowLayout                  = 2
nmap <silent> <M-4> :UndotreeToggle<CR>
