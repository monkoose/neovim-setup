set statusline=%<\ %f\ \ %h%m%r\ \ %{get(g:,'coc_git_status','')}%{get(b:,'coc_git_status','')}%{get(b:,'coc_git_blame','')}%=%-12.(%l,%c%V%)\ %y\ \ %P\ 

augroup StatusLineColor
  autocmd!
  au InsertEnter * hi StatusLine guifg=#221111 guibg=#7c7e1d
  au InsertLeave * hi StatusLine guifg=#b8af96 guibg=#48382f
augroup END

augroup SetStatusLine
  autocmd!
  autocmd FileType fugitiveblame setlocal statusline=%<\ %(%l/%L%)\ %=%P\ 
augroup END

" function! ALEStatusLine() abort
"   let l:counts = ale#statusline#Count(bufnr(''))
"   let l:all_errors = l:counts.error + l:counts.style_error
"   let l:all_non_errors = l:counts.total - l:all_errors
"   return l:counts.total == 0 ? '' : printf('  E:%d W:%d ', all_errors, all_non_errors)
" endfunction
