" set fileencodings=utf-8,cp1251,koi8-r
let g:python3_host_prog = '/usr/bin/python'
let g:loaded_python_provider = 0
let g:loaded_ruby_provider = 0
let g:loaded_node_provider = 0
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
set undofile
set showcmd
set undodir=~/.local/share/nvim/undo-files/
set viewoptions=cursor,folds
set linebreak
set showbreak=└
set list
set listchars=tab:→-,trail:·,extends:⌇,precedes:⌇,nbsp:~
set fillchars=vert:█,fold:·
set noruler
set tabpagemax=20
set smartindent
set shiftround
set tildeop
set expandtab
set tabstop=4
set shiftwidth=2
set softtabstop=-1
set nojoinspaces
set sessionoptions-=blank
set shada=!,'100,<50,:50,s10,h
set textwidth=99
set completeopt=menuone,longest
set wildignore+=*/.git/*,*/__pycache__/*,*.pyc,*/.stack-work/*
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg
set shortmess=filnrxtToOFIc
set diffopt=filler,vertical
set guicursor=
set inccommand=split
set timeoutlen=3000

let g:markdown_folding=1
let loaded_netrwPlugin = 1
let g:python_highlight_all = 1

augroup FileTypeOptions
  autocmd!
  autocmd FileType qf       setlocal wrap
  autocmd FileType vim      setlocal iskeyword-=#
  autocmd FileType python   setlocal complete+=t formatoptions-=t define=^\s*\\(def\\\\|class\\)
  autocmd FileType css,scss setlocal iskeyword+=-
  autocmd FileType lua      setlocal tabstop=4 softtabstop=4 shiftwidth=4
  autocmd FileType haskell  setlocal tabstop=4 softtabstop=4 shiftwidth=4
augroup END
