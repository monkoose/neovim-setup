set   pastetoggle=<F2>
nmap <silent>     <F3>          :setlocal spell!<CR>
nmap              <F8>          <Plug>ScripteaseSynnames
nmap <silent>     <space>/      :nohlsearch<CR>
nnoremap <silent> <C-space>     :set <C-R>=&iminsert ? 'iminsert=0' : 'iminsert=1'<CR><CR>
noremap!          <C-space>     <C-^>
nnoremap          <space>a      <C-^>
nnoremap          <space>d      <C-]>
nnoremap          <space>U      mQviwU`Q
nnoremap          <space>u      mQviwu`Q
nnoremap          <space>y      "+y
nnoremap          <space>pp     "+p
nnoremap          <C-j>         <C-d>
nnoremap          <C-k>         <C-u>
nnoremap          <C-l>         <space>
nnoremap <silent> <C-n>         :call ScrollPreviewDownOrJumpToNextHunk()<CR>
nnoremap <silent> <C-p>         :call ScrollPreviewUpOrJumpToPreviousHunk()<CR>
nnoremap          <M-q>         <C-w>c
nnoremap          <M-o>         <C-w>o
nmap              <M-w>         <Plug>WindowSwitch
nmap              <M-f>         <Plug>InsertDotComma
nnoremap          yof           :set <C-R>=&foldcolumn ? 'foldcolumn=0' : 'foldcolumn=1'<CR><CR>
nnoremap <silent> yoy           :let &cc = &cc == '' ? '80' : ''<CR>
nmap <expr> <silent>   <Esc>    <SID>isPreviewWindow() ? ":pclose\<CR>" : "\<Esc>"

vnoremap          <space>y      "+y
vnoremap          <space>pp     "+p
vnoremap          <C-j>         <C-d>
vnoremap          <C-k>         <C-u>

inoremap          <C-p>         <C-k>
inoremap          <C-j>         <C-n>
inoremap          <C-k>         <C-p>
inoremap          <C-l>         <DEL>
inoremap          <M-h>         <Left>
inoremap          <M-l>         <Right>

cnoremap          <C-n>         <Down>
cnoremap          <C-p>         <Up>
cnoremap          <C-j>         <C-n>
cnoremap          <C-k>         <C-p>
cnoremap          <M-h>         <Left>
cnoremap          <M-l>         <Right>

tnoremap          <F1>          <C-\><C-n>
tnoremap          <C-]>         <C-\><C-n>
tnoremap          <M-w>         <C-\><C-n><C-w>w

" windowSwitch() {{{
function! s:windowSwitch() abort
    wincmd w
    if &ft == 'neoterm' || &ft == 'terminal'
      startinsert
    endif
endfunction
nnoremap <silent> <Plug>WindowSwitch :call <SID>windowSwitch()<CR>
"}}}
" isPreviewWindow() {{{
function! s:isPreviewWindow()
  for nr in range(1, winnr('$'))
    if getwinvar(nr, "&pvw") == 1
      return 1
    endif
  endfor
  return 0
endfunction
"}}}
" scroll *preview* window or jump to vcs changes in the file {{{
function! ScrollPreviewDownOrJumpToNextHunk()
  if s:isPreviewWindow()
    exec "normal! \<C-w>P3\<C-e>\<C-w>p"
  else
    exec "normal \<Plug>(coc-git-nextchunk)"
  endif
endfunction
function! ScrollPreviewUpOrJumpToPreviousHunk()
  if s:isPreviewWindow()
    exec "normal! \<C-w>P3\<C-y>\<C-w>p"
  else
    exec "normal \<Plug>(coc-git-prevchunk)"
  endif
endfunction
"}}}
" insert ; at the end of a line if there is none {{{
function! s:insertDotComma() abort
  let column = col('.')
  exec "normal $"
  if matchstr(getline('.'), '\%' . col('.') . 'c.') != ';'
    exec "normal a;"
  else
    exec "normal x"
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
