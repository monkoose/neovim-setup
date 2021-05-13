call plug#begin('~/.local/share/nvim/plugged')
Plug 'monkoose/boa.vim'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-scriptease'
Plug 'tpope/vim-characterize'
Plug 'tbastos/vim-lua', {'for': ['lua']}
Plug 'Vimjas/vim-python-pep8-indent', {'for': ['python']}
Plug 'hail2u/vim-css3-syntax'
Plug 'cakebaker/scss-syntax.vim'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'wellle/targets.vim'
Plug 'cespare/vim-toml', {'for': ['toml']}
Plug 'evanleck/vim-svelte', {'for': ['svelte']}
Plug 'rust-lang/rust.vim', {'for': ['rust']}

" PLUGINS WITH CUSTOM CONFIG
Plug 'Raimondi/delimitMate'
Plug 'Lenovsky/nuake', {'on': 'Nuake'}
Plug 'rhysd/reply.vim', {'on': 'Repl'}
Plug 'kevinhwang91/rnvimr', {'on': 'RnvimrToggle'}
Plug 'tomtom/tcomment_vim'
Plug 'mbbill/undotree', {'on': 'UndotreeToggle'}
Plug 'junegunn/vim-easy-align', {'on': '<Plug>(EasyAlign)'}
Plug 'phaazon/hop.nvim'
Plug 'tpope/vim-fugitive'
Plug 'lambdalisue/vim-gista', {'on': 'Gista'}
Plug 'airblade/vim-gitgutter'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'hrsh7th/vim-vsnip'
Plug 'rafamadriz/friendly-snippets'
Plug 'monkoose/fzf.nvim'
Plug 'vijaymarupudi/nvim-fzf'
Plug 'monkoose/nvim-fzf-providers'
call plug#end()

" PLUGINS CONFIG
" lsp {{{
imap <expr> <C-i>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : "\<C-i>"
smap <expr> <C-i>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : "\<C-i>"
imap <expr> <M-i>   vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : ''
smap <expr> <M-i>   vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : ''
inoremap <silent><expr>   <CR>        compe#confirm({ 'keys': "\<Plug>delimitMateCR", 'mode': '' })
inoremap <silent><expr>   <C-l>       compe#confirm()
inoremap <silent><expr>   <C-j>       pumvisible() ? "\<C-n>" : compe#complete()
inoremap <silent><expr>   <C-k>       pumvisible() ? "\<C-p>" : compe#complete()
inoremap <silent><expr>   <C-e>       compe#close('<C-e>')
inoremap <silent><expr>   <C-n>       pumvisible() ? compe#scroll({ 'delta': +4 }) : "\<C-n>"
inoremap <silent><expr>   <C-p>       pumvisible() ? compe#scroll({ 'delta': -4 }) : "\<C-k>"

nmap     <silent>         <space>kk   <Cmd>LspRestart<CR>
nmap     <silent>         <space>D    <Cmd>lua vim.lsp.buf.declaration()<CR>
nmap     <silent>         <space>kt   <Cmd>lua vim.lsp.buf.type_definition()<CR>
nmap     <silent>         <space>kr   <Cmd>lua vim.lsp.buf.references()<CR>
nmap     <silent>         <space>kR   <Cmd>lua vim.lsp.buf.rename()<CR>
nmap     <silent>         <space>kd   <Cmd>lua vim.lsp.diagnostic.set_loclist()<CR>
nmap     <silent>         <space>kf   <Cmd>lua vim.lsp.buf.formatting()<CR>
vmap     <silent>         <space>kf   <Cmd>lua vim.lsp.buf.range_formatting()<CR>
nmap     <silent>         <space>ki   <Cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>
nmap     <silent>         <space>ka   <Cmd>lua vim.lsp.buf.code_action()<CR>
nmap     <silent>         <space>l    <Cmd>lua vim.lsp.diagnostic.goto_next()<CR>
nmap     <silent>         <space>L    <Cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nmap     <silent>         <space>ks   <Cmd>lua vim.lsp.buf.document_symbol()<CR>

