nnoremap <buffer> <space>hh :Hoogle<space>
nnoremap <buffer><silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <buffer><silent> <space>d :call LanguageClient#textDocument_definition()<CR>
nnoremap <buffer><silent> <space>lf :call LanguageClient#textDocument_formatting()<CR>
nnoremap <buffer><silent> <space>lr :call LanguageClient#textDocument_rename()<CR>
nnoremap <buffer><silent> <space>ll :call LanguageClient#textDocument_references()<CR>
nnoremap <buffer><silent> <space>la :call LanguageClient#textDocument_codeAction()<CR>
nnoremap <buffer><silent> <space>ft :call LanguageClient#textDocument_documentSymbol()<CR>
