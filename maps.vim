set pastetoggle=<F2>
map Q gq
inoremap <C-u> <C-g>u<C-u>
nnoremap <silent>  <F3>        <Cmd>setlocal spell!<CR>
nnoremap <silent>  <space>/    <Cmd>nohlsearch<CR>
nnoremap           <M-w>       <C-w>w
nnoremap <silent>  <M-f>       <Cmd>call <SID>InsertSemiColon()<CR>
nnoremap <silent>  <Esc>       <Cmd>call <SID>CloseFloatWindow()<CR>
nnoremap <silent>  <C-n>       <Cmd>call <SID>ScrollDownNextHunk()<CR>
nnoremap <silent>  <C-p>       <Cmd>call <SID>ScrollUpPrevHunk()<CR>
nnoremap <silent>  <M-2>       <Cmd>call <SID>ToggleQf()<CR>
nnoremap <silent>  <M-3>       <Cmd>call <SID>ToggleLocList()<CR>
nnoremap <silent>  gx          <Cmd>call <SID>OpenPath(expand('<cfile>'))<CR>
nnoremap <silent>  zS          <Cmd>call <SID>SynNames()<CR>
nnoremap           <space>q    <Cmd>pclose<CR>
nnoremap <silent>  <space>a    <Cmd>b#<CR>
nnoremap           <space>d    <C-]>
nnoremap           <space>y    "+y
nnoremap           <space>p    "+
nnoremap           <C-j>       <C-d>
nnoremap           <C-k>       <C-u>
nnoremap <silent>  H           <Cmd>bn<CR>
nnoremap <silent>  L           <Cmd>bp<CR>
nnoremap           <M-q>       <C-w>c
nnoremap           <M-o>       <C-w>o
nnoremap <silent>  yof         <Cmd>let &foldcolumn = !&foldcolumn<CR>
nnoremap <silent>  yoy         <Cmd>let &cc = &cc == '' ? 100 : ''<CR>
nnoremap <silent>  <C-space>   <Cmd>let &iminsert = !&iminsert<CR>
nnoremap           ;           :
nnoremap           <C-h>       ,
nnoremap           <C-l>       ;

vnoremap           <space>y    "+y
vnoremap           <C-j>       <C-d>
vnoremap           <C-k>       <C-u>
vnoremap           ;           :
vnoremap           <C-h>       ,
vnoremap           <C-l>       ;

noremap!           <C-space>   <C-^>
inoremap           <M-h>       <Left>
inoremap           <M-l>       <Right>
inoremap           <M-f>       <DEL>

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

" Show syntax names {{{
function! s:SynNames() abort
  let synlist = reverse(map(synstack(line('.'), col('.')), 'synIDattr(v:val,"name")'))
  echo ' ' .. join(synlist, ' ')
endfunction
"}}}
" TTime count command {{{
" usage :TTime `times to execute` `any vim command`
" example :TTime 300 call str2nr('3')
function! s:Timer(arg) abort
  let [times; cmd] = split(a:arg)
  let cmd = join(cmd)
  let time = reltime()
  try
    for i in range(times)
      execute cmd
    endfor
  finally
    let result = reltimestr(reltime(time))
    echomsg matchstr(reltimestr(reltime(time)), '.*\..\{,4\}') .. ' seconds to run :' .. cmd
  endtry
  return ''
endfunction
command! -nargs=1 -complete=command TTime execute s:Timer(<q-args>)
"}}}
" OpenPath() {{{
function! s:OpenPath(path) abort
  call jobstart(['xdg-open', a:path])
  redraw
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
