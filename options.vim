set termguicolors
colorscheme boa
set title
set synmaxcol=250
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
set viewoptions=cursor,folds,curdir
set shada=!,'100,<50,:300,s50,h
set sessionoptions=buffers,curdir,folds,help,tabpages,winsize,options
set linebreak
set showbreak=└
set list
set listchars=tab:→-,trail:·,extends:⌇,precedes:⌇,nbsp:~
set fillchars=vert:█,fold:·
set noruler
set tabpagemax=20
set smartindent
set shiftround
set splitbelow
set splitright
set expandtab
set tabstop=4
set shiftwidth=2
set softtabstop=-1
set nojoinspaces
set completeopt=menuone,longest
set wildignore+=*/.git/*,*/__pycache__/*,*.pyc,*/.stack-work/*
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg
set shortmess=filnrxtToOFIc
set diffopt=filler,vertical
set guicursor=
set inccommand=split
set timeoutlen=3000
set keymap=russian-jcukenwin
set iminsert=0
" set fileencodings=utf-8,cp1251,koi8-r
" set textwidth=99

" shipped plugins config
let g:markdown_folding = 1
let g:loaded_netrwPlugin = 1
let g:python_highlight_all = 1
let g:loaded_2html_plugin = 1
let g:loaded_tutor_mode_plugin = 1
let g:python3_host_prog = '/usr/bin/python'
let g:loaded_python_provider = 0
let g:loaded_ruby_provider = 0
let g:loaded_node_provider = 0

" restore cursor position
augroup RestoreView
  autocmd!
  autocmd BufWinLeave ~/** if filereadable(expand('%:p')) | silent! mkview | endif
  autocmd BufWinEnter ~/** silent! loadview
augroup END

" FileType config
augroup FileTypeOptions
  autocmd!
  autocmd FileType svelte syntax sync minlines=200
  autocmd FileType qf       setlocal wrap
  autocmd FileType vim      setlocal iskeyword-=#
  autocmd FileType python   setlocal complete+=t formatoptions-=t define=^\s*\\(def\\\\|class\\)
  autocmd FileType css,scss setlocal iskeyword+=-
  autocmd FileType lua      setlocal tabstop=4 softtabstop=4 shiftwidth=4
  autocmd FileType haskell  setlocal tabstop=4 softtabstop=4 shiftwidth=4
augroup END
