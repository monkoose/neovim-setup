let g:lightline = {
    \ 'colorscheme': 'boa',
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
        \ 'left':  [ [ 'lineinfo', 'inactivemode', 'filename' ] ],
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
        \ 'inactivemode':  'LightLineInactiveMode',
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

let g:lightline.leftseparator  = '  '
let g:lightline.rightseparator = '  '

function! LightLinePaste()
  return &paste ? 'P' . g:lightline.leftseparator : ''
endfunction

function! LightLineSpell()
  return &spell ? 'S' . g:lightline.leftseparator : ''
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
  let fname = expand('%:t')
  return fname =~ 'NERD_tree_' ? '' :
       \ fname == 'undotree_2' ? '' :
       \ fname == 'diffpanel_3' ? '' :
       \ fname == 'Startify' ? '' :
       \ &ft   == 'qf' ? '' :
       \ expand('%:p') =~ 'term:\/\/' ? '' :
       \ printf('%2d', col('.')) . g:lightline.leftseparator
endfunction
    " \ printf('%3d : %-2d', line('.'), col('.')) . g:lightline.leftseparator

function! LightLinePercent()
  let fname = expand('%:t')
  return fname =~ 'NERD_tree_' ? '' :
       \ fname == 'undotree_2' ? '' :
       \ fname == 'diffpanel_3' ? '' :
       \ fname == 'Startify' ? '' :
       \ &ft   == 'qf' ? line('$') :
       \ g:lightline.rightseparator . LightLinePercentHelper()
endfunction

function! LightLinePercentHelper()
  return line('w0') == 1 ? 'Top' :
       \ line('w$') == line('$') ? 'Bot' :
       \ printf('%2.0f', (100.0 * line('.') / line('$'))) . '%'
endfunction

function! LightLineModified()
  return &ft =~ 'help' ? '' : &modified ? '[+]' : &modifiable ? '' : '[-]'
endfunction

function! LightLineReadonly()
  return &ft !~? 'help' && &readonly ? '[RO]' : ''
endfunction

function! LightLineFilename()
  let fname = expand('%:t')
  let relpath = strlen(expand('%:.')) > 50 ? '../' . expand('%:t') : expand('%:.')
  return fname =~ 'NERD_tree_\|undotree_2\|diffpanel_3' ? '' :
       \ fname == 'Startify' ? '' :
       \ &ft == 'qf' ? '' :
       \ expand('%:p') =~ 'term:\/\/' ? '' :
       \ ('' != fname ? relpath : '[No Name]') .
       \ ('' != LightLineReadonly() ? ' ' . LightLineReadonly() : '') .
       \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineMode()
  let fname = expand('%:t')
  return fname =~ 'NERD_tree_' ? ' NERDTree' :
       \ fname == 'undotree_2' ? ' UndoTree' :
       \ fname == 'diffpanel_3' ? ' diff' :
       \ fname == 'Startify' ? ' Startify  ' :
       \ fname == 'LocationList' ? ' Location List' :
       \ &ft == 'qf' ? ' QuickFix' :
       \ fname =~ '#neoterm-\d' ? 'NeoTerm ' . fname[match(fname, '\d'):] :
       \ expand('%:p') =~ 'term:\/\/' ? 'terminal' : ''
       " \ winwidth(0) > 60 ? lightline#mode() . g:lightline.leftseparator : ''
endfunction

function! LightLineInactiveMode()
  let fname = expand('%:t')
  return fname =~ 'NERD_tree_' ? ' NERDTree' :
       \ fname == 'undotree_2' ? ' UndoTree' :
       \ fname == 'diffpanel_3' ? ' diff' :
       \ fname == 'Startify' ? ' Startify  ' :
       \ fname == 'LocationList' ? ' Location List' :
       \ &ft == 'qf' ? ' QuickFix' :
       \ fname =~ '#neoterm-\d' ? 'NeoTerm ' . fname[match(fname, '\d'):] :
       \ expand('%:p') =~ 'term:\/\/' ? 'terminal' : ''
endfunction

function! LightLineGit()
  try
    if expand('%:t') !~? 'NERD_tree_\|undotree_2\|diffpanel_3' &&
          \ expand('%:p') !~? 'term:\/\/' &&
          \ &ft != 'qf' && exists('*fugitive#head')
      let mark = ''
      let branchname = fugitive#head()
      let symbols = ['+', '~', '-']
      let hunks = GitGutterGetHunkSummary()
      let ret = []
      for i in [0, 1, 2]
        if hunks[i] > 0
          call add(ret, symbols[i] . hunks[i])
        endif
      endfor
      if ret != []
        let gitgutter = ' ' . join(ret, ' ')
      else
        let gitgutter = ''
      endif
      let gitinfo = mark.branchname . gitgutter . '  '
      return strlen(branchname) && winwidth(0) > 80 ? gitinfo : ''
    endif
  catch
  endtry
  return ''
endfunction

function! LightLineFileformat()
  return winwidth(0) > 70 && &fileformat != 'unix' ? &fileformat . g:lightline.leftseparator : ''
endfunction

function! LightLineFiletype()
  let fname = expand('%:t')
  return fname =~ 'NERD_tree_' ? '' :
       \ fname == 'undotree_2' ? '' :
       \ fname == 'diffpanel_3' ? '' :
       \ fname == 'Startify' ? '' :
       \ &ft   == 'qf' ? '' :
       \ expand('%:p') =~ 'term:\/\/' ? '' :
       \ winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
  let fname = expand('%:t')
  return fname =~ 'NERD_tree_' ? '' :
       \ fname == 'undotree_2' ? '' :
       \ fname == 'diffpanel_3' ? '' :
       \ fname == 'Startify' ? '' :
       \ &ft   == 'qf' ? '' :
       \ &fenc == 'utf-8' ? '' :
       \ expand('%:p') =~ 'term:\/\/' ? '' :
       \ winwidth(0) > 70 ? (strlen(&fenc) ? &fenc . g:lightline.leftseparator :
       \ &enc . g:lightline.leftseparator) : ''
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
  autocmd User ALELint call lightline#update()
augroup END
