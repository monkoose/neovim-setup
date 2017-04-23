filetype plugin indent on
syntax enable
set termguicolors
set background=dark
colorscheme boa
set title
set synmaxcol=1000
set hidden
set spelllang=en_us,ru_yo
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
set pumheight=10
set fileencodings=utf-8,cp1251,koi8-r
set number
set relativenumber
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
set scrolljump=12
set linebreak
set showbreak=└
set list
set listchars=tab:→·,trail:·,extends:▐,precedes:▌,nbsp:~
set fillchars=vert:\ ,fold:_,
set tabpagemax=20
set smartindent
set shiftround
set expandtab
set shiftwidth=2
set softtabstop=-1
set nojoinspaces
set sessionoptions-=blank
set shada=!,'100,<50,:50,s10,h
set textwidth=79
set colorcolumn=80
set completeopt=menuone,longest
set grepprg=ag\ --nogroup\ --nocolor
set wildignore+=*/.git/*,*/__pycache__/*,*.pyc
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg
set shortmess+=c
set diffopt=filler,vertical

" Folds prettifier
function! NeatFoldText()
  let line = ' ' . substitute(getline(v:foldstart),
        \ '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
  let lines_count = v:foldend - v:foldstart + 1
  let lines_count_text = '| ' . printf("%10s", lines_count . ' lines') . ' |'
  let foldchar = matchstr(&fillchars, 'fold:\zs.')
  let foldtextstart = strpart('+' . repeat(foldchar, v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
  let foldtextend = lines_count_text . repeat(foldchar, 6)
  let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
  return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
endfunction
set foldtext=NeatFoldText()

" Terminal colors
function! SetTermColors()
  let b:terminal_color_0='#171202'
  let b:terminal_color_8='#513c32'
  let b:terminal_color_1='#e36660'
  let b:terminal_color_9='#e36660'
  let b:terminal_color_2='#599161'
  let b:terminal_color_10='#599161'
  let b:terminal_color_3='#b58b4e'
  let b:terminal_color_11='#b58b4e'
  let b:terminal_color_4='#7a9ac6'
  let b:terminal_color_12='#7a9ac6'
  let b:terminal_color_5='#a686b2'
  let b:terminal_color_13='#a686b2'
  let b:terminal_color_6='#598991'
  let b:terminal_color_14='#598991'
  let b:terminal_color_7='#7a6559'
  let b:terminal_color_15='#c2b7a9'
endfunction
augroup terminalcolors
  autocmd!
  autocmd TermOpen * call SetTermColors()
augroup END
