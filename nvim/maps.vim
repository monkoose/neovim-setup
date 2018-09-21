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
nmap <space>fg :FzfGFiles!?<CR>
nmap <space>ft :FzfBTags<CR>
nmap <space>fa :FzfTags<CR>
nmap <space>fc :FzfCommits!<CR>
nmap <space>fb :FzfBCommits!<CR>
nmap <space>fm :FzfMarks<CR>
nmap <space>ss :FzfMyAg!<CR>
nmap <space>sb :FzfBLines<CR>
nmap <space>sl :FzfLines<CR>

" Scroll preview window or jump to changes in file
function! ScrollPreviewDownOrJumpToNextHunk()
  if s:previewWindowOpened()
    exec "normal! \<C-w>P3\<C-e>\<C-w>p"
  else
    exec "normal ]c"
  endif
endfunction
function! ScrollPreviewUpOrJumpToPreviousHunk()
  if s:previewWindowOpened()
    exec "normal! \<C-w>P3\<C-y>\<C-w>p"
  else
    exec "normal [c"
  endif
endfunction
nnoremap <silent> <C-n> :call ScrollPreviewDownOrJumpToNextHunk()<CR>
nnoremap <silent> <C-p> :call ScrollPreviewUpOrJumpToPreviousHunk()<CR>
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
tnoremap <F1> <C-\><C-n>
tnoremap <M-w> <C-\><C-n><C-w>w
" Windows manipulations
nnoremap <M-q> <C-w>c
nnoremap <M-o> <C-w>o

" Switch windows with Alt+w if it is terminal buffer then enter insert mode too
function! s:windowswitch() abort
    wincmd w
    if &ft == 'neoterm' || &ft == 'terminal'
      startinsert
    endif
endfunction
nnoremap <silent> <Plug>WindowSwitch :call <SID>windowswitch()<CR>
nmap <M-w> <Plug>WindowSwitch

" Easy-align
vmap <Enter> <Plug>(EasyAlign)
" Toggle foldcolumn
nnoremap yof :set <C-R>=&foldcolumn ? 'foldcolumn=0' : 'foldcolumn=1'<CR><CR>
nnoremap <silent>yoy :let &cc = &cc == '' ? '80' : ''<CR>

"Ale autofix
noremap <space>fi <Plug>(ale_fix)

" Insert ; at the end of a line if there is none
function! s:insert_dot_comma() abort
  let column = col('.')
  exec "normal $"
  if matchstr(getline('.'), '\%' . col('.') . 'c.') != ';'
    exec "normal a;"
  else
    exec "normal x"
  endif
  call cursor(line('.'), column)
endfunction
nnoremap <silent> <Plug>InsertDotComma :call <SID>insert_dot_comma()<CR>
nmap <M-f> <Plug>InsertDotComma

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

nnoremap <silent> <Plug>ScripteaseSynnames :call <SID>syncount(v:count)<CR>
nmap <F8> <Plug>ScripteaseSynnames

" Toggle Location and QuickFix lists
function! s:GetBufferList()
  redir =>buflist
  silent! ls
  redir END
  return buflist
endfunction

function! s:toggle_location_list()
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
      echo "Location List is empty"
      echohl None
      return
  endtry
endfunction

function! s:toggle_quickfix_list()
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
nnoremap <script> <silent> <Plug>ToggleQuickfixList :call <SID>toggle_quickfix_list()<CR>
nnoremap <script> <silent> <Plug>ToggleLocationList :call <SID>toggle_location_list()<CR>
nmap <M-2> <Plug>ToggleQuickfixList
nmap <M-3> <Plug>ToggleLocationList

function! s:previewWindowOpened()
  for nr in range(1, winnr('$'))
    if getwinvar(nr, "&pvw") == 1
      " found a preview
      return 1
    endif
  endfor
  return 0
endfunction

" Close preview window
function! s:closePreviewWindow()
  if s:previewWindowOpened()
    pclose
  else
    echo "There is no Preview window"
  endif
endfunction
nnoremap <script> <silent> <Plug>ClosePreviewWindow :call <SID>closePreviewWindow()<CR>
nmap q <Plug>ClosePreviewWindow
nnoremap Q q
