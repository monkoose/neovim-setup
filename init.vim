"=================================  VIMPLUG  ===================================
call plug#begin('~/.local/share/nvim/plugged')
Plug 'kassio/neoterm'                         " for better terminal experience
Plug 'monkoose/gruvbox'                       " adds colorscheme
Plug 'monkoose/lightline-my-gruvbox'          " adds lightline colorscheme
Plug 'tpope/vim-repeat'                       " makes '.' command more usable
Plug 'tpope/vim-eunuch'                       " adds sugar common UNIX shell commands
Plug 'tpope/vim-fugitive'                     " adds git support inside vim
Plug 'tpope/vim-surround'                     " makes manipulating with (),[],''... enjoyable
Plug 'tpope/vim-unimpaired'                   " adds common toggling options, new ] and [ commands, encoding/decoding
Plug 'tpope/vim-commentary'                   " for faster line commenting/uncommenting
Plug 'Konfekt/FastFold'                       " makes non manual folds faster
Plug 'junegunn/fzf.vim'                       " for fast searching of different sources
Plug 'eugen0329/vim-esearch'                  " for grepping results in treelike style
Plug 'junegunn/vim-easy-align'                " adds aligning of text
Plug 'jamessan/vim-gnupg'                     " for editing gpg files
Plug 'zhimsel/vim-stay'                       " for remembering session/cursor position
Plug 'mhinz/vim-startify'                     " adds welcome screen

Plug 'SirVer/ultisnips'                       " adds snippets support
Plug 'honza/vim-snippets'                     " adds snippets support

Plug 'wellle/targets.vim'                     " adds new targets like in( or 2alB
Plug 'airblade/vim-gitgutter'                 " makes vcs changes visible
Plug 'Raimondi/delimitMate'                   " adds auto pairs
Plug 'tyru/open-browser.vim'                  " for better links opening with a browser
Plug 'itchyny/lightline.vim'                  " adds configurable yet fast statusline
Plug 'skywind3000/asyncrun.vim'               " adds support to asynchronously run shell commands
Plug 'Shougo/context_filetype.vim'            " adds better support for different languages in one file
Plug 'easymotion/vim-easymotion'              " for easier jumps to any position on the screen
Plug 'Shougo/neco-vim'                        " adds completion for vim filetypes
Plug 'vimwiki/vimwiki'                        " adds wiki and ToDo in vim
Plug 'mbbill/undotree'                        " for visualizing undo history
Plug 'lambdalisue/vim-gista'                  " adds gist support
Plug 'Shougo/echodoc.vim'                     " adds parameters help for functions
Plug 'w0rp/ale'                               " adds asynchronous linting

Plug 'idanarye/vim-dutyl'                     " adds ide features for dlang
Plug 'monkoose/deoplete-d'                    " adds completion source for dlang

Plug 'neovimhaskell/haskell-vim'              " improves haskell syntax and indentation
Plug 'Twinside/vim-hoogle'                    " for hoogle searching inside vim

Plug 'tbastos/vim-lua'                        " improves lua syntax highlighting and indentation
Plug 'monkoose/luarefvim'                     " adds lua reference docs
Plug 'xolox/vim-misc'                         " required by vim-lua-ftplugin
Plug 'xolox/vim-lua-ftplugin'                 " adds completions for lua

Plug 'tweekmonster/django-plus.vim'           " makes working with django easier
Plug 'Glench/Vim-Jinja2-Syntax'               " adds jinja templates syntax highlighting
Plug 'zchee/deoplete-jedi'                    " adds completion source for python
Plug 'davidhalter/jedi-vim'                   " adds ide features for python
Plug 'vim-python/python-syntax'               " improves python syntax highlighting
Plug 'Vimjas/vim-python-pep8-indent'          " improves python indentation

Plug 'hail2u/vim-css3-syntax'                 " improves CSS syntax highlighting
Plug 'othree/html5.vim'                       " improves HTML syntax highlighting
Plug 'pangloss/vim-javascript'                " improves JavaScript syntax highlighting and indentation
Plug 'godlygeek/tabular', {'for': 'markdown'} " required by vim-markdown
Plug 'plasticboy/vim-markdown'                " improves markdown syntax highlighting
Plug 'othree/javascript-libraries-syntax.vim' " adds syntax highlighting of the popular js libraries

Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}            " adds sidebar file explorer
Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}     " adds autocompletion engine
Plug 'autozimu/LanguageClient-neovim', {
      \ 'branch': 'next',
      \ 'do': './install.sh'}                                   " adds lsp support
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'} " required by fzf.vim
call plug#end()


