set pastetoggle=<F2>
nmap     <silent>  <F3>        :setlocal spell!<CR>
nmap     <silent>  <space>/    :nohlsearch<CR>
nmap               <F8>        <Plug>ScripteaseSynnames
nmap               <M-w>       <Plug>WinSwitch
nmap               <M-f>       <Plug>InsertSemicolon
nmap               <Esc>       <Plug>CloseFloat
nmap               <C-n>       <Plug>ScrollFltPvwDownOrNextChunk
nmap               <C-p>       <Plug>ScrollFltPvwUpOrPrevChunk
nmap               <M-2>       <Plug>ToggleQuickfix
nmap               <M-3>       <Plug>ToggleLocationList
nmap               gx          <Plug>OpenPath
noremap!           <C-space>   <C-^>
nnoremap           <space>q    :pclose<CR>
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

" OpenPath() {{{
function! s:OpenPath(path) abort
  silent! execute '!xdg-open "' .. a:path .. '" &> /dev/null &'
  redraw!
  echohl String
  echo "Open "
  echohl Identifier
  echon expand(a:path)
  echohl None
endfunction
nnoremap <silent> <Plug>OpenPath :call <SID>OpenPath('<cfile>')<CR>
"}}}
" Toggle Location and QuickFix lists {{{
function! s:ToggleLocList() abort
  let is_loclist = getwininfo(win_getid())[0].loclist
  if is_loclist
    exec winnr('#') .. "wincmd w"
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
        exec winnr('#') .. "wincmd w"
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
" WinNrForWinVar() {{{
function! s:WinNrForWinVar(win_var) abort
  for nr in range(1, winnr('$'))
    if getwinvar(nr, a:win_var)
      return nr
    endif
  endfor
  return 0
endfunction
"}}}
" CloseFloatWindow() {{{
function! s:CloseFloatWindow() abort
  let winnr = s:WinNrForWinVar('float')
  if winnr
    execute winnr .. "close"
  else
    execute "normal! \<Esc>"
  endif
endfunction
nnoremap <silent> <Plug>CloseFloat :call <SID>CloseFloatWindow()<CR>
"}}}
" scroll preview or float windows or jump to git changes {{{
function! s:CmdFloatPvwOrCurrWin(cmd, curr_cmd) abort
  let winnr = s:WinNrForWinVar('float') ? s:WinNrForWinVar('float') : s:WinNrForWinVar('&pvw')
  let curr_win = winnr()
  if winnr
    try
      execute winnr .. "wincmd w"
      execute a:cmd
    finally
      execute curr_win .. "wincmd w"
    endtry
  else
    execute a:curr_cmd
  endif
endfunction

let g:maps_scroll_down = "normal! 3\<C-e>"
let g:maps_scroll_up = "normal! 3\<C-y>"
let g:maps_next_chunk = "normal \<Plug>(coc-git-nextchunk)"
let g:maps_prev_chunk = "normal \<Plug>(coc-git-prevchunk)"
nnoremap <silent> <Plug>ScrollFltPvwDownOrNextChunk :call <SID>CmdFloatPvwOrCurrWin(g:maps_scroll_down, g:maps_next_chunk)<CR>
nnoremap <silent> <Plug>ScrollFltPvwUpOrPrevChunk :call <SID>CmdFloatPvwOrCurrWin(g:maps_scroll_up, g:maps_prev_chunk)<CR>
"}}}
" insert ; at the end of a line if there is none {{{
function! s:InsertSemiColon() abort
  if match(getline('.'), ';\_$') == -1
    execute 'keepp s/\(.*\)/\1;/'
  else
    execute 'keepp s/;\_$//'
  endif
endfunction
nnoremap <silent> <Plug>InsertSemicolon :call <SID>InsertSemiColon()<CR>
"}}}
" show Syntax highlight group for element under the cursor {{{
function! s:Synnames(...) abort
  if a:0
    let [line, column] = [a:1, a:2]
  else
    let [line, column] = [line('.'), col('.')]
  endif
  return reverse(map(synstack(line, column), 'synIDattr(v:val,"name")'))
endfunction
function! s:Syncount(count)
  if a:count
    let name = get(s:Synnames(), a:count - 1, '')
    if name !=# ''
      return 'syntax list ' .. name
    endif
  else
    echo join(s:Synnames(), ' ')
  endif
  return ''
endfunction
nnoremap <silent> <Plug>ScripteaseSynnames :call <SID>Syncount(v:count)<CR>
"}}}
" vim: foldmethod=marker:
