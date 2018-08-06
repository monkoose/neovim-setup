let g:lightline = {
    \ 'colorscheme': 'my_gruvbox',
    \ 'active': {
        \ 'left':  [
            \ [ 'lineinfo', 'mode', 'kmap', 'paste', 'spell' ],
            \ [ 'git', 'filename' ]
        \ ],
        \ 'right': [
            \ [ 'ale', 'percent' ],
            \ [ 'virtualenv', 'fileformat', 'fileencoding', 'filetype' ]
        \ ]
    \ },
    \ 'inactive': {
        \ 'left':  [ [ 'lineinfo', 'mode', 'filename' ] ],
        \ 'right': [ [ 'percent' ] ]
    \ },
    \ 'component_function': {
        \ 'paste':         'LightLinePaste',
        \ 'lineinfo':      'LightLineLineinfo',
        \ 'spell':         'LightLineSpell',
        \ 'git':           'LightLineGit',
        \ 'filename':      'LightLineFilename',
        \ 'fileformat':    'LightLineFileformat',
        \ 'filetype':      'LightLineFiletype',
        \ 'fileencoding':  'LightLineFileencoding',
        \ 'mode':          'LightLineMode',
        \ 'percent':       'LightLinePercent',
        \ 'virtualenv':    'LightLineVenv',
        \ 'kmap':          'LightLineKeymap',
    \ },
    \ 'component_expand': {
        \ 'ale': 'ALEStatusLine',
    \ },
    \ 'component_type': {
        \ 'ale': 'error',
    \ },
    \ 'separator':    { 'left': '', 'right': '' },
    \ 'subseparator': { 'left': '', 'right': '' }
\ }

let s:leftseparator  = '  '
let s:rightseparator = '  '

function! FilenameOrFiletypeMatch () abort
  let l:fname = expand('%:t')
  return l:fname =~ 'NERD_tree' ? 1 :
       \ l:fname =~ 'undotree_2\|diffpanel_3' ? 1 :
       \ &ft     == 'qf' ? 1 :
       \ &ft     == 'startify' ? 1 :
       \ l:fname == '__doc__' && &ft == 'rst' ? 1 :
       \ expand('%:p') =~ 'term:\/\/' ? 1 :
       \ 0
endfunction

function! LightLinePaste()
  return &paste ? 'P' . s:leftseparator : ''
endfunction

function! LightLineSpell()
  return &spell ? 'S' . s:leftseparator : ''
endfunction

function! LightLineKeymap()
  return &iminsert == 1 ? '[ru] ' : ''
endfunction

function! LightLineVenv()
  return &ft =~# 'python' &&
      \ winwidth(0) > 70 &&
      \ $VIRTUAL_ENV != '' ? printf('(%s)', fnamemodify($VIRTUAL_ENV, ':t')) : ''
endfunction

function! LightLineLineinfo()
  return FilenameOrFiletypeMatch() ? '' :
       \ printf('%3d : %-2d', line('.'), col('.')) . s:leftseparator
endfunction
       " \ printf('%2d', col('.')) . s:leftseparator

function! PercentHelper() abort
  return line('w0') == 1 ? 'Top' :
       \ line('w$') == line('$') ? 'Bot' :
       \ printf('%2.0f', (100.0 * line('.') / line('$'))) . '%'
endfunction

function! LightLinePercent()
  let l:fname = expand('%:t')
  return l:fname =~ 'NERD_tree_' ? '' :
       \ l:fname == 'undotree_2' ? '' :
       \ l:fname == 'diffpanel_3' ? '' :
       \ &ft     == 'Startify' ? '' :
       \ &ft     == 'qf' ? line('$') :
       \ s:rightseparator . PercentHelper()
endfunction

function! IsModified() abort
  return &ft =~ 'help' ? '' : &modified ? '[+]' : &modifiable ? '' : '[-]'
endfunction

function! IsReadOnly() abort
  return &ft !~? 'help' && &readonly ? '[RO]' : ''
endfunction

function! LightLineFilename()
  let l:relpath = strlen(expand('%:.')) > 50 ? '../' . expand('%:t') : expand('%:.')
  return FilenameOrFiletypeMatch() ? '' :
       \ ('' != expand('%:t') ? relpath : '[No Name]') .
          \ ('' != IsReadOnly() ? ' ' . IsReadOnly() : '') .
          \ ('' != IsModified() ? ' ' . IsModified() : '')
endfunction

function! LightLineMode() abort
  let l:fname = expand('%:t')
  return l:fname =~ 'NERD_tree' ? 'NERD TREE' :
       \ l:fname =~ 'undotree_2' ? 'UNDO TREE' :
       \ l:fname =~ 'diffpanel_3' ? 'DIFF' :
       \ l:fname == 'LocationList' ? 'LOCATION LIST' :
       \ &ft     == 'qf' ? 'QUICK FIX' :
       \ &ft     == 'startify' ? 'STARTIFY' :
       \ l:fname == '__doc__' && &ft == 'rst' ? 'DOCSTRING' :
       \ expand('%:p') =~ 'term:\/\/' ? &ft == 'fzf' ? 'FZF' : &ft == 'neoterm' ? 'NEOTERM' : 'TERMINAL' :
       \ ''
endfunction

" Shows branch name and number of hunks
function! LightLineGit()
  try
    if expand('%:t') !~? 'NERD_tree_\|undotree_2\|diffpanel_3' &&
          \ expand('%:p') !~? 'term:\/\/' &&
          \ &ft != 'qf' && exists('*fugitive#head')
      let l:mark = ''
      let l:branchname = fugitive#head()
      let l:symbols = ['+', '~', '-']
      let l:hunks = GitGutterGetHunkSummary()
      let l:ret = []
      for i in [0, 1, 2]
        if l:hunks[i] > 0
          call add(l:ret, l:symbols[i] . l:hunks[i])
        endif
      endfor
      if ret != []
        let l:gitgutter = ' ' . join(l:ret, ' ')
      else
        let l:gitgutter = ''
      endif
      let l:gitinfo = l:mark.l:branchname . l:gitgutter . '  '
      return strlen(l:branchname) && winwidth(0) > 80 ? l:gitinfo : ''
    endif
  catch
  endtry
  return ''
endfunction

" Shows nothing if fileformat is 'unix', shows fileformat otherwise
function! LightLineFileformat()
  return winwidth(0) > 70 && &fileformat != 'unix' ? &fileformat . s:leftseparator : ''
endfunction

function! LightLineFiletype()
  return FilenameOrFiletypeMatch() ? '' :
       \ winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
  return FilenameOrFiletypeMatch() ? '' :
       \ &fenc == 'utf-8' ? '' :
       \ winwidth(0) > 70 ? (strlen(&fenc) ? &fenc . s:leftseparator :
       \ &enc . s:leftseparator) : ''
endfunction

function! ALEStatusLine() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors

  return l:counts.total == 0 ? '' : printf('E:%d W:%d', all_errors, all_non_errors)
endfunction

" ALE
augroup AutoALE
  autocmd!
  autocmd User ALELintPost call lightline#update()
augroup END