"=================================  OPTIONS  ===================================
let g:python3_host_prog = '/usr/bin/python'
set termguicolors
colorscheme gruvbox
set background=dark
set title
set synmaxcol=1000
set hidden
set spelllang=en_us,ru_yo
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
set pumheight=10
set fileencodings=utf-8,cp1251,koi8-r
set nofixendofline
set nowrap
set ignorecase
set smartcase
set noshowmode
set history=2000
set undolevels=300
set noswapfile
set undofile
set showcmd
set undodir=~/.local/share/nvim/undo-files/
set viewoptions=cursor,folds
set linebreak
set showbreak=└
set list
set listchars=tab:→-,trail:·,extends:⌇,precedes:⌇,nbsp:~
set fillchars=vert:▌,fold:·,
set tabpagemax=20
set smartindent
set shiftround
set expandtab
set tabstop=4
set shiftwidth=2
set softtabstop=-1
set nojoinspaces
set sessionoptions-=blank
set shada=!,'100,<50,:50,s10,h
set textwidth=79
set completeopt=menuone,longest
set wildignore+=*/.git/*,*/__pycache__/*,*.pyc
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg
set shortmess+=c
set diffopt=filler,vertical
set guicursor=
set inccommand=split
set updatetime=1500
" custom looking folds function
function! NeatFoldText() abort
  let line = ' ' . substitute(getline(v:foldstart),
        \ '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
  let lines_count = v:foldend - v:foldstart + 1
  let lines_count_text = printf('  ' . "%10s", lines_count . ' lines  ')
  let foldchar = matchstr(&fillchars, 'fold:\zs.')
  " let emptychar = ' '
  let foldtextstart = strpart(repeat('+', v:foldlevel) . line, 0, (winwidth(0)*2)/3)
  let foldtextend = lines_count_text . repeat(foldchar, 6)
  let foldtextlength = strlen( substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
  return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
endfunction
set foldtext=NeatFoldText()


"=============================  PLUGINS OPTIONS  ===============================
"""""""""""""""""""""""""" ale
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
let g:ale_python_flake8_args   = '--ignore=E501'
let g:ale_sign_error           = 'E'
let g:ale_sign_warning         = 'W'
let g:ale_echo_msg_format      = '[%linter%] %s'
let g:ale_lint_on_enter        = 0
let g:ale_lint_on_text_changed = 0
let g:ale_statusline_format    = ['E:%d', 'W:%d', '']
let g:ale_set_highlights       = 0

"""""""""""""""""""""""""" delimitmate
let g:delimitMate_expand_cr    = 1
let g:delimitMate_expand_space = 1

"""""""""""""""""""""""""" deoplete
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option({
      \ 'max_list': 100,
      \ })
call deoplete#custom#source('omni', 'functions', {
    \ 'lua':  'xolox#lua#omnifunc',
    \})
call deoplete#custom#buffer_var('omni', 'input_patterns', {
    \ 'lua': ['\w+|[^. *\t][.:]\w*', 'require\s*\(?["'']\w*'],
    \})

"""""""""""""""""""""""""" easy-align
" activate easy-align plugin for visually selected text
vmap              <Enter>       <Plug>(EasyAlign)

"""""""""""""""""""""""""" easymotion
" jump to chosen chr on the screen
nmap <silent>   <space><space>  <Plug>(easymotion-overwin-f)

"""""""""""""""""""""""""" esearch
let g:esearch#cmdline#help_prompt = 0
call esearch#out#win#map('<C-n>', 'next-file')
call esearch#out#win#map('<C-p>', 'prev-file')
call esearch#out#win#map('S', 'split-silent')
call esearch#out#win#map('I', 'vsplit-silent')
call esearch#out#win#map('<C-t>', 'tab')
call esearch#out#win#map('<C-x>', 'split')
call esearch#out#win#map('<C-v>', 'vsplit')
nmap             <space>se      <Plug>(esearch)
nmap             <space>sw      <Plug>(esearch-word-under-cursor)

"""""""""""""""""""""""""" echodoc
let g:echodoc#enable_at_startup    = 1
let g:echodoc#highlight_identifier = 'Function'

"""""""""""""""""""""""""" openbrowser
nmap              gG            <Plug>(openbrowser-smart-search)
vmap              gG            <Plug>(openbrowser-smart-search)

"""""""""""""""""""""""""" fugitive
nnoremap          <space>gg     :Gstatus<CR>
nnoremap          <space>gb     :Gblame<CR>
nnoremap          <space>gc     :Gcommit<CR>
nnoremap          <space>gd     :Gdiff<CR>
nnoremap          <space>ge     :Gedit<CR>

"""""""""""""""""""""""""" fzf.vim
let g:fzf_command_prefix = 'Fzf'
command! -bang -nargs=* FzfMyAg call fzf#vim#ag(<q-args>, fzf#vim#with_preview('up:60%:wrap'), <bang>0)
command! -bang -nargs=* FzfGFiles call fzf#vim#gitfiles(<q-args>, {'options': '--preview-window up:60%'}, <bang>0)
command! -bang FzfCommits call fzf#vim#commits({'options': '--preview-window up:60%'}, <bang>0)
command! -bang FzfBCommits call fzf#vim#buffer_commits({'options': '--preview-window up:60%'}, <bang>0)
let g:fzf_colors =
  \ { 'info':    ['fg', 'PreProc'],
    \ 'prompt':  ['fg', 'Special'] }
" Open QuickFix with marked items from fzf
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction
" fzf plugin bindings
nmap              <C-space>     :FzfBuffers<CR>
nmap              <space>ff     :FzfFiles<CR>
nmap              <space>fg     :FzfGFiles!?<CR>
nmap              <space>ft     :FzfBTags<CR>
nmap              <space>fa     :FzfTags<CR>
nmap              <space>fc     :FzfCommits!<CR>
nmap              <space>fb     :FzfBCommits!<CR>
nmap              <space>fm     :FzfMarks<CR>
nmap              <space>fk     :FzfMaps<CR>
nmap              <space>ss     :FzfMyAg!<CR>
nmap              <space>sb     :FzfBLines<CR>
nmap              <space>sl     :FzfLines<CR>
let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

"""""""""""""""""""""""""" gista
nnoremap          <space>gl     :Gista list<CR>
nnoremap          <space>gp     :Gista post -P -d=""<Left>
nnoremap          <space>gP     :Gista patch<CR>

"""""""""""""""""""""""""" jedi-vim
let g:jedi#auto_initialization        = 1
let g:jedi#force_py_version           = 3
let g:jedi#auto_vim_configuration     = 0
let g:jedi#popup_on_dot               = 0
let g:jedi#show_call_signatures       = 0
let g:jedi#show_call_signatures_delay = 0
let g:jedi#completions_enabled        = 0
let g:jedi#smart_auto_mappings        = 0
let g:jedi#use_tag_stack              = 0
let g:jedi#completions_command        = ''
let g:jedi#goto_command               = '<space>d'
let g:jedi#rename_command             = '<space>r'
let g:jedi#goto_assignments_command   = '<space>jd'
let g:jedi#usages_command             = '<space>ju'
let g:jedi#documentation_command      = 'K'

"""""""""""""""""""""""""" languageclient-neovim
let g:LanguageClient_serverCommands = {
    \ 'haskell': ['hie-wrapper'],
    \ 'javascript': ['javascript-typescript-stdio'],
    \ }
let g:LanguageClient_diagnosticsEnable = 0
let g:LanguageClient_hasSnippetSupport = 0
let g:LanguageClient_hoverPreview      = "Always"
let g:LanguageClient_selectionUI       = "fzf"

"""""""""""""""""""""""""" neoterm
let g:neoterm_size         = 22
let g:neoterm_autoscroll   = 1
let g:neoterm_autoinsert   = 1
let g:neoterm_default_mod  = "belowright"
let g:neoterm_automap_keys = '<space>t'
nnoremap <silent>     <f10>       :Topen \| TREPLSendFile<cr>
nnoremap <silent>     <f9>        :Topen \| TREPLSendLine<cr>
vnoremap <silent>     <f9>        :Topen \| TREPLSendSelection<cr>
" toggle neoterm
nnoremap              <M-`>       :Ttoggle<cr>
tnoremap              <M-`>       <C-\><C-n>:Ttoggle<cr>
" close last neoterm
nnoremap <silent>     <space>tc   :Tclose<cr>
" toggle last neoterm
nnoremap <silent>     <space>tt   :Ttoggle<cr>
" clear neoterm
nnoremap <silent>     <space>tl   :Tclear<cr>
" kills the current job (send a <c-c>)
nnoremap <silent>     <space>tk   :Tkill<cr>

"""""""""""""""""""""""""" nerdtree
let NERDTreeAutoDeleteBuffer  = 1
let NERDTreeMinimalUI         = 1
let NERDTreeQuitOnOpen        = 1
let NERDTreeRespectWildIgnore = 1
nmap <silent>         <M-1>       :NERDTreeToggle<CR>

"""""""""""""""""""""""""" python-syntax
let g:python_highlight_all          = 1
let g:python_highlight_space_errors = 0

"""""""""""""""""""""""""" startify
let g:startify_custom_header          = ['    -== NEOVIM ==-']
let g:startify_session_dir            = '~/.local/share/nvim/session'
let g:startify_files_number           = 8
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

"""""""""""""""""""""""""" ultisnips
let g:UltiSnipsExpandTrigger       = '<M-e>'
let g:UltiSnipsJumpForwardTrigger  = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsSnippetsDir         = $HOME . '/.local/share/nvim/site/mysnippets'
let g:UltiSnipsSnippetDirectories  = ['UltiSnips', 'mysnippets']
let g:ultisnips_python_style       = 'sphinx'
" let g:ultisnips_python_style       = 'google'

"""""""""""""""""""""""""" undotree
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_WindowLayout       = 2
nmap <silent>     <M-4>         :UndotreeToggle<CR>

"""""""""""""""""""""""""" vim-gnupg
let g:GPGPreferArmor = 1
let g:GPGPreferSign  = 1
augroup GnuPGExtra
  autocmd!
  autocmd BufReadCmd,FileReadCmd *.\(gpg\|asc\|pgp\) set fdm=marker fcl=all
augroup END

"""""""""""""""""""""""""" vim-gnupg
let g:plug_window  = "botright new"
let g:plug_pwindow = "vertical new"
"""""""""""""""""""""""""" lua-ftplugin
let g:lua_check_syntax               = 0
let g:lua_complete_omni              = 1
let g:lua_complete_dynamic           = 0
let g:lua_define_completion_mappings = 0

"""""""""""""""""""""""""" vimwiki
let g:vimwiki_list = [{'path': '~/.vimwiki/'}]


"===================================  MAPS  ====================================
" swap *leader* to ',' backward search to '\'
let mapleader =  ','
nnoremap          \             ,
" change keymap in insert and cmdline modes
noremap!          <C-space>     <C-^>
" jump to previous buffer
nnoremap          <space>a      <C-^>
" jump to definition
nnoremap          <space>d      <C-]>
" scroll halfpage in visual and normal modes
nnoremap          <C-j>         <C-d>
nnoremap          <C-k>         <C-u>
vnoremap          <C-j>         <C-d>
vnoremap          <C-k>         <C-u>
nnoremap          <C-l>         <space>
" enter digraph
inoremap          <C-p>         <C-k>
" Autocompletion scroll
inoremap          <C-j>         <C-n>
inoremap          <C-k>         <C-p>
" Scroll history in command-line mode
cnoremap          <C-n>         <Down>
cnoremap          <C-p>         <Up>
" for current search disable highlighting
nmap <silent>     <space>/      :nohlsearch<CR>
" paste and Spell toggle
set   pastetoggle=<F2>
nmap <silent>     <F3>          :setlocal spell!<CR>
" makes entire *word* uppercase
nnoremap          <space>U      mQviwU`Q
" makes entire *word* lowercase
nnoremap          <space>u      mQviwu`Q
" yank to clipboard
nnoremap          <space>y      "+y
vnoremap          <space>y      "+y
" paste from clipboard
nnoremap          <space>pp     "+p
vnoremap          <space>pp     "+p
" move cursor left/right in command and insert modes
inoremap <expr>   <M-h>         pumvisible() ? deoplete#mappings#smart_close_popup() : "\<Left>"
inoremap          <M-l>         <Right>
cnoremap          <M-h>         <Left>
cnoremap          <M-l>         <Right>
" exit to normal mode in Terminal
tnoremap          <C-]>         <C-\><C-n>
tnoremap          <F1>          <C-\><C-n>
" close current window
nnoremap          <M-q>         <C-w>c
" close other windows
nnoremap          <M-o>         <C-w>o

" toggle foldcolumn
nnoremap          yof           :set <C-R>=&foldcolumn ? 'foldcolumn=0' : 'foldcolumn=1'<CR><CR>
" toggle highlight of 80 cursor column
nnoremap <silent> yoy           :let &cc = &cc == '' ? '80' : ''<CR>
" switch windows with Alt+w if it is terminal buffer then enter insert mode too
function! s:windowswitch() abort
    wincmd w
    if &ft == 'neoterm' || &ft == 'terminal'
      startinsert
    endif
endfunction
nnoremap <silent> <Plug>WindowSwitch :call <SID>windowswitch()<CR>
nmap              <M-w>         <Plug>WindowSwitch
tnoremap          <M-w>         <C-\><C-n><C-w>w
" scroll *preview* window or jump to vcs changes in file
function! ScrollPreviewDownOrJumpToNextHunk()
  if s:previewWindowOpened()
    exec "normal! \<C-w>P3\<C-e>\<C-w>p"
  else
    exec "normal ]c"
  endif
endfunction
function! ScrollPreviewUpOrJumpToPreviousHunk()
  if s:previewWindowOpened()
    exec "normal! \<C-w>P3\<C-y>\<C-w>p"
  else
    exec "normal [c"
  endif
endfunction
nnoremap <silent> <C-n>         :call ScrollPreviewDownOrJumpToNextHunk()<CR>
nnoremap <silent> <C-p>         :call ScrollPreviewUpOrJumpToPreviousHunk()<CR>
" insert ; at the end of a line if there is none
function! s:insert_dot_comma() abort
  let column = col('.')
  exec "normal $"
  if matchstr(getline('.'), '\%' . col('.') . 'c.') != ';'
    exec "normal a;"
  else
    exec "normal x"
  endif
  call cursor(line('.'), column)
endfunction
nnoremap <silent> <Plug>InsertDotComma :call <SID>insert_dot_comma()<CR>
nmap              <M-f>         <Plug>InsertDotComma
" show Syntax name for element under the cursor
function! s:synnames(...) abort
  if a:0
    let [line, column] = [a:1, a:2]
  else
    let [line, column] = [line('.'), col('.')]
  endif
  return reverse(map(synstack(line, column), 'synIDattr(v:val,"name")'))
endfunction
function! s:syncount(count)
  if a:count
    let name = get(s:synnames(), a:count-1, '')
    if name !=# ''
      return 'syntax list '.name
    endif
  else
    echo join(s:synnames(), ' ')
  endif
  return ''
endfunction
nnoremap <silent> <Plug>ScripteaseSynnames :call <SID>syncount(v:count)<CR>
nmap              <F8>          <Plug>ScripteaseSynnames
" toggle Location and QuickFix lists
function! s:GetBufferList()
  redir =>buflist
  silent! ls
  redir END
  return buflist
endfunction
function! s:toggle_location_list()
  let winnr = winnr()
  let prevwinnr = winnr("#")
  let curbufnr = winbufnr(0)
  for bufnum in map(filter(split(s:GetBufferList(), '\n'), 'v:val =~ "Location List"'),
        \ 'str2nr(matchstr(v:val, "\\d\\+"))')
    if curbufnr == bufnum
      exec prevwinnr . "wincmd w"
      lclose
      return
    endif
  endfor
  try
    botright lopen
    if &ft == 'qf'
      silent file LocationList
    endif
  catch /E776/
      echohl WarningMsg
      echo "Location List is empty"
      echohl None
      return
  endtry
endfunction
function! s:toggle_quickfix_list()
  let winnr = winnr()
  let prevwinnr = winnr("#")
  for bufnum in map(filter(split(s:GetBufferList(), '\n'), 'v:val =~ "Quickfix List"'),
        \ 'str2nr(matchstr(v:val, "\\d\\+"))')
    if bufwinnr(bufnum) != -1
      exec prevwinnr . "wincmd w"
      cclose
      return
    endif
  endfor
    botright copen
endfunction
nnoremap <script> <silent> <Plug>ToggleQuickfixList :call <SID>toggle_quickfix_list()<CR>
nnoremap <script> <silent> <Plug>ToggleLocationList :call <SID>toggle_location_list()<CR>
nmap              <M-2>         <Plug>ToggleQuickfixList
nmap              <M-3>         <Plug>ToggleLocationList
" close preview window
function! s:previewWindowOpened()
  for nr in range(1, winnr('$'))
    if getwinvar(nr, "&pvw") == 1
      return 1
    endif
  endfor
  return 0
endfunction
function! s:closePreviewWindow()
  if s:previewWindowOpened()
    pclose
  else
    echo "There is no Preview window"
  endif
endfunction
nnoremap <script> <silent> <Plug>ClosePreviewWindow :call <SID>closePreviewWindow()<CR>
nmap              q             <Plug>ClosePreviewWindow
nnoremap          Q             q


"================================  LIGHTLINE  ==================================
let g:lightline = {
    \ 'colorscheme': 'my_gruvbox',
    \ 'active': {
        \ 'left':  [
            \ [ 'mode', 'kmap', 'paste', 'spell' ],
            \ [ 'filename', 'git' ]
        \ ],
        \ 'right': [
            \ [ 'ale', 'lineinfo', 'percent' ],
            \ [ 'virtualenv', 'fileformat', 'fileencoding', 'filetype' ]
        \ ]
    \ },
    \ 'inactive': {
        \ 'left':  [ [ 'mode', 'filename' ] ],
        \ 'right': [ [ 'lineinfo', 'percent' ] ]
    \ },
    \ 'component_function': {
        \ 'paste':         'LightLinePaste',
        \ 'lineinfo':      'LightLineLineinfo',
        \ 'spell':         'LightLineSpell',
        \ 'git':           'LightLineGit',
        \ 'filename':      'LightLineFilename',
        \ 'fileformat':    'LightLineFileformat',
        \ 'filetype':      'LightLineFiletype',
        \ 'fileencoding':  'LightLineFileencoding',
        \ 'mode':          'LightLineMode',
        \ 'percent':       'LightLinePercent',
        \ 'virtualenv':    'LightLineVenv',
        \ 'kmap':          'LightLineKeymap',
    \ },
    \ 'component_expand': {
        \ 'ale': 'ALEStatusLine',
    \ },
    \ 'component_type': {
        \ 'ale': 'error',
    \ },
    \ 'separator':    { 'left': '', 'right': '' },
    \ 'subseparator': { 'left': '', 'right': '' }
\ }

function! FilenameOrFiletypeMatch () abort
  let l:fname = expand('%:t')
  return l:fname =~ 'NERD_tree' ? 1 :
       \ l:fname =~ 'undotree_2\|diffpanel_3' ? 1 :
       \ &ft     == 'qf' ? 1 :
       \ &ft     == 'startify' ? 1 :
       \ &ft     == 'fugitiveblame' ? 1 :
       \ &ft     == 'gitcommit' ? 1 :
       \ &ft     == 'terndoc' ? 1 :
       \ &ft     == 'duddoc' ? 1 :
       \ l:fname == '__doc__' && &ft == 'rst' ? 1 :
       \ expand('%:p') =~ 'term:\/\/' ? 1 :
       \ 0
endfunction

function! LightLinePaste() abort
  return &paste ? 'P' : ''
endfunction

function! LightLineSpell() abort
  return &spell ? 'S' : ''
endfunction

function! LightLineKeymap() abort
  return &iminsert == 1 ? '[ru]' : ''
endfunction

function! LightLineVenv() abort
  return &ft =~# 'python' &&
      \ winwidth(0) > 70 &&
      \ $VIRTUAL_ENV != '' ? printf('(%s)', fnamemodify($VIRTUAL_ENV, ':t')) : ''
endfunction

function! LightLineLineinfo() abort
  return FilenameOrFiletypeMatch() ? '' :
       \ printf(' %2d', line('.'))
endfunction

function! PercentHelper() abort
  return line('w0') == 1 ? ' Top' :
       \ line('w$') == line('$') ? ' Bot' :
       \ printf(' %2.0f', (100.0 * line('.') / line('$'))) . '%'
endfunction

function! LightLinePercent() abort
  let l:fname = expand('%:t')
  return l:fname =~ 'NERD_tree_' ? '' :
       \ l:fname == 'undotree_2' ? '' :
       \ l:fname == 'diffpanel_3' ? '' :
       \ &ft     == 'Startify' ? '' :
       \ &ft     == 'qf' ? line('$') :
       \ PercentHelper()
endfunction

function! IsModified() abort
  return &ft =~ 'help' ? '' : &modified ? '[+]' : &modifiable ? '' : '[-]'
endfunction

function! IsReadOnly() abort
  return &ft !~? 'help' && &readonly ? '[RO]' : ''
endfunction

function! LightLineFilename() abort
  let l:relpath = strlen(expand('%:.')) > 50 ? '../' . expand('%:t') : expand('%:.')
  return FilenameOrFiletypeMatch() ? '' :
       \ expand('%:p') =~ 'fugitive:///' ? expand('%:t') :
       \ ('' != expand('%:t') ? relpath : '[No Name]') .
          \ ('' != IsReadOnly() ? ' ' . IsReadOnly() : '') .
          \ ('' != IsModified() ? ' ' . IsModified() : '')
endfunction

function! LightLineMode() abort
  let l:fname = expand('%:t')
  return l:fname =~ 'NERD_tree' ? 'NERDTREE ' :
       \ l:fname =~ 'undotree_2' ? 'UNDOTREE ' :
       \ l:fname =~ 'diffpanel_3' ? 'DIFF ' :
       \ l:fname == 'LocationList' ? 'LOCATION LIST ' :
       \ &ft     == 'qf' ? 'QUICK FIX ' :
       \ &ft     == 'startify' ? 'STARTIFY ' :
       \ &ft     == 'fugitiveblame' ? 'GIT BLAME ' :
       \ &ft     == 'gitcommit' ? l:fname == 'index' ? 'GIT STATUS ' : 'GIT COMMIT ' :
       \ &ft     == 'terndoc' ? 'TERNDOC' :
       \ &ft     == 'duddoc' ? 'DDOC' :
       \ l:fname == '__doc__' && &ft == 'rst' ? 'DOCSTRING ' :
       \ expand('%:p') =~ 'fugitive:///' ? 'GIT' :
       \ expand('%:p') =~ 'term:\/\/' ? &ft == 'fzf' ? 'FZF' : &ft == 'neoterm' ? 'NEOTERM ' : 'TERMINAL ' :
       \ ''
endfunction

" Shows branch name and number of hunks
function! LightLineGit() abort
  try
    if expand('%:t') !~? 'NERD_tree_\|undotree_2\|diffpanel_3' &&
          \ expand('%:p') !~? 'term:\/\/' && &ft != 'startify' &&
          \ &ft != 'qf' && exists('*fugitive#head')
      let l:gitstatus = FugitiveStatusline()
      let l:symbols = ['+', '~', '-']
      let l:hunks = GitGutterGetHunkSummary()
      let l:ret = []
      for i in [0, 1, 2]
        if l:hunks[i] > 0
          call add(l:ret, l:symbols[i] . l:hunks[i])
        endif
      endfor
      if ret != []
        let l:gitgutter = ' ' . join(l:ret, ' ')
      else
        let l:gitgutter = ''
      endif
      let l:gitinfo = ' ' . l:gitstatus . l:gitgutter
      return strlen(l:gitstatus) && winwidth(0) > 50 ? l:gitinfo : ''
    endif
  catch
  endtry
  return ''
endfunction

" Shows nothing if fileformat is 'unix', shows fileformat otherwise
function! LightLineFileformat() abort
  return winwidth(0) > 70 && &fileformat != 'unix' ? &fileformat : ''
endfunction

function! LightLineFiletype() abort
  return FilenameOrFiletypeMatch() ? '' :
       \ winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding() abort
  return FilenameOrFiletypeMatch() ? '' :
       \ &fenc == 'utf-8' ? '' :
       \ winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) :
       \ ''
endfunction

function! ALEStatusLine() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors

  return l:counts.total == 0 ? '' : printf('E:%d W:%d', all_errors, all_non_errors)
endfunction

" update statusline after ALE has finished linting
augroup AutoALE
  autocmd!
  autocmd User ALELintPost call lightline#update()
augroup END


"================================  FILETYPES  ==================================
""""""""""""""""""""""""""""""""" css
augroup ft_css
  autocmd!
  autocmd FileType css setlocal iskeyword+=-
augroup END

""""""""""""""""""""""""""""""""" dlang
function! DUddocPreview() abort
  let l:output = ''
  redir! => l:output
    silent call dutyl#displayDDocForSymbolUnderCursor()
  redir END
  if output == ''
    echo 'No documentation found'
    return
  endif
  pclose
  pedit! __duddoc__
  exec "normal! \<C-w>P"
  call setline(1, split(l:output, "\n"))
  setlocal filetype=duddoc
  exec "normal! \<C-w>p"
endfunction

augroup duddoc_filetype
  autocmd!
  autocmd FileType duddoc setlocal nobuflisted buftype=nofile bufhidden=wipe nomodifiable nonumber wrap
augroup END

augroup ft_d
  autocmd!
  autocmd FileType d setlocal shiftwidth=4 softtabstop=-1
  autocmd FileType d nnoremap <buffer><silent> K :call DUddocPreview()<CR>
  autocmd FileType d nnoremap <buffer><silent> <space>d :DUjump<CR>
  autocmd FileType d
        \ nnoremap <buffer><script><silent> <F9> :<C-u>exec 'Topen \| T dmd -dw -w -unittest -run ' . expand("%")<CR>
augroup END

""""""""""""""""""""""""""""""""" haskell
augroup ft_haskell
  autocmd!
  autocmd FileType haskell nnoremap <buffer>         <space>hh :Hoogle<space>
  autocmd FileType haskell nnoremap <buffer><silent> K         :call LanguageClient#textDocument_hover()<CR>
  autocmd FileType haskell nnoremap <buffer><silent> <space>d  :call LanguageClient#textDocument_definition()<CR>
  autocmd FileType haskell nnoremap <buffer><silent> <space>lf :call LanguageClient#textDocument_formatting()<CR>
  autocmd FileType haskell nnoremap <buffer><silent> <space>lr :call LanguageClient#textDocument_rename()<CR>
  autocmd FileType haskell nnoremap <buffer><silent> <space>ll :call LanguageClient#textDocument_references()<CR>
  autocmd FileType haskell nnoremap <buffer><silent> <space>la :call LanguageClient#textDocument_codeAction()<CR>
  autocmd FileType haskell nnoremap <buffer><silent> <space>ft :call LanguageClient#textDocument_documentSymbol()<CR>
augroup END

""""""""""""""""""""""""""""""""" javascript
augroup ft_javascript
  autocmd!
  autocmd FileType javascript nnoremap <buffer><silent> K         :call LanguageClient#textDocument_hover()<CR>
  autocmd FileType javascript nnoremap <buffer><silent> <space>d  :call LanguageClient#textDocument_definition()<CR>
  autocmd FileType javascript nnoremap <buffer><silent> <space>lf :call LanguageClient#textDocument_formatting()<CR>
  autocmd FileType javascript nnoremap <buffer><silent> <space>lr :call LanguageClient#textDocument_rename()<CR>
  autocmd FileType javascript nnoremap <buffer><silent> <space>ll :call LanguageClient#textDocument_references()<CR>
  autocmd FileType javascript nnoremap <buffer><silent> <space>la :call LanguageClient#textDocument_codeAction()<CR>
  autocmd FileType javascript nnoremap <buffer><silent> <space>ft :call LanguageClient#textDocument_documentSymbol()<CR>
augroup END

""""""""""""""""""""""""""""""""" lua
augroup ft_lua
  autocmd!
  autocmd FileType lua setlocal tabstop=4 softtabstop=4 shiftwidth=4
augroup END
""""""""""""""""""""""""""""""""" python
function! SelectionWithPython(line1, line2) range
  write
  exec printf('Topen | T sed -n "%s,%s p" %s | python', a:line1, a:line2, expand('%'))
endfunction

augroup ft_python
  autocmd!
  autocmd FileType python setlocal complete+=t formatoptions-=t define=^\s*\\(def\\\\|class\\)
  autocmd FileType python let b:delimitMate_nesting_quotes = ['"']
  autocmd FileType python
        \ vmap <buffer><script> <silent> <F9> :call SelectionWithPython(line("'<"), line("'>"))<CR>
  autocmd FileType python
        \ nmap <buffer><script> <silent> <F9> :call SelectionWithPython(1, line("$"))<CR>
augroup END

""""""""""""""""""""""""""""""""" vim
augroup ft_vim
  autocmd!
  autocmd FileType vim setlocal iskeyword-=#
augroup END