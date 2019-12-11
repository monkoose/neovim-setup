set statusline=%{MyStatusLine()}

let s:coc_git   = " %1*%{get(g:,'coc_git_status','')}%{get(b:,'coc_git_status','')}%*"
let s:refresh   = '%{RefreshStatusLine(&modified, w:statusline_mod)}'
let s:spell     = "  %5*%{&spell ? 'SPELL' : ''}%*"
let s:lncol     = "%< %-9(%3*%l%*·%4*%c%V%*%) "
let s:tail      = " %=%Y  %5*%P%* "
let s:fname     = " %f "
let s:fname_mod = " %2*%f%* "
let s:ro        = "%6*%{&ro ? ' ' : ''}%*"

" session - %{fnamemodify(v:this_session, ':t')}
function! MyStatusLine() abort
  let statusline = s:lncol .. s:fname .. s:ro .. s:coc_git .. s:spell .. s:tail .. s:refresh
  call setwinvar(winnr(), '&statusline', statusline)
  return ''
endfunction

function! RefreshStatusLine(mod, stlmod) abort
  if a:mod != a:stlmod
    let filename = a:mod ? s:fname_mod : s:fname
    let w:statusline_mod = a:stlmod ? 0 : 1
    let statusline = s:lncol .. filename .. s:ro .. s:coc_git .. s:spell .. s:tail .. s:refresh
    call setwinvar(winnr(), '&statusline', statusline)
  endif
  return ''
endfunction

augroup SetStatusLine
  autocmd!
  autocmd CmdwinEnter,BufWinEnter,WinEnter * let w:statusline_mod = 0
  autocmd FileType fugitiveblame setlocal statusline=%<\ %(%l/%L%)\ %=%P\ 
augroup END
