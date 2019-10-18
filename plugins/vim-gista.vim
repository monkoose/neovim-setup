Plug 'lambdalisue/vim-gista'                  " adds gist support

let g:gista#client#default_username = "monkoose"
nnoremap          <space>gl     :Gista list<CR>
nnoremap          <space>gp     :Gista post -P -d=""<Left>
nnoremap          <space>gP     :Gista patch<CR>