augroup LspFiletypeMaps
  autocmd!
  autocmd FileType css,scss,javascript,typescript,html,python,json,vim,svelte,sh,c,lua,rust
        \ call s:define_lsp_mappings()
augroup END

function! s:define_lsp_mappings() abort
  nnoremap <buffer><silent> K         <Cmd>lua vim.lsp.buf.hover()<CR>
  nmap     <buffer><silent> <space>d  <Cmd>lua vim.lsp.buf.definition()<CR>
endfunction
"}}}
" hrsh7th/nvim-compe {{{
let g:loaded_compe_emoji = v:false
let g:loaded_compe_luasnip = v:false
let g:loaded_compe_omni = v:false
let g:loaded_compe_spell = v:false
let g:loaded_compe_snippets_nvim = v:false
let g:loaded_compe_tags = v:false
let g:loaded_compe_treesitter = v:false
let g:loaded_compe_vim_lsc = v:false
let g:loaded_compe_vim_lsp = v:false
let g:loaded_compe_ultisnips = v:false
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
let s:fzf_defaults = [
      \ '--bind="ctrl-/:toggle-preview,alt-i:toggle-all,ctrl-n:preview-page-down,ctrl-p:preview-page-up,ctrl-l:accept,' ..
          \ 'ctrl-r:clear-screen,alt-k:next-history,alt-j:previous-history,ctrl-alt-j:page-down,ctrl-alt-k:page-up"',
      \ '--color=hl:#f158a6,fg+:#b8af96,hl+:#f158a6,bg+:#3b312b,border:#40362f,gutter:#21261d,pointer:#d3c94b,prompt:#c57c41,marker:#d24b98,info:#70a17c',
      \ '--pointer=● --marker=▶ --layout=reverse --tabstop=2 --info=inline --margin=1,3 --exact --header='
      \ ]
let $FZF_DEFAULT_OPTS = join(s:fzf_defaults, " ")
let s:fzf_big_float = 'call fzf#floating(33, 140)'
let s:preview_window = '--preview-window down:65%,border-sharp'
let g:fzf_history_dir = '~/.local/share/nvim/fzf-history'
let g:fzf_command_prefix = 'Fzf'

command! -nargs=* FzfGFiles call fzf#vim#gitfiles(<q-args>, {'options': s:preview_window, 'window': s:fzf_big_float})
command! FzfCommits call fzf#vim#commits({'options': s:preview_window, 'window': s:fzf_big_float})
command! FzfBCommits call fzf#vim#buffer_commits({'options': s:preview_window, 'window': s:fzf_big_float})
command! FzfFiles call fzf#vim#files(<q-args>, {'options': s:preview_window, 'window': s:fzf_big_float})

nnoremap <silent>  <space>ff  <Cmd>lua require("fzf-providers").files('')<CR>
nnoremap <silent>  <space>fF  <Cmd>lua require("fzf-providers").files('', true)<CR>

imap <c-x><c-k> <plug>(fzf-complete-file)
imap <c-x><c-l> <plug>(fzf-complete-line)
imap <c-x><c-f> <plug>(fzf-complete-file-rg)
nmap <silent>    <space>;        <Cmd>FzfBuffers<CR>
" nmap <silent>    <space>ff       <Cmd>FzfFiles<CR>
nmap <silent>    <space>gs       <Cmd>FzfGFiles?<CR>
nmap <silent>    <space>gc       <Cmd>FzfCommits<CR>
nmap <silent>    <space>gb       <Cmd>FzfBCommits<CR>
nmap <silent>    <space>fo       <Cmd>FzfHistory<CR>
nmap <silent>    <space>fk       <Cmd>FzfMaps<CR>
nmap <silent>    <space>ss       <Cmd>FzfRg<CR>
nmap <silent>    <space>sS       <Cmd>FzfRgFull<CR>
nmap <silent>    <space>sb       <Cmd>FzfBLines<CR>
nmap <silent>    <space>sl       <Cmd>FzfLines<CR>
nmap <silent>    <space>sw       :<C-u>FzfRg <C-r><C-w><CR>
nmap <silent>    <space>fl       <Cmd>FzfLocationList<CR>
nmap <silent>    <space>fq       <Cmd>FzfQuickfix<CR>
"nmap <silent>    <space>ft     <Cmd>FzfBTags<CR>
"nmap <silent>    <space>fa     <Cmd>FzfTags<CR>

