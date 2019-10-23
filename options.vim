let g:python3_host_prog = '/usr/bin/python'
set termguicolors
colorscheme boa
set background=dark
set title
set synmaxcol=1000
set hidden
set spelllang=en_us,ru_yo
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
set pumheight=10
set fileencodings=utf-8,cp1251,koi8-r
set nofixendofline
set nowrap
set number
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
set linebreak
set showbreak=└
set list
set listchars=tab:→-,trail:·,extends:⌇,precedes:⌇,nbsp:~
set fillchars=vert:█,fold:·,
set tabpagemax=20
set smartindent
set shiftround
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
set shortmess+=filnrxtToOFIc
set diffopt=filler,vertical
set guicursor=
set inccommand=split
set winheight=10
set winminheight=10
set foldtext=NeatFoldText()  "custom looking folds
let g:markdown_folding=1

augroup FileTypeOptions
  autocmd!
  autocmd FileType qf       setlocal wrap
  autocmd FileType markdown setlocal foldexpr=MarkdownFold()
  autocmd FileType vim      setlocal iskeyword-=#
  autocmd FileType python   setlocal complete+=t formatoptions-=t define=^\s*\\(def\\\\|class\\)
  autocmd FileType css,scss setlocal iskeyword+=-
  autocmd FileType lua      setlocal tabstop=4 softtabstop=4 shiftwidth=4
  autocmd FileType haskell  setlocal tabstop=4 softtabstop=4 shiftwidth=4
augroup END

" NeatFoldText() {{{
function! NeatFoldText() abort
  let line = ' ' . substitute(getline(v:foldstart),
        \ '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
  let lines_count = v:foldend - v:foldstart + 1
  let lines_count_text = printf('  ' . "%10s", lines_count . ' lines  ')
  let foldchar = matchstr(&fillchars, 'fold:\zs.')
  let foldtextstart = strpart(repeat('+', v:foldlevel) . line, 0, (winwidth(0)*2)/3)
  let foldtextend = lines_count_text . repeat(foldchar, 6)
  let foldtextlength = strlen( substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
  return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
endfunction
"}}}
" vim:foldmethod=marker:
