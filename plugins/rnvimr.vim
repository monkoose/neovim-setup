Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}

let g:rnvimr_ex_enable = 1
let g:rnvimr_pick_enable = 1
let g:rnvimr_bw_enable = 1

nmap        <silent>    <M-1>    :RnvimrToggle<CR>
tnoremap    <silent>    <M-1>    <C-\><C-n>:RnvimrToggle<CR>
