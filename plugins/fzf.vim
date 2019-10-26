Plug 'junegunn/fzf.vim'

let g:fzf_layout = { 'window': 'call FzfFloating(14, 80)' }

function! FzfFloating(lines, columns) abort
  let buf = nvim_create_buf(v:false, v:true)
  call setbufvar(buf, '&signcolumn', 'no')

  let height = float2nr(a:lines)
  let width = float2nr(a:columns)
  let horizontal = float2nr((&columns - width) / 2)
  let vertical = float2nr((&lines - height) / 2)

  let opts = {
        \ 'relative': 'editor',
        \ 'row': vertical,
        \ 'col': horizontal,
        \ 'width': width,
        \ 'height': height,
        \ 'style': 'minimal'
        \ }
  call nvim_open_win(buf, v:true, opts)
endfunction

" --preview 'if file -i {}|grep -q binary; then file -b {}; else bat --style=changes --color always --line-range :40 {}; fi'
let g:fzf_big_float = 'call FzfFloating(36, 140)'
let g:fzf_my_defaults = ' --margin=1,3 --header="" --color=gutter:#272e22'
let g:fzf_command_prefix = 'F'
command! FFiles call fzf#vim#files(<q-args>, {'options': g:fzf_my_defaults})
command! -nargs=* FSearch call fzf#vim#ag(<q-args>, fzf#vim#with_preview({'options': g:fzf_my_defaults, 'window': g:fzf_big_float}, 'up:60%:wrap' ))
command! -nargs=* FGFiles call fzf#vim#gitfiles(<q-args>, {'options': '--preview-window up:60%'.g:fzf_my_defaults, 'window': g:fzf_big_float})
command! FCommits call fzf#vim#commits({'options': '--preview-window up:60%'.g:fzf_my_defaults, 'window': g:fzf_big_float})
command! FBCommits call fzf#vim#buffer_commits({'options': '--preview-window up:60%'.g:fzf_my_defaults, 'window': g:fzf_big_float})

augroup FzfMapsAu
  autocmd!
  autocmd FileType fzf tnoremap <M-q> <Esc>
augroup END

" fzf plugin bindings
nmap              <space>;     :FBuffers<CR>
nmap              <space>ff     :FFiles<CR>
nmap              <space>fg     :FGFiles?<CR>
" nmap              <space>ft     :FBTags<CR>
" nmap              <space>fa     :FTags<CR>
nmap              <space>fc     :FCommits<CR>
nmap              <space>fb     :FBCommits<CR>
nmap              <space>fm     :FHistory<CR>
nmap              <space>fk     :FMaps<CR>
nmap              <space>ss     :FSearch<CR>
nmap              <space>sb     :FBLines<CR>
nmap              <space>sl     :FLines<CR>

" Open QuickFix with marked items from fzf
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
