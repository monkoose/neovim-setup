let mapleader = ','
nnoremap \ ,
" disable search highlighting
nmap <silent> <space>/ :nohlsearch<CR>
" let Ctrl-l to delete forward char
inoremap <C-l> <Del>
" switch between two buffers
nnoremap <space>a <C-^>
" Paste and Spell toggle
set pastetoggle=<F2>
nmap <silent> <F3> :setlocal spell!<CR>
" UPPER/lower entire word
nnoremap <space>U mQviwU`Q
nnoremap <space>u mQviwu`Q

map! <C-space> <C-^>
nmap <C-space> :FzfBuffers<CR>
nmap <space>ff :FzfFiles<CR>
nmap <space>fg :FzfGFiles?<CR>
nmap <space>ft :FzfBTags<CR>
nmap <space>fa :FzfTags<CR>
nmap <space>fc :FzfCommits<CR>
nmap <space>fb :FzfBCommits<CR>
nmap <space>fm :FzfMarks<CR>
nmap <space>ss :FzfMyAg!<CR>
nmap <space>sb :FzfBLines<CR>

" Yank and Paste clipboard
nnoremap <space>y "+y
vnoremap <space>y "+y
nnoremap <space>pp "+p
vnoremap <space>pp "+p
" Jump to keyword definition
nnoremap <space>d <C-]>
" Remap C-j and C-k to scroll halfpage
nnoremap <C-j> <C-d>
nnoremap <C-k> <C-u>
nnoremap <C-l> <space>
vnoremap <C-j> <C-d>
vnoremap <C-k> <C-u>
" Insert digraph
inoremap <C-p> <C-k>
" Autocompletion scroll
inoremap <C-j> <C-n>
inoremap <C-k> <C-p>
"Move cursor with Alt-hjkl
inoremap <expr> <M-h> pumvisible() ? deoplete#mappings#smart_close_popup() : "\<Left>"
inoremap <M-l> <Right>
cnoremap <M-h> <Left>
cnoremap <M-l> <Right>
cnoremap <M-j> <Down>
cnoremap <M-k> <Up>
cnoremap <C-n> <Down>
cnoremap <C-p> <Up>
" Exit to normal mode in Terminal
tnoremap <C-]> <C-\><C-n>
" Windows manipulations
nnoremap <M-q> <C-w>c
nnoremap <M-o> <C-w>o
nnoremap <M-w> <C-w>w
nnoremap <M-d> :bd<CR>
" Toggle foldcolumn
nnoremap cof :set <C-R>=&foldcolumn ? 'foldcolumn=0' : 'foldcolumn=1'<CR><CR>

" Show Syntax name for element under the cursor
function! s:synnames(...) abort
  if a:0
    let [line, column] = [a:1, a:2]
  else
    let [line, column] = [line('.'), col('.')]
  endif
  return reverse(map(synstack(line, column), 'synIDattr(v:val,"name")'))
endfunction

function! s:syncount(count)
  if a:count
    let name = get(s:synnames(), a:count-1, '')
    if name !=# ''
      return 'syntax list '.name
    endif
  else
    echo join(s:synnames(), ' ')
  endif
  return ''
endfunction

nnoremap <silent> <Plug>ScripteaseSynnames :<C-U>exe <SID>syncount(v:count)<CR>
nmap <F8> <Plug>ScripteaseSynnames

" Toggle Location and QuickFix lists
function! s:GetBufferList()
  redir =>buflist
  silent! ls
  redir END
  return buflist
endfunction

function! ToggleLocationList()
  let winnr = winnr()
  let prevwinnr = winnr("#")
  let curbufnr = winbufnr(0)
  for bufnum in map(filter(split(s:GetBufferList(), '\n'), 'v:val =~ "Location List"'),
        \ 'str2nr(matchstr(v:val, "\\d\\+"))')
    if curbufnr == bufnum
      exec prevwinnr . "wincmd w"
      lclose
      return
    endif
  endfor
  try
    botright lopen
    if &ft == 'qf'
      silent file LocationList
    endif
  catch /E776/
      echohl WarningMsg
      echo "Location List is Empty."
      echohl None
      return
  endtry
endfunction

function! ToggleQuickfixList()
  let winnr = winnr()
  let prevwinnr = winnr("#")
  for bufnum in map(filter(split(s:GetBufferList(), '\n'), 'v:val =~ "Quickfix List"'),
        \ 'str2nr(matchstr(v:val, "\\d\\+"))')
    if bufwinnr(bufnum) != -1
      exec prevwinnr . "wincmd w"
      cclose
      return
    endif
  endfor
    botright copen
endfunction
nmap <script> <silent> <M-3> :call ToggleLocationList()<CR>
nmap <script> <silent> <M-2> :call ToggleQuickfixList()<CR>

" Remove all scratch buffers
function! RemoveScratch()
  for bufnum in map(filter(split(s:GetBufferList(), '\n'), 'v:val =~ "Scratch"'),
        \ 'str2nr(matchstr(v:val, "\\d\\+"))')
    execute 'bwipeout' bufnum
  endfor
  echohl MoreMsg
  echo "Scratch buffers were removed."
  echohl None
endfunction
nmap <script> <silent> <F4> :call RemoveScratch()<CR>
