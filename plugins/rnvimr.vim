Plug 'kevinhwang91/rnvimr', {'do': 'make sync', 'on': 'RnvimrToggle'}

let g:rnvimr_enable_ex = 1
let g:rnvimr_enable_bw = 1
let g:rnvimr_enable_picker = 1
let g:rnvimr_hide_gitignore = 1

nmap        <silent>    <M-1>    :RnvimrToggle<CR>
tnoremap    <silent>    <M-1>    <C-\><C-n>:RnvimrToggle<CR>
