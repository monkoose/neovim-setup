nnoremap <space>hh :Hoogle<space>
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> <space>d :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <space>lf :call LanguageClient#textDocument_formatting()<CR>
nnoremap <silent> <space>lr :call LanguageClient#textDocument_rename()<CR>
nnoremap <silent> <space>ll :call LanguageClient#textDocument_references()<CR>
nnoremap <silent> <space>la :call LanguageClient#textDocument_codeAction()<CR>
nnoremap <silent> <space>ft :call LanguageClient#textDocument_documentSymbol()<CR>
