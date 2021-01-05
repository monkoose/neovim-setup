call plug#begin('~/.local/share/nvim/plugged')
Plug 'monkoose/boa.vim'                                               " adds colorscheme
Plug 'tpope/vim-repeat'                                               " makes '.' command more usable
Plug 'tpope/vim-surround'                                             " makes manipulating with (),[],''... enjoyable
Plug 'tpope/vim-unimpaired'                                           " adds common toggling options, new ] and [ commands, encoding/decoding
Plug 'tpope/vim-scriptease'                                           " adds help commands for vimscripting
Plug 'tpope/vim-characterize'                                         " improves 'ga'
Plug 'neovimhaskell/haskell-vim', {'for': ['haskell']}                " improves haskell syntax and indentation
Plug 'tbastos/vim-lua', {'for': ['lua']}                              " improves lua syntax highlighting and indentation
Plug 'Vimjas/vim-python-pep8-indent', {'for': ['python']}             " improves python indentation
Plug 'hail2u/vim-css3-syntax'                                         " improves CSS syntax highlighting
Plug 'cakebaker/scss-syntax.vim'                                      " add scss syntax highlighting
Plug 'othree/html5.vim'                                               " improves HTML syntax highlighting
Plug 'pangloss/vim-javascript'                                        " improves JavaScript syntax highlighting and indentation
Plug 'honza/vim-snippets'                                             " adds snippets support
Plug 'wellle/targets.vim'                                             " adds new targets like in( or 2alB
Plug 'cespare/vim-toml', {'for': ['toml']}                            " adds toml highlighting
Plug 'evanleck/vim-svelte', {'for': ['svelte']}                       " adds svelte highlighting
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" PLUGINS WITH CUSTOM CONFIG
Plug 'neoclide/coc.nvim', {'branch': 'release'}                       " adds autocompletion and langserver
Plug 'antoinemadec/coc-fzf'                                           " adds fzf support for CocList
Plug 'Raimondi/delimitMate'                                           " adds auto pairs
Plug 'monkoose/fzf.nvim'                                              " adds fuzzy finder for multiple sources
Plug 'monkoose/fzf-hoogle.vim'                                        " adds hoogle preview
Plug 'Lenovsky/nuake', {'on': 'Nuake'}                                " for better terminal experience
Plug 'rhysd/reply.vim', {'on': 'Repl'}                                " adds repl
Plug 'kevinhwang91/rnvimr', {'on': 'RnvimrToggle'}                    " adds ranger support in neovim
Plug 'tomtom/tcomment_vim'                                            " adds easy lines commenting
Plug 'mbbill/undotree', {'on': 'UndotreeToggle'}                      " for visualizing undo history
Plug 'junegunn/vim-easy-align', {'on': '<Plug>(EasyAlign)'}           " adds aligning of text
Plug 'easymotion/vim-easymotion'                                      " for easier jumps to any position on the screen
Plug 'tpope/vim-fugitive'                                             " adds git support inside vim
Plug 'lambdalisue/vim-gista', {'on': 'Gista'}                         " adds gist support
Plug 'airblade/vim-gitgutter'                                         " add git hunks and signs
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }             " show colors preview
call plug#end()

" PLUGINS CONFIG
" neoclide/coc.nvim antoinemadec/coc-fzf {{{
let g:coc_global_extensions = [
      \ 'coc-vimlsp',
      \ 'coc-yank',
      \ 'coc-json',
      \ 'coc-sh',
      \ 'coc-snippets',
      \ 'coc-python',
      \ 'coc-tsserver',
      \ 'coc-html',
      \ 'coc-css',
      \ 'coc-yaml',
      \ 'coc-svelte',
      \ 'coc-clangd',
      \ ]

let g:coc_snippet_next = '<M-e>'
let g:coc_snippet_prev = '<M-r>'
inoremap <silent><expr>   <M-e>       pumvisible() ? coc#_select_confirm() : coc#refresh()
nmap     <silent>         <space>kk   :CocRestart<CR>
nmap     <silent>         <space>D    <Plug>(coc-declaration)
nmap     <silent>         <space>kr   <Plug>(coc-references)
nmap     <silent>         <space>kR   <Plug>(coc-rename)
nmap     <silent>         <space>ka   :CocFzfList actions<CR>
nmap     <silent>         <space>kD   :CocFzfList diagnostics<CR>
nmap     <silent>         <space>kd   :CocFzfList diagnostics --current-buf<CR>
nmap     <silent>         <space>ky   :CocFzfList yank<CR>
nmap     <silent>         <space>ks   :CocFzfList symbols<CR>
nmap     <silent>         <space>kf   <Plug>(coc-format)
nmap     <silent>         <space>ki   <Plug>(coc-diagnostic-info)
nmap     <silent>         <space>ko   :CocFzfList outline<CR>
nmap     <silent>         <space>kl   :CocFzfList<CR>
vmap     <silent>         <space>ka   <Plug>(coc-codeaction-selected)
vmap     <silent>         <space>kf   <Plug>(coc-format-selected)

augroup CocFiletypeMaps
  autocmd!
  autocmd FileType css,scss,javascript,typescript,html,python,haskell,json,yaml,vim,svelte,sh,c
        \ call s:define_coc_mappings()
  autocmd FileType haskell vmap <buffer><silent> K :call CocActionAsync('doHover')<CR>
augroup END

function! s:define_coc_mappings() abort
  nnoremap <buffer><silent> K        :call CocActionAsync('doHover')<CR>
  nmap     <buffer><silent> <space>d <Plug>(coc-definition)
  nmap     <buffer>         <space>l <Plug>(coc-diagnostic-next)
  nmap     <buffer>         <space>L <Plug>(coc-diagnostic-prev)
endfunction
"}}}
" Raimondi/delimitMate {{{
let g:delimitMate_expand_cr    = 1
let g:delimitMate_expand_space = 1

augroup DelimitMatePython
  autocmd!
  autocmd FileType python let b:delimitMate_nesting_quotes = ['"']
augroup END
"}}}
" monkoose/fzf.nvim {{{
let s:fzf_big_float = 'call fzf#floating(36, 140)'
let s:fzf_defaults = [
      \ '--bind="alt-t:toggle-preview,alt-i:toggle-all,ctrl-n:preview-page-down,ctrl-p:preview-page-up,ctrl-l:accept,' .
          \ 'ctrl-r:clear-screen,alt-p:next-history,alt-n:previous-history,ctrl-alt-j:page-down,ctrl-alt-k:page-up"',
      \ '--color=hl:#608bbf,fg+:#b8af96,hl+:#608bbf,bg+:#3b312b,border:#40362f,gutter:#272e22,pointer:#d35b4b,prompt:#c57c41,marker:#b2809f,info:#70a17c',
      \ '--layout=reverse --tabstop=2 --info=inline --margin=1,3 --exact'
      \ ]
let $FZF_DEFAULT_OPTS = join(s:fzf_defaults, " ")
let g:fzf_history_dir = '~/.local/share/nvim/fzf-history'
let g:fzf_command_prefix = 'Fzf'
command! -nargs=* FzfGFiles call fzf#vim#gitfiles(<q-args>, {'options': '--preview-window up:60%', 'window': s:fzf_big_float})
command! FzfCommits call fzf#vim#commits({'options': '--preview-window up:60%', 'window': s:fzf_big_float})
command! FzfBCommits call fzf#vim#buffer_commits({'options': '--preview-window up:60%', 'window': s:fzf_big_float})

imap <c-x><c-k> <plug>(fzf-complete-file)
imap <c-x><c-l> <plug>(fzf-complete-line)
imap <c-x><c-f> <plug>(fzf-complete-file-rg)
nmap <silent>    <space>;        :FzfBuffers<CR>
nmap <silent>    <space>ff       :FzfFiles<CR>
nmap <silent>    <space>fg       :FzfGFiles?<CR>
nmap <silent>    <space>fc       :FzfCommits<CR>
nmap <silent>    <space>fb       :FzfBCommits<CR>
nmap <silent>    <space>fm       :FzfHistory<CR>
nmap <silent>    <space>fk       :FzfMaps<CR>
nmap <silent>    <space>ss       :FzfRg<CR>
nmap <silent>    <space>sS       :FzfRgFull<CR>
nmap <silent>    <space>sb       :FzfBLines<CR>
nmap <silent>    <space>sl       :FzfLines<CR>
nmap <silent>    <space>sw       :FzfRg <c-r>=expand("<cword>")<CR><CR>
nmap <silent>    <space>fl       :FzfLocationList<CR>
nmap <silent>    <space>fq       :FzfQuickfix<CR>
"nmap <silent>    <space>ft     :FzfBTags<CR>
"nmap <silent>    <space>fa     :FzfTags<CR>

command! FzfQuickfix call s:quickfix(1)
command! FzfLocationList call s:quickfix(0)

function! s:open_quickfix_item(e) abort
  let line = a:e
  let filename = fnameescape(split(line, ':\d\+:')[0])
  let linenr = matchstr(line, ':\d\+:')[1:-2]
  let colum = matchstr(line, '\(:\d\+\)\@<=:\d\+:')[1:-2]
  exe 'e ' . filename
  call cursor(linenr, colum)
endfunction

function! s:quickfix_to_grep(v) abort
  return bufname(a:v.bufnr) . ':' . a:v.lnum . ':' . a:v.col . ':' . a:v.text
endfunction

function! s:quickfix_list(nr) abort
  if a:nr == 1
    return map(getqflist(), 's:quickfix_to_grep(v:val)')
  else
    return map(getloclist(0), 's:quickfix_to_grep(v:val)')
  endif
endfunction

function! s:quickfix(nr) abort
  call fzf#run(fzf#wrap('quickfix', {
        \ 'source':  reverse(s:quickfix_list(a:nr)),
        \ 'sink':    function('s:open_quickfix_item'),
        \ 'options': '--reverse',
        \ }))
