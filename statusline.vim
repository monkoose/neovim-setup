set statusline=%{MyStatusLine()}

let s:git       = "%1*%{MyGitBranch()}%*%4*%{MyGitCommit()}%*%3*%{MyGitGutter()}%*"
let s:refresh   = "%{MyRefreshStatusLine(&modified, w:statusline_mod)}"
let s:spell     = "%5*%{&spell ? '  SPELL ' : ''}%*"
let s:lncol     = "%< %-9(%3*%l%*·%4*%c%V%*%) "
let s:tail      = " %=%Y  %5*%P%* "
let s:fname     = " %f "
let s:fname_mod = " %2*%f%* "
let s:ro        = "%6*%{&ro ? '' : ''}%*  "

function! MyGitBranch() abort
  let dir = FugitiveGitDir(bufnr(''))
  if empty(dir)
    return ''
  endif
  return ' ' .. FugitiveHead(7, dir)
endfunction

function! MyGitCommit() abort
  let commit = matchstr(@%, '\c^fugitive:\%(//\)\=.\{-\}\%(//\|::\)\zs\x\{40,\}\|[0-3]\ze\%(/.*\)\=$')
  if len(commit)
    let commit = '·' .. commit[0:6]
  endif
  return commit .. ' '
endfunction

function! MyGitGutter() abort
  let hunks = GitGutterGetHunkSummary()
  let symbols = ['+', '~', '-']
  let changes = join(map(copy(hunks), {i, v -> v == 0 ? '' : ' ' .. symbols[i] .. v}), '')
  return changes
  " return winwidth(winnr()) > 60 ? changes : ''
endfunction

" session - %{fnamemodify(v:this_session, ':t')}
function! MyStatusLine() abort
  let statusline = s:lncol .. s:fname .. s:ro .. s:git .. s:spell .. s:tail .. s:refresh
  call setwinvar(winnr(), '&statusline', statusline)
  return ''
endfunction

function! MyRefreshStatusLine(mod, stlmod) abort
  if a:mod != a:stlmod
    let filename = a:mod ? s:fname_mod : s:fname
    let w:statusline_mod = a:stlmod ? 0 : 1
    let statusline = s:lncol .. filename .. s:ro .. s:git .. s:spell .. s:tail .. s:refresh
    call setwinvar(winnr(), '&statusline', statusline)
  endif
  return ''
endfunction

augroup SetStatusLine
  autocmd!
  autocmd CmdwinEnter,BufWinEnter,WinEnter * let w:statusline_mod = 0
  autocmd FileType fugitiveblame setlocal statusline=%<\ %(%l/%L%)\ %=%P\ 
augroup END
