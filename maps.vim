set pastetoggle=<F2>
nmap     <silent>  <F3>        :setlocal spell!<CR>
nmap     <silent>  <space>/    :nohlsearch<CR>
nmap               <M-w>       <C-w>w
nmap     <silent>  <M-f>       :call <SID>InsertSemiColon()<CR>
nmap     <silent>  <Esc>       :call <SID>CloseFloatWindow()<CR>
nmap     <silent>  <C-n>       :call <SID>ScrollDownNextHunk()<CR>
nmap     <silent>  <C-p>       :call <SID>ScrollUpPrevHunk()<CR>
nmap     <silent>  <M-2>       :call <SID>ToggleQf()<CR>
nmap     <silent>  <M-3>       :call <SID>ToggleLocList()<CR>
nmap     <silent>  gx          :call <SID>OpenPath('<cfile>')<CR>
nnoremap           <space>q    :pclose<CR>
nnoremap <silent>  <space>a    :b#<CR>
nnoremap           <space>d    <C-]>
nnoremap           <space>y    "+y
nnoremap           <space>p    "+
nnoremap           <C-j>       <C-d>
nnoremap           <C-k>       <C-u>
nnoremap <silent>  H           :bn<CR>
nnoremap <silent>  L           :bp<CR>
nnoremap           <M-q>       <C-w>c
nnoremap           <M-o>       <C-w>o
nnoremap <silent>  yof         :let &foldcolumn = !&foldcolumn<CR>
nnoremap <silent>  yoy         :let &cc = &cc == '' ? 100 : ''<CR>
nnoremap <silent>  <C-space>   :let &iminsert = !&iminsert<CR>
nnoremap           ;           :
nnoremap           <C-h>       ,
nnoremap           <C-l>       ;

vnoremap           <space>y    "+y
vnoremap           <C-j>       <C-d>
vnoremap           <C-k>       <C-u>
vnoremap           ;           :
vnoremap           H           ,
vnoremap           L           ;

noremap!           <C-space>   <C-^>
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

function! s:ScrollDownNextHunk() abort
  call s:CmdFloatPvwOrCurrWin("normal! 3\<C-e>", "normal ]c")
endfunction

function! s:ScrollUpPrevHunk() abort
  call s:CmdFloatPvwOrCurrWin("normal! 3\<C-y>", "normal [c")
endfunction
"}}}
" insert ; at the end of a line if there is none {{{
function! s:InsertSemiColon() abort
  let view = winsaveview()
  if match(getline('.'), ';\_$') == -1
    execute 'keepp s/\_$/;/'
  else
    execute 'keepp s/;\_$//'
  endif
  call winrestview(view)
endfunction
"}}}
" vim: foldmethod=marker