endfunction
" }}}
" monkoose/fzf-hoogle.vim {{{
augroup HoogleMaps
  autocmd!
  autocmd FileType haskell nnoremap <buffer>   <space>hh :Hoogle <c-r>=expand("<cword>")<CR><CR>
augroup END
let g:hoogle_fzf_header = ''
let g:hoogle_count = 100
" }}}
" Lenovsky/nuake {{{
let g:nuake_size = 0.40

nnoremap    <silent>    <M-`>        :Nuake<CR>
tnoremap    <silent>    <M-`>        <C-\><C-n>:Nuake<CR>
" }}}
" rhysd/reply.vim {{{
nmap <space>rr :ReplSend<CR><Esc>
vmap <space>rr :ReplSend<CR><Esc>
nmap <space>rR ggVG:ReplSend<CR><Esc>``
" }}}
" kevinhwang91/rnvimr {{{
let g:rnvimr_enable_ex = 1
let g:rnvimr_enable_bw = 1
let g:rnvimr_enable_picker = 1
let g:rnvimr_hide_gitignore = 1

nmap        <silent>    <M-1>    :RnvimrToggle<CR>
tnoremap    <silent>    <M-1>    <C-\><C-n>:RnvimrToggle<CR>
" }}}
" tomtom/tcomment_vim {{{
let g:tcomment#filetype#guess_svelte = 1
vnoremap gb :TCommentBlock<CR>
" }}}
" mbbill/undotree {{{
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_WindowLayout       = 2
let g:undotree_ShortIndicators    = 1
let g:undotree_HelpLine           = 0
nmap    <silent>    <M-4>    :UndotreeToggle<CR>
" }}}
" junegunn/vim-easy-align {{{
vmap    <Enter>    <Plug>(EasyAlign)
" }}}
" easymotion/vim-easymotion {{{
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us = 1
let g:EasyMotion_verbose = 0
let g:EasyMotion_use_upper = 1
let g:EasyMotion_keys = 'ACDEFGHIJKLMNOPRSUVW'

map <silent> ,              <Plug>(easymotion-s)
map <silent> <space><space> <Plug>(easymotion-s)
" }}}
" tpope/vim-fugitive {{{
nnoremap    <space>gg    :Gstatus<CR>
nnoremap    <space>gb    :Gblame<CR>
nnoremap    <space>gc    :Gcommit<CR>
nnoremap    <space>gd    :Gdiff<CR>
nnoremap    <space>ge    :Gedit<CR>
" }}}
" lambdalisue/vim-gista {{{
let g:gista#client#default_username = "monkoose"
let g:gista#command#list#enable_default_mappings = 0
let g:gista#command#commits#enable_default_mappings = 0
let g:gista#command#list#show_status_string_in_prologue = 0
let g:gista#command#commits#show_status_string_in_prologue = 0
nnoremap    <space>gl     :Gista list<CR>
nnoremap    <space>gp     :Gista post -P -d=""<Left>

augroup GistaBuffer
  autocmd!
  autocmd FileType gista-list,gista-commits call s:define_gista_mappings()
augroup END

function! s:define_gista_mappings() abort
  nmap <buffer> q <Plug>(gista-quit)
  nmap <buffer> <C-n> <Plug>(gista-next-mode)
  nmap <buffer> <C-p> <Plug>(gista-prev-mode)
  nmap <buffer> ? <Plug>(gista-toggle-mapping-visibility)
  nmap <buffer> <C-r> <Plug>(gista-redraw)
  nmap <buffer> <F5>   <Plug>(gista-update)
  nmap <buffer> <M-r> <Plug>(gista-UPDATE)
  map <buffer> <Return> <Plug>(gista-edit-tab)
  map <buffer> <C-l> <Plug>(gista-edit-tab)
  map <buffer> bb <Plug>(gista-browse-open)
  map <buffer> yy <Plug>(gista-browse-yank)
  map <buffer> rr <Plug>(gista-rename)
  map <buffer> df <Plug>(gista-remove)
  map <buffer> dd <Plug>(gista-delete)
  map <buffer> ++ <Plug>(gista-star)
  map <buffer> -- <Plug>(gista-unstar)
  map <buffer> ff <Plug>(gista-fork)
  map <buffer> cc <Plug>(gista-commits)
endfunction
" }}}
" airblade/vim-gitgutter {{{
let g:gitgutter_sign_modified_removed  = '≃'

nmap  <silent>   <space>gi <Plug>(GitGutterPreviewHunk)
nmap  <silent>   <space>guu <Plug>(GitGutterUndoHunk)
nmap  <silent>   <space>gss <Plug>(GitGutterStageHunk)

augroup GitGutterUpdate
  autocmd!
  autocmd BufWritePost * GitGutter
augroup END
" }}}
" rrethy/vim-hexokinase {{{
let g:Hexokinase_highlighters = ['background']
let g:Hexokinase_ftEnabled = ['css', 'html', 'javascript', 'typescript', 'vim', 'svelte']
" }}}
" vim: foldmethod=marker
