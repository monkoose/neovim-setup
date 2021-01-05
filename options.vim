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
set history=2000
set undolevels=300
set updatetime=600
set noswapfile undofile undodir=~/.local/share/nvim/undo-files/
set shada=!,'100,<50,:300,s50,h
set viewoptions=cursor,curdir,folds
set sessionoptions=buffers,curdir,folds,help,tabpages,winsize,options
set showcmd
set linebreak
set showbreak=└
set list listchars=tab:→-,trail:·,extends:⌇,precedes:⌇,nbsp:~
set fillchars=vert:█,fold:·
set noruler
set tabpagemax=20
set splitbelow splitright
set expandtab smartindent shiftround shiftwidth=2 softtabstop=-1
set nojoinspaces
set completeopt=menuone,longest,noinsert,noselect
set wildignore+=*/.git/*,*/__pycache__/*,*.pyc
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg
set shortmess=filnrxtToOFIc
set diffopt=filler,vertical
set guicursor=
set inccommand=split
set timeoutlen=3000
set keymap=russian-jcukenwin iminsert=0
" set textwidth=99

" shipped plugins config {{{
let g:markdown_folding = 1
let g:loaded_netrwPlugin = 1
let g:python_highlight_all = 1
let g:loaded_2html_plugin = 1
let g:loaded_tutor_mode_plugin = 1
let g:python3_host_prog = '/usr/bin/python'
let g:loaded_python_provider = 0
let g:loaded_ruby_provider = 0
let g:loaded_node_provider = 0
"}}}
" restore cursor position {{{
augroup RestoreView
  autocmd!
  autocmd BufWinLeave ~/** silent! mkview
  autocmd BufWinEnter ~/** silent! loadview
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
  autocmd BufEnter term://* if &filetype =~ 'nuake' | startinsert | endif
augroup END
"}}}
" FileType config {{{
augroup FileTypeOptions
  autocmd!
  autocmd FileType * syntax sync minlines=200
  autocmd FileType qf        setlocal wrap
  autocmd FileType vim       setlocal iskeyword-=#
  autocmd FileType css,scss  setlocal iskeyword+=-
  autocmd FileType lua       setlocal shiftwidth=4
  autocmd FileType haskell   setlocal shiftwidth=4
  autocmd FileType gitcommit setlocal spell | startinsert
augroup END
"}}}
" vim: foldmethod=marker
