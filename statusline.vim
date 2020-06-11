set statusline=%{MyStatusLine()}

let s:git       = "%1*%{MyGitBranch()}%*%4*%{MyGitCommit()}%*%3*%{MyGitGutter()}%*"
let s:refresh   = "%{MyRefreshStatusLine(&modified, GetStatuslineMod())}"
let s:spell     = "%5*%{&spell ? '  SPELL ' : ''}%*"
let s:lncol     = "%< %-9(%3*%l%*·%4*%c%V%*%) "
let s:tail      = " %=%Y  %4*%P%* "
let s:fname     = "  %f "
let s:fname_mod = "  %2*%f%* "
let s:ro        = "%6*%{&ro ? '' : ''}%*  "

function! MyGitBranch() abort
  let dir = FugitiveGitDir(bufnr(''))
  if empty(dir)
    return ''
  endif
  return ' ' .. FugitiveHead(7, dir)
endfunction

function! GetStatuslineMod() abort
  try
    let statusline_mod = nvim_win_get_var(win_getid(), "statusline_mod")
    return statusline_mod
  catch /E5555/
    return 0
  endtry
endfunction

function! MyGitCommit() abort
  let commit = matchstr(@%, '\c^fugitive:\%(//\)\=.\{-\}\%(//\|::\)\zs\%(\x\{40,\}\|[0-3]\)\ze\%(/.*\)\=$')
  if len(commit)
    let commit = '·' .. commit[0:6]
  endif
  return commit .. ' '
endfunction

function! MyGitGutter() abort
  let hunks = GitGutterGetHunkSummary()
  let symbols = ['+', '~', '-']
  let changes = join(map(copy(hunks), "v:val == 0 ? '' : ' ' .. symbols[v:key] .. v:val"), '')
  return changes
  " return winwidth(winnr()) > 60 ? changes : ''
endfunction

" session - %{fnamemodify(v:this_session, ':t')}
function! MyStatusLine() abort
  let statusline = s:fname .. s:ro .. s:git .. s:spell .. s:tail .. s:refresh
  call setwinvar(winnr(), '&statusline', statusline)
  return ''
endfunction

function! MyRefreshStatusLine(mod, stlmod) abort
  if a:mod != a:stlmod
    let filename = a:mod ? s:fname_mod : s:fname
    let w:statusline_mod = a:stlmod ? 0 : 1
    let statusline = filename .. s:ro .. s:git .. s:spell .. s:tail .. s:refresh
    call setwinvar(winnr(), '&statusline', statusline)
  endif
  return ''
endfunction

" trailing whitespace is required in statusline=
augroup SetStatusLine
  autocmd!
  autocmd FileType fugitiveblame setlocal statusline=%<\ %(%l/%L%)\ %=%P\ 
augroup END
