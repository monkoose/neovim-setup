Plug 'monkoose/fzf.nvim'

let s:fzf_big_float = 'call fzf#floating(36, 140)'
let s:fzf_defaults = [
      \ '--bind="alt-t:toggle-preview,ctrl-n:preview-page-down,ctrl-p:preview-page-up,ctrl-l:accept,' .
          \ 'ctrl-r:clear-screen,alt-p:next-history,alt-n:previous-history,ctrl-alt-j:page-down,ctrl-alt-k:page-up"',
      \ '--color=hl:#608bbf,fg+:#b8af96,hl+:#608bbf,bg+:#3b312b,border:#40362f,gutter:#272e22,pointer:#d35b4b,prompt:#c57c41,marker:#b2809f,info:#70a17c',
      \ '--layout=reverse --tabstop=2 --info=inline --margin=1,3 --exact'
      \ ]
let $FZF_DEFAULT_OPTS = join(s:fzf_defaults, " ")
let g:fzf_history_dir = '~/.local/share/nvim/fzf-history'
let g:fzf_command_prefix = 'Fzf'
command! -nargs=* FzfSearch call fzf#vim#ag(<q-args>, fzf#vim#with_preview({'window': s:fzf_big_float}, 'up:60%:wrap' ))
command! -nargs=* FzfGFiles call fzf#vim#gitfiles(<q-args>, {'options': '--preview-window up:60%', 'window': s:fzf_big_float})
command! FzfCommits call fzf#vim#commits({'options': '--preview-window up:60%', 'window': s:fzf_big_float})
command! FzfBCommits call fzf#vim#buffer_commits({'options': '--preview-window up:60%', 'window': s:fzf_big_float})

augroup FzfMapsAu
  autocmd!
  autocmd FileType fzf tnoremap <M-q> <Esc>
augroup END

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

nmap <silent>    <space>;        :FzfBuffers<CR>
nmap <silent>    <space>ff       :FzfFiles<CR>
nmap <silent>    <space>fg       :FzfGFiles?<CR>
nmap <silent>    <space>fc       :FzfCommits<CR>
nmap <silent>    <space>fb       :FzfBCommits<CR>
nmap <silent>    <space>fm       :FzfHistory<CR>
nmap <silent>    <space>fk       :FzfMaps<CR>
nmap <silent>    <space>ss       :FzfSearch<CR>
nmap <silent>    <space>sb       :FzfBLines<CR>
nmap <silent>    <space>sl       :FzfLines<CR>
"nmap <silent>    <space>ft     :FzfBTags<CR>
" nmap <silent>    <space>fa     :FzfTags<CR>

augroup HoogleMaps
  autocmd!
  autocmd FileType haskell nnoremap <buffer>   <space>hh :Hoogle <c-r>=expand("<cword>")<CR><CR>
augroup END
