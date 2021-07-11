let s:git = "%1*%{StatusGitBranch()}%*%4*%{StatusGitCommit()}%*%{StatusGitGutter()}"
let s:git_nc = "%{StatusGitBranch()}%{StatusGitCommit()}"
let s:spell = "%5*%{&spell ? '  SPELL ' : ''}%*"
let s:right = ' %='
let s:tail = ' %Y  %4*%P%* '
let s:tail_nc = ' %=%Y  %P '
let s:fname = '  %3*%f%* %7*%m%* '
let s:fname_nc = '  %f %6*%M%*   '
let s:ro = "%6*%{&ro ? '' : ''}%*  "
let s:iminsert = "%6*%{StatusIminsert()}%*"
" let s:lncol = "%< %-9(%3*%l%*·%4*%c%V%*%) "
" let s:session = "%{fnamemodify(v:this_session, ':t')}"

let s:statusline = s:iminsert .. s:fname .. s:ro .. s:git .. s:spell .. s:right .. s:tail
let s:statusline_nc = s:fname_nc .. s:git_nc .. s:tail_nc

let &statusline = s:statusline

augroup SetStatusLine
  autocmd!
  autocmd WinEnter * call SetStatusLine('let &l:statusline = s:statusline')
  autocmd WinLeave,WinNew * call SetStatusLine('let &l:statusline = s:statusline_nc')
  autocmd FileType fugitiveblame let &l:statusline = '%< %(%l/%L%) %=%P '
augroup END

function! SetStatusLine(cmd) abort
  if index(['fugitiveblame'], &filetype) != -1
    return
  endif

  let win_info = getwininfo(win_getid())[0]
  if win_info.quickfix
    return
  endif

  execute a:cmd
endfunction

function! StatusGitBranch() abort
  let dir = FugitiveGitDir(bufnr())
  if empty(dir)
    let b:is_in_git = 0
    return ''
  endif
  let b:is_in_git = 1
  return ' ' .. FugitiveHead(7, dir)
endfunction

function! StatusGitCommit() abort
  if !b:is_in_git
    return ' '
  endif

  let commit = matchstr(@%, '\c^fugitive:\%(//\)\=.\{-\}\%(//\|::\)\zs\%(\x\{40,\}\|[0-3]\)\ze\%(/.*\)\=$')
  if len(commit)
    let commit = '·' .. commit[0:6]
  endif
  return commit .. ' '
endfunction

function! StatusGitGutter() abort
  if !b:is_in_git
    return ''
  endif

  let symbols = ['+', '~', '-']
  let changes = join(map(copy(GitGutterGetHunkSummary()), "v:val == 0 ? '' : ' ' .. symbols[v:key] .. v:val"), '')
  return changes
  " return winwidth(winnr()) > 60 ? changes : ''
endfunction

function! StatusIminsert() abort
  return &iminsert ? '   RU ' : ''
endfunction
