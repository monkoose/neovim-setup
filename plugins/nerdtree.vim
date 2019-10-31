Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}

let NERDTreeAutoDeleteBuffer  = 1
let NERDTreeMinimalUI         = 1
let NERDTreeQuitOnOpen        = 1
let NERDTreeRespectWildIgnore = 1
let NERDTreeWinSize           = 36
let NERDTreeDirArrowCollapsible = '◻'
let NERDTreeDirArrowExpandable = '◼'

nmap    <silent>    <M-1>    :NERDTreeToggle<CR>

augroup NERDTreeMap
  autocmd!
  autocmd FileType nerdtree nmap <buffer> l o
  autocmd FileType nerdtree nmap <buffer> L go
  autocmd FileType nerdtree nmap <buffer> h x
  autocmd FileType nerdtree nmap <buffer> H X
augroup END
