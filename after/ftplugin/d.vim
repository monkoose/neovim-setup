function! DUddocPreview() abort
  let l:output = ''
  redir! => l:output
    exec "silent DUddoc"
  redir END
  if output == ''
    echo 'No documentation found'
    return
  endif
  pclose
  pedit! __duddoc__
  exec "normal! \<C-w>P"
  call setline(1, split(l:output, "\n"))
  setlocal filetype=duddoc
endfunction

augroup duddoc_filetype_defaults
  autocmd!
  autocmd FileType duddoc nnoremap <buffer> q <C-w>p<C-w>z
  autocmd FileType duddoc setlocal nobuflisted buftype=nofile bufhidden=wipe nomodifiable nonumber wrap
augroup END

nnoremap <buffer> <silent> K :call DUddocPreview()<CR>
nnoremap <buffer> <silent> <space>d :DUjump<CR>
setlocal shiftwidth=4 softtabstop=-1

nnoremap <script> <silent> <F9> :<C-u>exec 'Topen \| T dmd -run ' . expand("%")<CR>
