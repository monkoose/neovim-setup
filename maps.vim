set pastetoggle=<F2>
nmap     <silent>  <F3>        :setlocal spell!<CR>
nmap     <silent>  <space>/    :nohlsearch<CR>
nmap               <M-w>       <Plug>WinSwitch
nmap               <M-f>       <Plug>InsertSemicolon
nmap               <Esc>       <Plug>CloseFloat
nmap               <C-n>       <Plug>ScrollFltPvwDownOrNextHunk
nmap               <C-p>       <Plug>ScrollFltPvwUpOrPrevHunk
nmap               <M-2>       <Plug>ToggleQuickfix
nmap               <M-3>       <Plug>ToggleLocationList
nmap               gx          <Plug>OpenPath
noremap!           <C-space>   <C-^>
nnoremap           <space>q    :pclose<CR>
nnoremap <silent>  <space>a    :b#<CR>
nnoremap           <space>d    <C-]>
nnoremap           <space>y    "+y
nnoremap           <space>pp   "+p
nnoremap           <C-j>       <C-d>
nnoremap           <C-k>       <C-u>
nnoremap           <C-l>       <space>
nnoremap           <M-q>       <C-w>c
nnoremap           <M-o>       <C-w>o
nnoremap           yof         :set foldcolumn=<C-R>=!&foldcolumn<CR><CR>
nnoremap <silent>  yoy         :let &cc = &cc == '' ? 100 : ''<CR>
nnoremap <silent>  <C-space>   :set iminsert=<C-R>=!&iminsert<CR><CR>

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
tnoremap <silent>  <M-q>       <C-\><C-n>:close!<CR>

command! SudoWrite write !sudo tee > /dev/null %

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
    if getwininfo(win_getid())[0].terminal
      startinsert
    endif
endfunction
nnoremap <silent> <Plug>WinSwitch :call <SID>WindowSwitch()<CR>
"}}}
" PreviewWindowNr() {{{
function! s:PreviewWindowNr(winnrs) abort
  for nr in a:winnrs
    if getwinvar(nr, '&pvw')
      return nr
    endif
  endfor
  return 0
endfunction
"}}}
" FloatWindowNr() {{{
function! s:FloatWindowNr(winnrs) abort
  " return last one opened float first
  for nr in reverse(a:winnrs)
    if nvim_win_get_config(win_getid(nr)).relative != ''
      return nr
    endif
  endfor
  return 0
endfunction
"}}}
" CloseFloatWindow() {{{
function! s:CloseFloatWindow() abort
  let winnr = s:FloatWindowNr(range(1, winnr('$')))
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
  let winnrs = range(1, winnr('$'))
  let float_win_nr = s:FloatWindowNr(winnrs)
  let winnr = float_win_nr ? float_win_nr : s:PreviewWindowNr(winnrs)
  let curr_win = winnr()
  if winnr != 0
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

let ScrollDownNextHunk = function('s:CmdFloatPvwOrCurrWin', ["normal! 3\<C-e>", "normal ]c"])
let ScrollUpPrevHunk   = function('s:CmdFloatPvwOrCurrWin', ["normal! 3\<C-y>", "normal [c"])
nnoremap <silent> <Plug>ScrollFltPvwDownOrNextHunk :call ScrollDownNextHunk()<CR>
nnoremap <silent> <Plug>ScrollFltPvwUpOrPrevHunk :call ScrollUpPrevHunk()<CR>
"}}}
" insert ; at the end of a line if there is none {{{
function! s:InsertSemiColon() abort
  if match(getline('.'), ';\_$') == -1
    execute 'keepp s/\(.*\)/\1;/'
  else
    execute 'keepp s/;\_$//'
  endif
  normal ``
endfunction
nnoremap <silent> <Plug>InsertSemicolon :call <SID>InsertSemiColon()<CR>
"}}}
" vim: foldmethod=marker:
