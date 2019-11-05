set pastetoggle=<F2>
nmap     <silent>  <F3>        :setlocal spell!<CR>
nmap     <silent>  <space>/    :nohlsearch<CR>
nmap               <F8>        <Plug>ScripteaseSynnames
nmap               <M-w>       <Plug>WinSwitch
nmap               <M-f>       <Plug>InsertDotComma
nmap               <Esc>       <Plug>ClosePF
nmap               <C-n>       <Plug>ScrollOrJumpDown
nmap               <C-p>       <Plug>ScrollOrJumpUp
nmap               <M-2>       <Plug>ToggleQuickfix
nmap               <M-3>       <Plug>ToggleLocationList
noremap!           <C-space>   <C-^>
nnoremap           <space>a    <C-^>
nnoremap           <space>d    <C-]>
nnoremap           <space>U    mQviwU`Q
nnoremap           <space>u    mQviwu`Q
nnoremap           <space>y    "+y
nnoremap           <space>pp   "+p
nnoremap           <C-j>       <C-d>
nnoremap           <C-k>       <C-u>
nnoremap           <C-l>       <space>
nnoremap           <M-q>       <C-w>c
nnoremap           <M-o>       <C-w>o
nnoremap           yof         :set <C-R>=&foldcolumn ? 'foldcolumn=0' : 'foldcolumn=1'<CR><CR>
nnoremap <silent>  yoy         :let &cc = &cc == '' ? &textwidth + 1 : ''<CR>
nnoremap <silent>  <C-space>   :set <C-R>=&iminsert ? 'iminsert=0' : 'iminsert=1'<CR><CR>

vnoremap           <space>y    "+y
vnoremap           <space>pp   "+p
vnoremap           <C-j>       <C-d>
vnoremap           <C-k>       <C-u>

inoremap           <C-p>       <C-k>
inoremap           <C-j>       <C-n>
inoremap           <C-k>       <C-p>
inoremap           <C-l>       <DEL>
inoremap           <M-h>       <Left>
inoremap           <M-l>       <Right>

cnoremap           <C-n>       <Down>
cnoremap           <C-p>       <Up>
cnoremap           <C-j>       <C-n>
cnoremap           <C-k>       <C-p>
cnoremap           <M-h>       <Left>
cnoremap           <M-l>       <Right>

tnoremap           <F1>        <C-\><C-n>
tnoremap           <C-]>       <C-\><C-n>
tnoremap           <M-w>       <C-\><C-n><C-w>w

" Toggle Location and QuickFix lists {{{
function! s:ToggleLocList() abort
  let is_loclist = getwininfo(win_getid())[0].loclist
  if is_loclist
    exec winnr('#') . "wincmd w"
    lclose
    return
  endif
  try
    lopen
  catch /E776/
      echohl WarningMsg
      echo "Location List is empty"
      echohl None
      return
  endtry
endfunction

function! s:ToggleQf() abort
  let is_qf = getwininfo(win_getid())[0].quickfix
  for win in getwininfo()
    if win.quickfix && !win.loclist
      if is_qf
        exec winnr('#') . "wincmd w"
      endif
      cclose
      return
    endif
  endfor
  botright copen
endfunction
nnoremap <script><silent> <Plug>ToggleQuickfix :call <SID>ToggleQf()<CR>
nnoremap <script><silent> <Plug>ToggleLocationList :call <SID>ToggleLocList()<CR>
"}}}
" WindowSwitch() {{{
function! s:WindowSwitch() abort
    wincmd w
    if &ft == 'neoterm' || &ft == 'terminal'
      startinsert
    endif
endfunction
nnoremap <silent> <Plug>WinSwitch :call <SID>WindowSwitch()<CR>
"}}}
" PreviewOrFloat() {{{
function! s:PreviewOrFloat() abort
  for nr in range(1, winnr('$'))
    if getwinvar(nr, 'float')
      return nr
    elseif getwinvar(nr, '&pvw')
      return -1
    endif
  endfor
  return 0
endfunction
"}}}
" ClosePvwOrFloat() {{{
function! s:ClosePvwOrFloat() abort
  let winnr = s:PreviewOrFloat()
  if winnr
    execute winnr . "close"
  elseif winnr == -1
    execute "pclose"
  else
    execute "normal! \<Esc>"
  endif
endfunction
nnoremap <silent> <Plug>ClosePF :call <SID>ClosePvwOrFloat()<CR>
"}}}
" scroll preview or float windows or jump to git changes {{{
function! s:ScrollPvwOrFloatDownOrJumpToNextHunk() abort
  let winnr = s:PreviewOrFloat()
  if winnr == -1
    execute "normal! \<C-w>P"
    try
      execute "normal! 3\<C-e>"
    finally
      execute "normal! \<C-w>p"
    endtry
  elseif winnr
    let curr_win = winnr()
    execute winnr . "wincmd w"
    try
      execute "normal! 3\<C-e>"
    finally
      execute curr_win . "wincmd w"
    endtry
  else
    execute "normal \<Plug>(coc-git-nextchunk)"
  endif
endfunction
nnoremap <silent> <Plug>ScrollOrJumpDown :call <SID>ScrollPvwOrFloatDownOrJumpToNextHunk()<CR>

function! s:ScrollPvwOrFloatUpOrJumpToPreviousHunk() abort
  let winnr = s:PreviewOrFloat()
  if winnr == -1
    execute "normal! \<C-w>P"
    try
      execute "normal! 3\<C-y>"
    finally
      execute "normal! \<C-w>p"
    endtry
  elseif winnr
    let curr_win = winnr()
    execute winnr . "wincmd w"
    try
      execute "normal! 3\<C-y>"
    finally
      execute curr_win . "wincmd w"
    endtry
  else
    exec "normal \<Plug>(coc-git-prevchunk)"
  endif
endfunction
nnoremap <silent> <Plug>ScrollOrJumpUp :call <SID>ScrollPvwOrFloatUpOrJumpToPreviousHunk()<CR>
"}}}
" insert ; at the end of a line if there is none {{{
function! s:insertDotComma() abort
  let column = col('.')
  exec "normal! $"
  if matchstr(getline('.'), '\%' . col('.') . 'c.') != ';'
    exec "normal! a;"
  else
    exec "normal! x"
  endif
  call cursor(line('.'), column)
endfunction
nnoremap <silent> <Plug>InsertDotComma :call <SID>insertDotComma()<CR>
"}}}
" show Syntax highlight group for element under the cursor {{{
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
"}}}
" vim: foldmethod=marker:
