" map leader to ,
let mapleader = ','
" backward search
nnoremap \ ,
" disable search highlighting
nmap <silent> <leader>/ :nohlsearch<CR>
" let Ctrl-l to delete forward char
inoremap <C-l> <Del>
" switch between two buffers
nnoremap <space>a <C-^>

" Paste and Spell toggle
set pastetoggle=<F2>
nmap <silent> <F3> :setlocal spell!<CR>

" UPPER/lower entire word
nnoremap <leader>U mQviwU`Q
nnoremap <leader>u mQviwu`Q

" CTRL-SPACE monster key(expand/close CtrlP in normal mode, else change keymap)
map! <C-space> <C-^>
nmap <expr><C-space> expand('%:t') == 'ControlP' ? "\<C-c>" : ":CtrlPBuffer<CR>"

" Yank and Paste clipboard
nnoremap <space>y "+y
vnoremap <space>y "+y
nnoremap <space>p "+p
vnoremap <space>p "+p

nnoremap <space>f <C-]>
nmap <space><space> <Plug>(easymotion-s)

nnoremap <C-j> <C-d>
nnoremap <C-k> <C-u>
nnoremap <C-l> <space>
vnoremap <C-j> <C-d>
vnoremap <C-k> <C-u>
" Insert digraph
inoremap <C-p> <C-k>
inoremap <C-j> <C-n>
inoremap <C-k> <C-p>
"Move cursor with Alt-hjkl
inoremap <expr><M-h> pumvisible() ? deoplete#mappings#smart_close_popup() : "\<Left>"
inoremap <M-l> <Right>
nnoremap <M-h> <Left>
nnoremap <M-l> <Right>
nnoremap <M-j> <Down>
nnoremap <M-k> <Up>
cnoremap <M-h> <Left>
cnoremap <M-l> <Right>
cnoremap <M-j> <Down>
cnoremap <M-k> <Up>
cnoremap <C-n> <Down>
cnoremap <C-p> <Up>

" Exit to normal mode in Terminal
tnoremap <C-]> <C-\><C-n>

" Fugitive Gstatus
noremap <leader>g :Gstatus<Cr>

" Windows manipulations
nnoremap <M-q> <C-w>c
nnoremap <M-o> <C-w>o
nnoremap <M-w> <C-w>w
nnoremap <M-d> :bd<CR>

" Show Syntax name for element under the cursor
function! s:synnames(...) abort
  if a:0
    let [line, col] = [a:1, a:2]
  else
    let [line, col] = [line('.'), col('.')]
  endif
  return reverse(map(synstack(line, col), 'synIDattr(v:val,"name")'))
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