command! FzfQuickfix call s:quickfix(1)
command! FzfLocationList call s:quickfix(0)

function! s:open_quickfix_item(e) abort
  let line = a:e
  let filename = fnameescape(split(line, ':\d\+:')[0])
  let linenr = matchstr(line, ':\d\+:')[1:-2]
  let colum = matchstr(line, '\(:\d\+\)\@<=:\d\+:')[1:-2]
  exe 'edit ' .. filename
  call cursor(linenr, colum)
endfunction

function! s:quickfix_to_grep(v) abort
  return bufname(a:v.bufnr) .. ':' .. a:v.lnum .. ':' .. a:v.col .. ':' .. a:v.text
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
"}}}
" Lenovsky/nuake {{{
let g:nuake_size = 0.40

nnoremap    <silent>    <M-`>        <Cmd>Nuake<CR>
tnoremap    <silent>    <M-`>        <C-\><C-n>:Nuake<CR>
" }}}
" rhysd/reply.vim {{{
nmap <space>rr <Cmd>ReplSend<CR><Esc>
vmap <space>rr <Cmd>ReplSend<CR><Esc>
nmap <space>rR ggVG<Cmd>ReplSend<CR><Esc>``
" }}}
" kevinhwang91/rnvimr {{{
let g:rnvimr_enable_ex = 1
let g:rnvimr_enable_bw = 1
let g:rnvimr_enable_picker = 1
let g:rnvimr_hide_gitignore = 1

nmap        <silent>    <M-1>    <Cmd>RnvimrToggle<CR>
tnoremap    <silent>    <M-1>    <Cmd>RnvimrToggle<CR>
" }}}
" tomtom/tcomment_vim {{{
let g:tcomment#filetype#guess_svelte = 1
vnoremap gb <Cmd>TCommentBlock<CR>
" }}}
" mbbill/undotree {{{
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_WindowLayout       = 2
let g:undotree_ShortIndicators    = 1
let g:undotree_HelpLine           = 0
nmap    <silent>    <M-4>    <Cmd>UndotreeToggle<CR>
" }}}
" junegunn/vim-easy-align {{{
vmap    <Enter>    <Plug>(EasyAlign)
" }}}
" phaazon/hop.nvim {{{
map <silent> ,              <Cmd>HopChar1<CR>
map <silent> <space><space> <Cmd>HopChar1<CR>
" }}}
" tpope/vim-fugitive {{{
nnoremap    <space>gg    <Cmd>Git<CR>
nnoremap    <space>gB    <Cmd>Git blame<CR>
nnoremap    <space>gC    <Cmd>Git commit<CR>
nnoremap    <space>gd    <Cmd>Gdiff<CR>
nnoremap    <space>ge    <Cmd>Gedit<CR>
nnoremap    <space>gp    <Cmd>Git push<CR>
" }}}
" lambdalisue/vim-gista {{{
let g:gista#client#default_username = "monkoose"
let g:gista#command#list#enable_default_mappings = 0
let g:gista#command#commits#enable_default_mappings = 0
let g:gista#command#list#show_status_string_in_prologue = 0
let g:gista#command#commits#show_status_string_in_prologue = 0
nnoremap    <space>gl     <Cmd>Gista list<CR>
nnoremap    <space>gP     :<C-u>Gista post -P -d=""<Left>

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
nmap  <silent>   <space>gU <Plug>(GitGutterUndoHunk)
nmap  <silent>   <space>gS <Plug>(GitGutterStageHunk)

augroup GitGutterUpdate
  autocmd!
  autocmd BufWritePost * GitGutter
augroup END
" }}}
" rrethy/vim-hexokinase {{{
let g:Hexokinase_highlighters = ['virtual']
let g:Hexokinase_ftEnabled = ['css', 'html', 'javascript', 'typescript', 'vim', 'svelte']
" }}}
" vim: foldmethod=marker
