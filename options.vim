set termguicolors
colorscheme boa
set title
set synmaxcol=500
syntax sync minlines=200
set hidden
set spelllang=en_us,ru_yo
set pumheight=10
set nofixendofline
set nowrap
set number
set relativenumber
set ignorecase
set smartcase
set scrolloff=5
set sidescrolloff=5
set history=2000
set undolevels=300
set noswapfile
set updatetime=600
set undofile
set showcmd
set undodir=~/.local/share/nvim/undo-files/
set viewoptions=cursor,curdir,folds
set shada=!,'100,<50,:300,s50,h
set sessionoptions=buffers,curdir,folds,help,tabpages,winsize,options
set linebreak
set showbreak=└
set list
set listchars=tab:→-,trail:·,extends:⌇,precedes:⌇,nbsp:~
set fillchars=vert:█,fold:·
set noruler
set tabpagemax=20
set splitbelow
set splitright
set expandtab
set smartindent
set shiftround
set shiftwidth=2
set softtabstop=-1
set nojoinspaces
set completeopt=menuone,longest,noinsert,noselect
set wildignore+=*/.git/*,*/__pycache__/*,*.pyc,*/.stack-work/*
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg
set shortmess=filnrxtToOFIc
set diffopt=filler,vertical
set guicursor=
set inccommand=split
set timeoutlen=3000
set keymap=russian-jcukenwin
set iminsert=0
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
  autocmd FocusGained * checktime
augroup END
"}}}
" startinsert in terminal window {{{
augroup TermInsert
  autocmd!
  autocmd TermOpen * setlocal nonumber norelativenumber | startinsert
  autocmd BufEnter term://* startinsert
augroup END
"}}}
" FileType config {{{
augroup FileTypeOptions
  autocmd!
  autocmd FileType qf        setlocal wrap
  autocmd FileType vim       setlocal iskeyword-=#
  autocmd FileType css,scss  setlocal iskeyword+=-
  autocmd FileType lua       setlocal shiftwidth=4
  autocmd FileType haskell   setlocal shiftwidth=4
  autocmd FileType gitcommit setlocal spell | startinsert
augroup END
"}}}
" vim: foldmethod=marker
