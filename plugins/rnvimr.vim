Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}

let g:rnvimr_ex_enable = 1
let g:rnvimr_pick_enable = 1
let g:rnvimr_bw_enable = 1

nmap        <silent>    <M-`>    :RnvimrToggle<CR>
tnoremap    <silent>    <M-`>    <C-\><C-n>:RnvimrToggle<CR>
