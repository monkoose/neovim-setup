let g:lightline = {
        \ 'colorscheme': 'boa',
        \ 'active': {
                \ 'left':  [
                               \ [ 'lineinfo', 'mode', 'paste', 'spell' ],
                               \ [ 'git', 'filename' ]
                \ ],
                \ 'right': [
                               \ [ 'syntastic', 'percent' ],
                               \ [ 'virtualenv', 'fileformat', 'fileencoding', 'filetype', 'cwd' ]
                \ ]
        \ },
        \ 'inactive': {
                \ 'left':  [ [ 'inactivemode' ] ],
                \ 'right': [ [ 'percent' ], [ 'lineinfo', 'filename' ] ]
        \ },
        \ 'component_function': {
                \ 'cwd':           'LightLineCWD',
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
        \ },
        \ 'component_expand': {
                \ 'syntastic': 'SyntasticStatuslineFlag',
        \ },
        \ 'component_type': {
                \ 'syntastic': 'error',
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

function! LightLineCWD()
    return expand('%:t') == 'ControlP' && winwidth(0) > 60 ? getcwd() : ''
endfunction

function! LightLineVenv()
    return &ft =~# 'python'
                \ && winwidth(0) > 70
                \ && $VIRTUAL_ENV != '' ? printf('(%s)', fnamemodify($VIRTUAL_ENV, ':t')) : ''
endfunction

function! LightLineLineinfo()
    let fname = expand('%:t')
    return fname == 'ControlP' ? '' :
                \ fname =~ 'NERD_tree' ? '' :
                \ fname == 'undotree_2' ? '' :
                \ fname == 'diffpanel_3' ? '' :
                \ fname =~ '__Tagbar__' ? '' :
                \ fname == 'Startify' ? '' :
                \ &ft   == 'qf' ? '' :
                \ printf('%3d : %-2d', line('.'), col('.')) . g:lightline.leftseparator
endfunction

function! LightLinePercent()
    let fname = expand('%:t')
    return fname == 'ControlP' ? '' :
                \ fname =~ 'NERD_tree' ? '' :
                \ fname == 'undotree_2' ? '' :
                \ fname == 'diffpanel_3' ? '' :
                \ fname =~ '__Tagbar__' ? '' :
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
    if fname =~ 'ControlP'
        call lightline#link('iR'[g:lightline.ctrlp_regex])
        return g:lightline.ctrlp_item
    endif
    if fname =~ '__Tagbar__'
        if g:lightline.fname == ''
            return g:lightline.rightseparator . '[No Name]'
        endif
        return g:lightline.rightseparator . g:lightline.fname
    endif
    return fname =~ 'NERD_tree\|undotree_2\|diffpanel_3' ? '' :
                \ fname == 'Startify' ? '' :
                \ &ft == 'qf' ? '' :
                \ ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
                \ ('' != fname ? relpath : '[No Name]') .
                \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineMode()
    let fname = expand('%:t')
    return fname == 'ControlP' ? ' CtrlP' . g:lightline.leftseparator :
                \ fname =~ 'NERD_tree' ? ' NERDTree' :
                \ fname == 'undotree_2' ? ' UndoTree' :
                \ fname == 'diffpanel_3' ? ' diff' :
                \ fname =~ '__Tagbar__' ? ' Tagbar' :
                \ fname == 'Startify' ? ' Startify  ' :
                \ fname == 'LocationList' ? ' Location List' :
                \ &ft == 'qf' ? ' QuickFix' : ''
                " \ winwidth(0) > 60 ? lightline#mode() . g:lightline.leftseparator : ''
endfunction

function! LightLineInactiveMode()
    let fname = expand('%:t')
    return fname == 'ControlP' ? ' CtrlP' :
                \ fname =~ 'NERD_tree' ? ' NERDTree' :
                \ fname == 'undotree_2' ? ' UndoTree' :
                \ fname == 'diffpanel_3' ? ' diff' :
                \ fname =~ '__Tagbar__' ? ' Tagbar' :
                \ fname == 'Startify' ? 'Startify  ' :
                \ fname == 'LocationList' ? ' Location List' :
                \ &ft == 'qf' ? ' QuickFix' : ''
endfunction

function! LightLineGit()
    try
        if exists('*fugitive#head') &&
                    \ expand('%:t') !~? 'NERD_tree\|undotree_2\|diffpanel_3\|__Tagbar__' &&
                    \ &ft != 'qf'
            let mark = ''
            let _ = fugitive#head()
            let symbols = ['+', '~', '-']
            let hunks = GitGutterGetHunkSummary()
            let ret = []
            for i in [0, 1, 2]
                if hunks[i] > 0
                    call add(ret, symbols[i] . hunks[i])
                endif
            endfor
            let gitter = mark._ . ' ' . join(ret, ' ') . ' ' . g:lightline.leftseparator
            return strlen(_) &&  winwidth(0) > 80 ? gitter : ''
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
    return fname == 'ControlP' ? '' :
                \ fname =~ 'NERD_tree' ? '' :
                \ fname == 'undotree_2' ? '' :
                \ fname == 'diffpanel_3' ? '' :
                \ fname =~ '__Tagbar__' ? '' :
                \ fname == 'Startify' ? '' :
                \ &ft   == 'qf' ? '' :
                \ winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
    let fname = expand('%:t')
    return fname == 'ControlP' ? '' :
                \ fname =~ 'NERD_tree' ? '' :
                \ fname == 'undotree_2' ? '' :
                \ fname == 'diffpanel_3' ? '' :
                \ fname =~ '__Tagbar__' ? '' :
                \ fname == 'Startify' ? '' :
                \ &ft   == 'qf' ? '' :
                \ &fenc == 'utf-8' ? '' :
                \ winwidth(0) > 70 ? (strlen(&fenc) ? &fenc . g:lightline.leftseparator :
                \ &enc . g:lightline.leftseparator) : ''
endfunction

" CtrlP
let g:ctrlp_status_func = { 'main': 'CtrlPStatusFunc_1' }

function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
    let g:lightline.ctrlp_regex = a:regex
    let g:lightline.ctrlp_item = a:item
    return lightline#statusline(0)
endfunction

" Tagbar
let g:tagbar_status_func = 'TagbarStatusFunc'

function! TagbarStatusFunc(current, sort, fname, ...) abort
    let g:lightline.fname = a:fname
    return lightline#statusline(0)
endfunction

" Syntastic
" augroup AutoSyntastic
"     autocmd!
"     autocmd BufWritePost * call s:syntastic()
" augroup END
" function! s:syntastic()
"     SyntasticCheck
"     call lightline#update()
" endfunction
