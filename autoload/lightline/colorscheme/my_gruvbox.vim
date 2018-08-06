" =============================================================================
" Filename: autoload/lightline/colorscheme/my_gruvbox.vim
" Author: monkoose
" License: MIT License
" Last Change: 2018-07-24
" =============================================================================
" "   --- colorpallete ---
" let s:foreground         = [ '#d6c8a2', 250 ]
" let s:white              = [ '#fbf1c7', 252 ]
" let s:blue               = [ '#303e39', 234 ]
" let s:gray               = [ '#827963', 240 ]
" let s:red                = [ '#b43425', 52  ]
" let s:magenta            = [ '#80515e', 52  ]
" let s:green              = [ '#7c7e1d', 54  ]
" let s:brown              = [ '#48382f', 25  ]
" let s:yellow             = [ '#a47c1f', 22  ]
" let s:orange             = [ '#bd5f13', 94  ]

" let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

" "  --- selection ---     = [ [ fgfirst        bgfirst     fmt   ], [ fgsecond       bgsecond  ] ]
" let s:p.normal.left      = [ [ s:foreground,  s:brown,   'bold' ], [ s:foreground,  s:brown   ] ]
" let s:p.normal.right     = [ [ s:foreground,  s:brown,   'bold' ], [ s:foreground,  s:brown   ] ]
" let s:p.insert.left      = [ [ s:white,       s:green,   'bold' ], [ s:white,       s:green   ] ]
" let s:p.insert.right     = [ [ s:white,       s:green,   'bold' ], [ s:white,       s:green   ] ]
" let s:p.visual.left      = [ [ s:white,       s:yellow,  'bold' ], [ s:white,       s:yellow  ] ]
" let s:p.visual.right     = [ [ s:white,       s:yellow,  'bold' ], [ s:white,       s:yellow  ] ]
" let s:p.replace.left     = [ [ s:white,       s:magenta, 'bold' ], [ s:white,       s:magenta ] ]
" let s:p.replace.right    = [ [ s:white,       s:magenta, 'bold' ], [ s:white,       s:magenta ] ]
" let s:p.inactive.right   = [ [ s:gray,        s:blue            ], [ s:gray,        s:blue    ] ]
" let s:p.inactive.left    = [ [ s:gray,        s:blue            ], [ s:gray,        s:blue    ] ]
" "  --- middle ---        = [ [    fg           bg               ] ]
" let s:p.normal.middle    = [ [ s:foreground,  s:brown           ] ]
" let s:p.insert.middle    = [ [ s:white,       s:green           ] ]
" let s:p.visual.middle    = [ [ s:white,       s:yellow          ] ]
" let s:p.replace.middle   = [ [ s:white,       s:magenta         ] ]
" let s:p.inactive.middle  = [ [ s:gray,        s:blue            ] ]
" "  --- tabline ---       = [ [    fg           bg               ] ]
" let s:p.tabline.left     = [ [ s:gray,        s:brown           ] ]
" let s:p.tabline.tabsel   = [ [ s:yellow,      s:brown,   'bold' ] ]
" let s:p.tabline.middle   = [ [ s:gray,        s:brown           ] ]
" let s:p.tabline.right    = [ [ s:yellow,      s:brown,   'bold' ] ]
" "  --- errors ---        = [ [    fg           bg               ] ]
" let s:p.normal.error     = [ [ s:white,       s:red             ] ]
" let s:p.normal.warning   = [ [ s:white,       s:orange          ] ]

" let g:lightline#colorscheme#my_gruvbox#palette = lightline#colorscheme#flatten(s:p)

let s:p = {'inactive': {'right': [['#827963', '#303e39', 240, 234], ['#827963', '#303e39', 240, 234]], 'middle': [['#827963', '#303e39', 240, 234]], 'left': [['#827963', '#303e39', 240, 234], ['#827963', '#303e39', 240, 234]]}, 'replace': {'right': [['#fbf1c7', '#80515e', 252, 52, 'bold'], ['#fbf1c7', '#80515e', 252, 52]], 'middle': [['#fbf1c7', '#80515e', 252, 52]], 'left': [['#fbf1c7', '#80515e', 252, 52, 'bold'], ['#fbf1c7', '#80515e', 252, 52]]}, 'normal': {'right': [['#d6c8a2', '#48382f', 250, 25, 'bold'], ['#d6c8a2', '#48382f', 250, 25]], 'middle': [['#d6c8a2', '#48382f', 250, 25]], 'warning': [['#fbf1c7', '#bd5f13', 252, 94]], 'left': [['#d6c8a2', '#48382f', 250, 25, 'bold'], ['#d6c8a2', '#48382f', 250, 25]], 'error': [['#fbf1c7', '#b43425', 252, 52]]}, 'tabline': {'right': [['#a47c1f', '#48382f', 22, 25, 'bold']], 'middle': [['#827963', '#48382f', 240, 25]], 'left': [['#827963', '#48382f', 240, 25]], 'tabsel': [['#a47c1f', '#48382f', 22, 25, 'bold']]}, 'visual': {'right': [['#fbf1c7', '#a47c1f', 252, 22, 'bold'], ['#fbf1c7', '#a47c1f', 252, 22]], 'middle': [['#fbf1c7', '#a47c1f', 252, 22]], 'left': [['#fbf1c7', '#a47c1f', 252, 22, 'bold'], ['#fbf1c7', '#a47c1f', 252, 22]]}, 'insert': {'right': [['#fbf1c7', '#7c7e1d', 252, 54, 'bold'], ['#fbf1c7', '#7c7e1d', 252, 54]], 'middle': [['#fbf1c7', '#7c7e1d', 252, 54]], 'left': [['#fbf1c7', '#7c7e1d', 252, 54, 'bold'], ['#fbf1c7', '#7c7e1d', 252, 54]]}}
let g:lightline#colorscheme#my_gruvbox#palette = s:p
