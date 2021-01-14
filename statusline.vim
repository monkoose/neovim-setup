set statusline=%{InitializeSL()}

let s:git       = "%1*%{StatusGitBranch()}%*%4*%{StatusGitCommit()}%*%3*%{StatusGitGutter()}%*"
let s:refresh   = "%{RefreshSL(&modified)}"
let s:spell     = "%5*%{&spell ? '  SPELL ' : ''}%*"
let s:lncol     = "%< %-9(%3*%l%*·%4*%c%V%*%) "
let s:tail      = " %=%Y  %4*%P%* "
let s:fname     = "  %f "
let s:fname_mod = "  %2*%f%* "
let s:ro        = "%6*%{&ro ? '' : ''}%*  "
let s:iminsert  = "%6*%{StatusIminsert()}%*"

" session - %{fnamemodify(v:this_session, ':t')}
function! InitializeSL() abort
  let statusline = s:iminsert .. s:fname .. s:ro .. s:git .. s:spell .. s:tail .. s:refresh
  call setwinvar(winnr(), '&statusline', statusline)
  return ''
endfunction

function! RefreshSL(mod) abort
  let slmod = getwinvar(winnr(), 'statusline_mod', 0)
  if a:mod != slmod
    let filename = a:mod ? s:fname_mod : s:fname
    if slmod
      call setwinvar(winnr(), 'statusline_mod', 0)
    else
      call setwinvar(winnr(), 'statusline_mod', 1)
    endif
    let statusline = s:iminsert .. filename .. s:ro .. s:git .. s:spell .. s:tail .. s:refresh
    call setwinvar(winnr(), '&statusline', statusline)
  endif
  return ''
endfunction

" trailing whitespace is required in statusline=
augroup SetStatusLine
  autocmd!
  autocmd FileType fugitiveblame setlocal statusline=%<\ %(%l/%L%)\ %=%P\ 
augroup END

function! StatusGitBranch() abort
  let dir = FugitiveGitDir(bufnr(''))
  if empty(dir)
    return ''
  endif
  return ' ' .. FugitiveHead(7, dir)
endfunction

function! StatusGitCommit() abort
  let commit = matchstr(@%, '\c^fugitive:\%(//\)\=.\{-\}\%(//\|::\)\zs\%(\x\{40,\}\|[0-3]\)\ze\%(/.*\)\=$')
  if len(commit)
    let commit = '·' .. commit[0:6]
  endif
  return commit .. ' '
endfunction

function! StatusGitGutter() abort
  let symbols = ['+', '~', '-']
  let changes = join(map(copy(GitGutterGetHunkSummary()), "v:val == 0 ? '' : ' ' .. symbols[v:key] .. v:val"), '')
  return changes
  " return winwidth(winnr()) > 60 ? changes : ''
endfunction

function! StatusIminsert() abort
  return &iminsert ? '   RU ' : ''
endfunction
