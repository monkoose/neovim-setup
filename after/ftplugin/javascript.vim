" function! TernPreviewDoc() abort
"   TernDoc
"   try
"     exec "normal! \<C-w>P"
"   catch /E441/
"     return
"   endtry
"   setlocal filetype=terndoc
"   exec "normal! \<C-w>p"
" endfunction

" augroup terndoc_filetype_defaults
"   autocmd!
"   autocmd FileType terndoc nnoremap <buffer> q <C-w>p<C-w>z
"   autocmd FileType terndoc setlocal nobuflisted buftype=nofile bufhidden=wipe nomodifiable nonumber wrap
" augroup END

" nnoremap <buffer> <silent> K :call TernPreviewDoc()<CR>
" nnoremap <buffer> <silent> <space>lr :TernRename<CR>
" nnoremap <buffer> <silent> <space>d :TernDef<CR>

nnoremap <buffer><silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <buffer><silent> <space>d :call LanguageClient#textDocument_definition()<CR>
nnoremap <buffer><silent> <space>lf :call LanguageClient#textDocument_formatting()<CR>
nnoremap <buffer><silent> <space>lr :call LanguageClient#textDocument_rename()<CR>
nnoremap <buffer><silent> <space>ll :call LanguageClient#textDocument_references()<CR>
nnoremap <buffer><silent> <space>la :call LanguageClient#textDocument_codeAction()<CR>
nnoremap <buffer><silent> <space>ft :call LanguageClient#textDocument_documentSymbol()<CR>
