Plug 'monkoose/fzf.nvim'

let s:fzf_big_float = 'call fzf#floating(36, 140)'
let s:fzf_defaults = [
      \ '--bind="alt-t:toggle-preview,ctrl-n:preview-page-down,ctrl-p:preview-page-up,ctrl-l:accept,' .
          \ 'ctrl-r:clear-screen,alt-p:next-history,alt-n:previous-history,ctrl-alt-j:page-down,ctrl-alt-k:page-up"',
      \ '--color=hl:#608bbf,fg+:#b8af96,hl+:#608bbf,bg+:#3b312b,border:#40362f,gutter:#272e22,pointer:#d35b4b,prompt:#c57c41,marker:#b2809f,info:#70a17c',
      \ '--layout=reverse --tabstop=2 --info=inline --margin=1,3 --exact'
      \ ]
let $FZF_DEFAULT_OPTS = join(s:fzf_defaults, " ")
let g:fzf_history_dir = '~/.local/share/nvim/fzf-history'
let g:fzf_command_prefix = 'Fzf'
command! -nargs=* FzfSearch call fzf#vim#ag(<q-args>, fzf#vim#with_preview({'window': s:fzf_big_float}, 'up:60%:wrap' ))
command! -nargs=* FzfGFiles call fzf#vim#gitfiles(<q-args>, {'options': '--preview-window up:60%', 'window': s:fzf_big_float})
command! FzfCommits call fzf#vim#commits({'options': '--preview-window up:60%', 'window': s:fzf_big_float})
command! FzfBCommits call fzf#vim#buffer_commits({'options': '--preview-window up:60%', 'window': s:fzf_big_float})

augroup FzfMapsAu
  autocmd!
  autocmd FileType fzf tnoremap <M-q> <Esc>
augroup END

" Open QuickFix with marked items from fzf
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

nmap <silent>    <space>;        :FzfBuffers<CR>
nmap <silent>    <space>ff       :FzfFiles<CR>
nmap <silent>    <space>fg       :FzfGFiles?<CR>
nmap <silent>    <space>fc       :FzfCommits<CR>
nmap <silent>    <space>fb       :FzfBCommits<CR>
nmap <silent>    <space>fm       :FzfHistory<CR>
nmap <silent>    <space>fk       :FzfMaps<CR>
nmap <silent>    <space>ss       :FzfSearch<CR>
nmap <silent>    <space>sb       :FzfBLines<CR>
nmap <silent>    <space>sl       :FzfLines<CR>
"nmap <silent>    <space>ft     :FzfBTags<CR>
" nmap <silent>    <space>fa     :FzfTags<CR>

augroup HoogleMaps
  autocmd!
  autocmd FileType haskell nnoremap <buffer>   <space>hh :Hoogle <c-r>=expand("<cword>")<CR><CR>
augroup END

command! FzfLocationList call s:location_list()
function! s:location_list_to_grep(v) abort
  return bufname(a:v.bufnr) . ':' . a:v.lnum . ':' . a:v.col . ':' . a:v.text
endfunction
function! s:open_location_item(e) abort
  let line = a:e
  let filename = fnameescape(split(line, ':\d\+:')[0])
  let linenr = matchstr(line, ':\d\+:')[1:-2]
  let colum = matchstr(line, '\(:\d\+\)\@<=:\d\+:')[1:-2]
  exe 'e ' . filename
  call cursor(linenr, colum)
endfunction
function! s:location_list() abort
  let s:source = 'location_list'
  function! s:get_location_list() abort
    return map(getloclist(0), 's:location_list_to_grep(v:val)')
  endfunction
  call fzf#run(fzf#wrap('location_list', {
        \ 'source':  reverse(<sid>get_location_list()),
        \ 'sink':    function('s:open_location_item'),
        \ 'options': '--reverse',
        \ }))
endfunction

command! FzfQuickfix call s:quickfix()
function! s:open_quickfix_item(e) abort
  let line = a:e
  let filename = fnameescape(split(line, ':\d\+:')[0])
  let linenr = matchstr(line, ':\d\+:')[1:-2]
  let colum = matchstr(line, '\(:\d\+\)\@<=:\d\+:')[1:-2]
  exe 'e ' . filename
  call cursor(linenr, colum)
endfunction
function! s:quickfix_to_grep(v) abort
  return bufname(a:v.bufnr) . ':' . a:v.lnum . ':' . a:v.col . ':' . a:v.text
endfunction
function! s:quickfix() abort
  let s:source = 'quickfix'
  function! s:quickfix_list() abort
    return map(getqflist(), 's:quickfix_to_grep(v:val)')
  endfunction
  call fzf#run(fzf#wrap('quickfix', {
        \ 'source':  reverse(<sid>quickfix_list()),
        \ 'sink':    function('s:open_quickfix_item'),
        \ 'options': '--reverse',
        \ }))
endfunction

command! FzfJumps call s:Jumps()

function! s:OpenBuf(e) abort
  let list = split(a:e)
  if len(list) < 4
    return
  endif

  let [linenr, col, path] = [list[1], list[2]+1, join(list[3:])]
  if !filereadable(expand(path))
    if bufname('%') == ''
      return
    endif
    let path = bufname('%')
  endif

  exe 'e ' .. path
  call cursor(linenr, col)
endfunction

function! s:Jumps() abort
  let lines = split(execute('jumps'), '\n')
  call fzf#run(fzf#wrap('jumps', {
        \   'source':  reverse(lines[1:len(lines) - 2]),
        \   'sink':    function('s:OpenBuf'),
        \   'options': '+m',
        \ }))
endfunction
