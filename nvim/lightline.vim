let g:lightline = {
    \ 'colorscheme': 'my_gruvbox',
    \ 'active': {
        \ 'left':  [
            \ [ 'mode', 'kmap', 'paste', 'spell' ],
            \ [ 'filename', 'git' ]
        \ ],
        \ 'right': [
            \ [ 'ale', 'lineinfo', 'percent' ],
            \ [ 'virtualenv', 'fileformat', 'fileencoding', 'filetype' ]
        \ ]
    \ },
    \ 'inactive': {
        \ 'left':  [ [ 'mode', 'filename' ] ],
        \ 'right': [ [ 'lineinfo', 'percent' ] ]
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

function! FilenameOrFiletypeMatch () abort
  let l:fname = expand('%:t')
  return l:fname =~ 'NERD_tree' ? 1 :
       \ l:fname =~ 'undotree_2\|diffpanel_3' ? 1 :
       \ &ft     == 'qf' ? 1 :
       \ &ft     == 'startify' ? 1 :
       \ &ft     == 'fugitiveblame' ? 1 :
       \ &ft     == 'gitcommit' ? 1 :
       \ l:fname == '__doc__' && &ft == 'rst' ? 1 :
       \ expand('%:p') =~ 'term:\/\/' ? 1 :
       \ 0
endfunction

function! LightLinePaste() abort
  return &paste ? 'P' : ''
endfunction

function! LightLineSpell() abort
  return &spell ? 'S' : ''
endfunction

function! LightLineKeymap() abort
  return &iminsert == 1 ? '[ru]' : ''
endfunction

function! LightLineVenv() abort
  return &ft =~# 'python' &&
      \ winwidth(0) > 70 &&
      \ $VIRTUAL_ENV != '' ? printf('(%s)', fnamemodify($VIRTUAL_ENV, ':t')) : ''
endfunction

function! LightLineLineinfo() abort
  return FilenameOrFiletypeMatch() ? '' :
       \ printf(' %2d', line('.'))
endfunction

function! PercentHelper() abort
  return line('w0') == 1 ? ' Top' :
       \ line('w$') == line('$') ? ' Bot' :
       \ printf(' %2.0f', (100.0 * line('.') / line('$'))) . '%'
endfunction

function! LightLinePercent() abort
  let l:fname = expand('%:t')
  return l:fname =~ 'NERD_tree_' ? '' :
       \ l:fname == 'undotree_2' ? '' :
       \ l:fname == 'diffpanel_3' ? '' :
       \ &ft     == 'Startify' ? '' :
       \ &ft     == 'qf' ? line('$') :
       \ PercentHelper()
endfunction

function! IsModified() abort
  return &ft =~ 'help' ? '' : &modified ? '[+]' : &modifiable ? '' : '[-]'
endfunction

function! IsReadOnly() abort
  return &ft !~? 'help' && &readonly ? '[RO]' : ''
endfunction

function! LightLineFilename() abort
  let l:relpath = strlen(expand('%:.')) > 50 ? '../' . expand('%:t') : expand('%:.')
  return FilenameOrFiletypeMatch() ? '' :
       \ ('' != expand('%:t') ? relpath : '[No Name]') .
          \ ('' != IsReadOnly() ? ' ' . IsReadOnly() : '') .
          \ ('' != IsModified() ? ' ' . IsModified() : '')
endfunction

function! LightLineMode() abort
  let l:fname = expand('%:t')
  return l:fname =~ 'NERD_tree' ? 'NERDTREE ' :
       \ l:fname =~ 'undotree_2' ? 'UNDOTREE ' :
       \ l:fname =~ 'diffpanel_3' ? 'DIFF ' :
       \ l:fname == 'LocationList' ? 'LOCATION LIST ' :
       \ &ft     == 'qf' ? 'QUICK FIX ' :
       \ &ft     == 'startify' ? 'STARTIFY ' :
       \ &ft     == 'fugitiveblame' ? 'GIT BLAME ' :
       \ &ft     == 'gitcommit' ? l:fname == 'index' ? 'GIT STATUS ' : 'GIT COMMIT ' :
       \ l:fname == '__doc__' && &ft == 'rst' ? 'DOCSTRING ' :
       \ expand('%:p') =~ 'term:\/\/' ? &ft == 'fzf' ? 'FZF' : &ft == 'neoterm' ? 'NEOTERM ' : 'TERMINAL ' :
       \ ''
endfunction

" Shows branch name and number of hunks
function! LightLineGit() abort
  try
    if expand('%:t') !~? 'NERD_tree_\|undotree_2\|diffpanel_3' &&
          \ expand('%:p') !~? 'term:\/\/' && &ft != 'startify' &&
          \ &ft != 'qf' && exists('*fugitive#head')
      let l:mark = '   '
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
function! LightLineFileformat() abort
  return winwidth(0) > 70 && &fileformat != 'unix' ? &fileformat : ''
endfunction

function! LightLineFiletype() abort
  return FilenameOrFiletypeMatch() ? '' :
       \ winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding() abort
  return FilenameOrFiletypeMatch() ? '' :
       \ &fenc == 'utf-8' ? '' :
       \ winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) :
       \ ''
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