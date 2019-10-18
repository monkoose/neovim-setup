" set statusline=%<%4*%{ALEStatusLine()}%*\ %f\ \ %h%m%r\ \ %{MyGitStatus()}%=%-12.(%l,%c%V%)\ %y\ \ %P\ 
set statusline=%<\ %f\ \ %h%m%r\ \ %{MyGitStatus()}%=%-12.(%l,%c%V%)\ %y\ \ %P\ 

augroup StatusLineColor
  autocmd!
  au InsertEnter * hi StatusLine guifg=#221111 guibg=#7c7e1d
  au InsertLeave * hi StatusLine guifg=#b8af96 guibg=#48382f
augroup END

augroup SetStatusLine
  autocmd!
  autocmd FileType fugitiveblame setlocal statusline=%<\ %(%l/%L%)\ %=%P\ 
augroup END

function! MyGitStatus() abort
  try
    if exists('*fugitive#head')
      let l:gitbranch = FugitiveStatusline()
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
      let l:gitinfo = ' ' . l:gitbranch . l:gitgutter
      return strlen(l:gitbranch) && winwidth(0) > 50 ? l:gitinfo : ''
    endif
  catch
  endtry
  return ''
endfunction

" function! ALEStatusLine() abort
"   let l:counts = ale#statusline#Count(bufnr(''))
"   let l:all_errors = l:counts.error + l:counts.style_error
"   let l:all_non_errors = l:counts.total - l:all_errors
"   return l:counts.total == 0 ? '' : printf('  E:%d W:%d ', all_errors, all_non_errors)
" endfunction
