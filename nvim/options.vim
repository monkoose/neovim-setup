syntax enable
set termguicolors
set background=dark
colorscheme boa
set title
set synmaxcol=1000
set hidden
set spelllang=en,ru
set pumheight=10
set fileencodings=utf-8,cp1251,koi8-r
set relativenumber
set nowrap
set ignorecase
set smartcase
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
set list
set listchars=tab:→\ ,trail:·,extends:▷,precedes:◁,nbsp:~
set fillchars=vert:\ ,fold:_,
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
set grepprg=ag\ --nogroup\ --nocolor
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

" Folds prettifier
function! NeatFoldText()
  let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
  let lines_count = v:foldend - v:foldstart + 1
  let lines_count_text = '| ' . printf("%10s", lines_count . ' lines') . ' |'
  let foldchar = matchstr(&fillchars, 'fold:\zs.')
  let foldtextstart = strpart('+' . repeat(foldchar, v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
  let foldtextend = lines_count_text . repeat(foldchar, 13)
  let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
  return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
endfunction
set foldtext=NeatFoldText()
