let g:lightline = {
        \ 'colorscheme': 'boa',
        \ 'active': {
                \ 'left':  [ [ 'column', 'mode', 'paste', 'spell' ], [ 'fugitive', 'filename' ] ],
                \ 'right': [ [ 'syntastic', 'percent' ], [ 'virtualenv', 'fileformat', 'fileencoding', 'filetype', 'cwd' ] ]
        \ },
        \ 'inactive': {
                \ 'left':  [ [ 'inactivemode' ] ],
                \ 'right': [ [ 'percent' ], [ 'filename' ] ]
        \ },
        \ 'component_function': {
                \ 'cwd':           'LightLineCWD',
                \ 'paste':         'LightLinePaste',
                \ 'column':        'LightLineColumn',
                \ 'spell':         'LightLineSpell',
                \ 'fugitive':      'LightLineFugitive',
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

let g:lightline.leftseparator  = '  ●'
let g:lightline.rightseparator = '●  '

function! LightLinePaste()
    return &paste ? 'P' . g:lightline.leftseparator : ''
endfunction

function! LightLineSpell()
    return &spell ? 'S' . g:lightline.leftseparator : ''
endfunction

function! LightLineCWD()
    return winwidth(0) > 60 && expand('%:t') == 'ControlP' ? getcwd() : ''
endfunction

function! LightLineVenv()
    return &ft =~# 'python'
                \ &&winwidth(0) > 70
                \ && $VIRTUAL_ENV != '' ? printf('(%s)', fnamemodify($VIRTUAL_ENV, ':t')) : ''
endfunction

function! LightLineColumn()
    let fname = expand('%:t')
    return fname =~ '__Tagbar__' ? '' :
                \ fname == 'ControlP' ? '' :
                \ fname == 'undotree_2' ? '' :
                \ fname == 'diffpanel_3' ? '' :
                \ fname =~ 'NERD_tree' ? '' :
                \ &ft   == 'qf' ? '' :
                \ printf('%2d', col('.')) . g:lightline.leftseparator
endfunction

function! LightLinePercent()
    let fname = expand('%:t')
    return fname =~ '__Tagbar__' ? '' :
                \ fname == 'ControlP' ? '' :
                \ fname == 'undotree_2' ? '' :
                \ fname == 'diffpanel_3' ? '' :
                \ fname =~ 'NERD_tree' ? '' :
                \ &ft   == 'qf' ? line('$') :
                \ g:lightline.rightseparator . LightLinePercentHelper()
endfunction

function! LightLinePercentHelper()
    return line('w0') == 1 ? 'Top' :
                \ line('w$') == line('$') ? 'Bot' :
                \ printf('%2.0f', (100.0 * line('.') / line('$'))) . '%'
endfunction

function! LightLineModified()
    return &ft =~ 'help' ? '' : &modified ? '¦ +' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
    return &ft !~? 'help' && &readonly ? 'RO ¦' : ''
endfunction

function! LightLineFilename()
    let fname = expand('%:t')
    if fname =~ 'ControlP'
        call lightline#link('iR'[g:lightline.ctrlp_regex])
    endif
    return fname == 'ControlP' ? g:lightline.ctrlp_item :
                \ fname =~ '__Tagbar__' ? g:lightline.rightseparator . g:lightline.fname :
                \ fname =~ 'undotree_2\|diffpanel_3\|NERD_tree' ? '' :
                \ &ft == 'qf' ? '' :
                \ ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
                \ ('' != fname ? fname : '[No Name]') .
                \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineMode()
    let fname = expand('%:t')
    return fname =~ '__Tagbar__' ? 'Tagbar' :
                \ fname == 'ControlP' ? 'CtrlP' . g:lightline.leftseparator :
                \ fname == 'undotree_2' ? 'UndoTree' :
                \ fname == 'diffpanel_3' ? 'diff' :
                \ fname =~ 'NERD_tree' ? 'NERDTree' :
                \ fname == 'LocationList' ? 'LocationList' :
                \ &ft == 'qf' ? 'QuickFix' :
                \ winwidth(0) > 60 ? lightline#mode() . g:lightline.leftseparator : ''
endfunction

function! LightLineFugitive()
    try
        if expand('%:t') !~? 'Tagbar\|undotree_2\|diffpanel_3\|NERD_tree' && exists('*fugitive#head')
            let mark = ' '
            let _ = fugitive#head()
            return strlen(_) ? mark._ . g:lightline.leftseparator : ''
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
    return fname =~ '__Tagbar__' ? '' :
                \ fname == 'ControlP' ? '' :
                \ fname == 'undotree_2' ? '' :
                \ fname == 'diffpanel_3' ? '' :
                \ fname =~ 'NERD_tree' ? '' :
                \ &ft   == 'qf' ? '' :
                \ winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
    let fname = expand('%:t')
    return fname =~ '__Tagbar__' ? '' :
                \ fname == 'ControlP' ? '' :
                \ fname == 'undotree_2' ? '' :
                \ fname == 'diffpanel_3' ? '' :
                \ fname =~ 'NERD_tree' ? '' :
                \ &ft   == 'qf' ? '' :
                \ &fenc == 'utf-8' ? '' :
                \ winwidth(0) > 70 ? (strlen(&fenc) ? &fenc . g:lightline.leftseparator :
                \ &enc . g:lightline.leftseparator) : ''
endfunction


function! LightLineInactiveMode()
    let fname = expand('%:t')
    return fname =~ '__Tagbar__' ? 'Tagbar' :
                \ fname == 'ControlP' ? 'CtrlP' :
                \ fname == 'undotree_2' ? 'UndoTree' :
                \ fname == 'diffpanel_3' ? 'diff' :
                \ fname =~ 'NERD_tree' ? 'NERDTree' :
                \ fname == 'LocationList' ? 'LocationList' :
                \ &ft == 'qf' ? 'QuickFix' : ''
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
