set termguicolors
colorscheme boa
set title
set synmaxcol=1000
set hidden
set spelllang=en_us,ru_yo
set pumheight=10
set nofixendofline
set nowrap
set number relativenumber
set ignorecase smartcase
set scrolloff=5 sidescrolloff=5
set history=300
set undolevels=300
set updatetime=600
" find ~/.local/share/nvim/undo-files -type f -mtime +30 | xargs -r rm
set noswapfile undofile undodir=~/.local/share/nvim/undo-files/
set viewoptions=cursor,curdir,folds
set sessionoptions=buffers,curdir,folds,help,tabpages,winsize,options
set linebreak
set showbreak=└
set list listchars=tab:→-,trail:·,extends:⌇,precedes:⌇,nbsp:~
set fillchars=vert:█,fold:·
set tabpagemax=20
set splitbelow splitright
set expandtab smartindent shiftround shiftwidth=2 softtabstop=-1
set nojoinspaces
set completeopt=menuone,noselect
set wildignore+=*/.git/*,*/__pycache__/*,*.pyc
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg
set shortmess=filnrxtToOFIc
set diffopt=filler,vertical
set guicursor=
set inccommand=split
set keymap=russian-jcukenwin iminsert=0
set grepprg=rg\ --vimgrep grepformat=%f:%l:%c:%m
" set textwidth=99

" shipped plugins config {{{
let g:loaded_fzf = 1
let g:markdown_folding = 1
let g:loaded_netrwPlugin = 1
let g:loaded_2html_plugin = 1
let g:loaded_tutor_mode_plugin = 1
let g:loaded_zipPlugin = 1
let g:loaded_tarPlugin = 1
let g:python_highlight_all = 1
let g:loaded_gzip = 1
let g:python3_host_prog = '/usr/bin/python'
let g:loaded_python_provider = 0
let g:loaded_ruby_provider = 0
let g:loaded_node_provider = 0
"}}}
" highlight yanked text {{{
augroup HighlightYank
  autocmd!
  autocmd TextYankPost * silent! lua vim.highlight.on_yank {higroup="YankedText", timeout=250}
augroup END
"}}}
" Diff current state of the buffer with the file it is loaded from
command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis | wincmd p | diffthis
" restore cursor position {{{
function! s:RestoreBufView() abort
  if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
    exe "normal! g`\""
  endif
endfunction

augroup RestoreView
  autocmd!
  autocmd BufReadPost * call s:RestoreBufView()
augroup END
"}}}
" check for changed files outside of neovim {{{
augroup CheckTime
  autocmd!
  autocmd FocusGained * silent! checktime
augroup END
"}}}
" terminal window autocmd {{{
augroup TermWindow
  autocmd!
  autocmd TermOpen * setlocal nonumber norelativenumber
augroup END
"}}}
" FileType config {{{
augroup FileTypeOptions
  autocmd!
  autocmd FileType * syntax sync minlines=200
  autocmd FileType qf        setlocal wrap
  autocmd FileType vim       setlocal iskeyword-=#
  autocmd FileType css,scss  setlocal iskeyword+=-
  autocmd FileType haskell,d       setlocal shiftwidth=4
  autocmd FileType gitcommit setlocal spell | startinsert
  autocmd FileType fugitive nmap <buffer> <C-l> =
augroup END
"}}}
" vim: foldmethod=marker
