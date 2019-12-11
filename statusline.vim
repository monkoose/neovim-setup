set statusline=%{MyStatusLine()}

let s:coc_git = "%1*%{get(g:,'coc_git_status','')}%{get(b:,'coc_git_status','')}%*"
let s:refresh = '%{RefreshStatusLine(&modified, w:statusline_mod)}'
let s:spell = "  %5*%{&spell ? 'SPELL' : ''}%*"

" session - %{fnamemodify(v:this_session, ':t')}
function! MyStatusLine() abort
  let filename = '%< %f '
  let statusline = " %-9(%3*%l%*·%4*%c%V%*%) " ..
                 \ filename ..
                 \ "%h%r  " ..
                 \ s:coc_git ..
                 \ s:spell ..
                 \ " %=%Y  %5*%P%* " ..
                 \ s:refresh

  call setwinvar(winnr(), '&statusline', statusline)
  return ''
endfunction

function! RefreshStatusLine(mod, stlmod) abort
  if a:mod != a:stlmod
    if a:mod
      let filename = '%< %2*%f%* '
    else
      let filename = '%< %f '
    endif
    if a:stlmod
      let w:statusline_mod = 0
    else
      let w:statusline_mod = 1
    endif

    let statusline = " %-9(%3*%l%*·%4*%c%V%*%) " ..
                  \ filename ..
                  \ "%h%r  " ..
                  \ s:coc_git ..
                  \ s:spell ..
                  \ " %=%Y  %5*%P%* " ..
                  \ s:refresh

    call setwinvar(winnr(), '&statusline', statusline)
  endif
  return ''
endfunction

augroup SetStatusLine
  autocmd!
  autocmd CmdwinEnter,BufWinEnter,WinEnter * let w:statusline_mod = 0
  autocmd FileType fugitiveblame setlocal statusline=%<\ %(%l/%L%)\ %=%P\ 
augroup END
