set statusline=%{MyStatusLine()}

let s:coc_git = "%1*%{get(g:,'coc_git_status','')}%{get(b:,'coc_git_status','')}%*"
let s:refresh = '%{MyStatusLine()}'

" session - %{fnamemodify(v:this_session, ':t')}
function! MyStatusLine() abort
  if &modified
    let filename = '%< %2*%f%* '
  else
    let filename = '%< %f '
  endif
  let statusline = " %-9(%3*%l%*·%4*%c%V%*%) " .. s:refresh .. filename .. "%h%r  " .. s:coc_git .. " %=%y  %5*%P%* "
  call setwinvar(winnr(), '&statusline', statusline)
  return ''
endfunction

augroup SetStatusLine
  autocmd!
  autocmd FileType fugitiveblame setlocal statusline=%<\ %(%l/%L%)\ %=%P\ 
augroup END
