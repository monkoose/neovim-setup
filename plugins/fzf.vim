Plug 'monkoose/fzf.nvim'

let s:fzf_big_float = 'call fzf#floating(36, 140)'
let s:fzf_defaults = [
      \ '--bind="alt-t:toggle-preview,alt-i:toggle-all,ctrl-n:preview-page-down,ctrl-p:preview-page-up,ctrl-l:accept,' .
          \ 'ctrl-r:clear-screen,alt-p:next-history,alt-n:previous-history,ctrl-alt-j:page-down,ctrl-alt-k:page-up"',
      \ '--color=hl:#608bbf,fg+:#b8af96,hl+:#608bbf,bg+:#3b312b,border:#40362f,gutter:#272e22,pointer:#d35b4b,prompt:#c57c41,marker:#b2809f,info:#70a17c',
      \ '--layout=reverse --tabstop=2 --info=inline --margin=1,3 --exact'
      \ ]
let $FZF_DEFAULT_OPTS = join(s:fzf_defaults, " ")
let g:fzf_history_dir = '~/.local/share/nvim/fzf-history'
let g:fzf_command_prefix = 'Fzf'
command! -nargs=* FzfGFiles call fzf#vim#gitfiles(<q-args>, {'options': '--preview-window up:60%', 'window': s:fzf_big_float})
command! FzfCommits call fzf#vim#commits({'options': '--preview-window up:60%', 'window': s:fzf_big_float})
command! FzfBCommits call fzf#vim#buffer_commits({'options': '--preview-window up:60%', 'window': s:fzf_big_float})

imap <c-x><c-k> <plug>(fzf-complete-file)
imap <c-x><c-l> <plug>(fzf-complete-line)
imap <c-x><c-f> <plug>(fzf-complete-file-rg)
nmap <silent>    <space>;        :FzfBuffers<CR>
nmap <silent>    <space>ff       :FzfFiles<CR>
nmap <silent>    <space>fg       :FzfGFiles?<CR>
nmap <silent>    <space>fc       :FzfCommits<CR>
nmap <silent>    <space>fb       :FzfBCommits<CR>
nmap <silent>    <space>fm       :FzfHistory<CR>
nmap <silent>    <space>fk       :FzfMaps<CR>
nmap <silent>    <space>ss       :FzfRg<CR>
nmap <silent>    <space>sS       :FzfRgFull<CR>
nmap <silent>    <space>sb       :FzfBLines<CR>
nmap <silent>    <space>sl       :FzfLines<CR>
nmap <silent>    <space>sw       :FzfRg <c-r>=expand("<cword>")<CR><CR>
nmap <silent>    <space>fl       :FzfLocationList<CR>
nmap <silent>    <space>fq       :FzfQuickfix<CR>
"nmap <silent>    <space>ft     :FzfBTags<CR>
"nmap <silent>    <space>fa     :FzfTags<CR>

augroup HoogleMaps
  autocmd!
  autocmd FileType haskell nnoremap <buffer>   <space>hh :Hoogle <c-r>=expand("<cword>")<CR><CR>
augroup END
let g:hoogle_fzf_header = ''

command! FzfQuickfix call s:quickfix(1)
command! FzfLocationList call s:quickfix(0)

function! s:open_quickfix_item(e) abort
  let line = a:e
  let filename = fnameescape(split(line, ':\d\+:')[0])
  let linenr = matchstr(line, ':\d\+:')[1:-2]
  let colum = matchstr(line, '\(:\d\+\)\@<=:\d\+:')[1:-2]
  exe 'e ' . filename
  call cursor(linenr, colum)
endfunction

function! s:quickfix_to_grep(v) abort
  return bufname(a:v.bufnr) . ':' . a:v.lnum . ':' . a:v.col . ':' . a:v.text
endfunction

function! s:quickfix_list(nr) abort
  if a:nr == 1
    return map(getqflist(), 's:quickfix_to_grep(v:val)')
  else
    return map(getloclist(0), 's:quickfix_to_grep(v:val)')
  endif
endfunction

function! s:quickfix(nr) abort
  call fzf#run(fzf#wrap('quickfix', {
        \ 'source':  reverse(s:quickfix_list(a:nr)),
        \ 'sink':    function('s:open_quickfix_item'),
        \ 'options': '--reverse',
        \ }))
endfunction
