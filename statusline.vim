set statusline=%{MyStatusLine()}

let s:coc_git = "%{get(g:,'coc_git_status','')}%{get(b:,'coc_git_status','')}%{get(b:,'coc_git_blame','')}"

function! MyStatusLine() abort
  let l:filename = '%< %f '
  if &modified
    let l:filename = '%<%2* %f %*'
  endif
  let l:redraw = '%{MyStatusLine()}'
  let l:statusline = l:redraw . l:filename . "%h%r " . s:coc_git . " %=%-12.(%l,%c%V%) %y  %P "
  call setwinvar(winnr(), '&statusline', l:statusline)
  return ''
endfunction

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
