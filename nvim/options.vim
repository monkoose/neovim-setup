syntax enable
set termguicolors
set background=dark
colorscheme boa
set title
set number
set synmaxcol=1000
set hidden
set spelllang=en,ru
set pumheight=10
set fileencodings=utf-8,cp1251,koi8-r
set ignorecase
set smartcase
set cursorline
set noshowmode
set history=500
set undolevels=200
set noswapfile
set undofile
set showcmd
set undodir=~/.local/share/nvim/undo-files/
set viewoptions=cursor,folds
set scrolljump=1
set scrolloff=5
" set sidescrolloff=5
set list
set listchars=tab:⇥\ ,trail:·,extends:…,precedes:…,nbsp:~
set fillchars=vert:\ ,fold:-
set tabpagemax=20
set smartindent
set shiftround
set expandtab
set shiftwidth=4
set softtabstop=4
set nojoinspaces
set sessionoptions-=blank
set shada=!,'100,<50,:50,s10,h
set textwidth=99
set colorcolumn=100
set completeopt=menuone,longest
set wildignore+=*/.git/*,*/__pycache__/*,*.pyc
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg
set shortmess+=c

" Delete trailing whitespaces on save
func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc
augroup whitespace
    autocmd!
    autocmd BufWrite * :call DeleteTrailingWS()
augroup END
