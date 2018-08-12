function! TernPreviewDoc() abort
  TernDoc
  try
    exec "normal! \<C-w>P"
  catch /E441/
    return
  endtry
  setlocal nobuflisted buftype=nofile filetype=terndoc bufhidden=wipe nomodifiable nonumber
  nnoremap <buffer> q <C-w>p<C-w>z
endfunction
nnoremap <buffer> <silent> K :call TernPreviewDoc()<CR>
nnoremap <buffer> <silent> <space>r :TernRename<CR>
nnoremap <buffer> <silent> <space>d :TernDef<CR>
