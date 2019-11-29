set statusline=%{MyStatusLine()}

let s:coc_git = "%{get(g:,'coc_git_status','')}%{get(b:,'coc_git_status','')}%{get(b:,'coc_git_blame','')}"

" session - %{fnamemodify(v:this_session, ':t')}
function! MyStatusLine() abort
  let filename = '%< %f '
  if &modified
    let filename = '%<%2* %f %*'
  endif
  let refresh = '%{MyStatusLine()}'
  let statusline = refresh .. filename .. "%h%r " .. s:coc_git .. " %=%-12.(%l,%c%V%) %y  %P "
  call setwinvar(winnr(), '&statusline', statusline)
  return ''
endfunction

augroup SetStatusLine
  autocmd!
  autocmd FileType fugitiveblame setlocal statusline=%<\ %(%l/%L%)\ %=%P\ 
augroup END
" function! ALEStatusLine() abort
"   let counts = ale#statusline#Count(bufnr(''))
"   let all_errors = counts.error + counts.style_error
"   let all_non_errors = counts.total - all_errors
"   return counts.total == 0 ? '' : printf('  E:%d W:%d ', all_errors, all_non_errors)
" endfunction
