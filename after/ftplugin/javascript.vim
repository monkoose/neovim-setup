function! TernPreviewDoc() abort
  TernDoc
  try
    exec "normal! \<C-w>P"
  catch /E441/
    return
  endtry
  setlocal filetype=terndoc
  exec "normal! \<C-w>p"
endfunction

augroup terndoc_filetype_defaults
  autocmd!
  autocmd FileType terndoc nnoremap <buffer> q <C-w>p<C-w>z
  autocmd FileType terndoc setlocal nobuflisted buftype=nofile bufhidden=wipe nomodifiable nonumber wrap
augroup END

nnoremap <buffer> <silent> K :call TernPreviewDoc()<CR>
nnoremap <buffer> <silent> <space>lr :TernRename<CR>
nnoremap <buffer> <silent> <space>d :TernDef<CR>
