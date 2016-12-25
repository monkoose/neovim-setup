" =============================================================================
" Filename: autoload/lightline/colorscheme/boa.vim
" Author: monkoose
" License: MIT License
" Last Change: 2016-12-14
" =============================================================================
"   --- colorpallete ---
let s:foreground         = [ '#d5c4a1', 250 ]
let s:white              = [ '#fbf1c7', 252 ]
let s:black              = [ '#0F0A01', 234 ]
let s:gray               = [ '#665c54', 240 ]
let s:red                = [ '#8f3f3f', 52  ]
let s:purple             = [ '#8f3f71', 54  ]
let s:blue               = [ '#1f444d', 25  ]
let s:green              = [ '#65790e', 22  ]
let s:orange             = [ '#d65d0e', 94  ]
let s:brightred          = [ '#cc241d', 88  ]

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

"  --- selection ---     = [ [ fgfirst        bgfirst   fmt    ], [ fgsecond       bgsecond ] ]
let s:p.normal.left      = [ [ s:foreground,  s:blue,   'bold' ], [ s:foreground,  s:blue   ] ]
let s:p.normal.right     = [ [ s:foreground,  s:blue,   'bold' ], [ s:foreground,  s:blue   ] ]
let s:p.insert.left      = [ [ s:white,       s:green,  'bold' ], [ s:white,       s:green  ] ]
let s:p.insert.right     = [ [ s:white,       s:green,  'bold' ], [ s:white,       s:green  ] ]
let s:p.visual.left      = [ [ s:foreground,  s:purple, 'bold' ], [ s:foreground,  s:purple ] ]
let s:p.visual.right     = [ [ s:foreground,  s:purple, 'bold' ], [ s:foreground,  s:purple ] ]
let s:p.replace.left     = [ [ s:foreground,  s:red,    'bold' ], [ s:foreground,  s:red    ] ]
let s:p.replace.right    = [ [ s:foreground,  s:red,    'bold' ], [ s:foreground,  s:red    ] ]
let s:p.inactive.right   = [ [ s:gray,        s:black          ], [ s:gray,        s:black  ] ]
let s:p.inactive.left    = [ [ s:gray,        s:black          ], [ s:gray,        s:black  ] ]
"  --- middle ---        = [ [    fg           bg              ] ]
let s:p.normal.middle    = [ [ s:foreground,  s:blue           ] ]
let s:p.insert.middle    = [ [ s:white,       s:green          ] ]
let s:p.visual.middle    = [ [ s:foreground,  s:purple         ] ]
let s:p.replace.middle   = [ [ s:foreground,  s:red            ] ]
let s:p.inactive.middle  = [ [ s:gray,        s:black          ] ]
"  --- tabline ---       = [ [    fg           bg              ] ]
let s:p.tabline.left     = [ [ s:gray,        s:black          ] ]
let s:p.tabline.tabsel   = [ [ s:green,       s:black,  'bold' ] ]
let s:p.tabline.middle   = [ [ s:gray,        s:black          ] ]
let s:p.tabline.right    = [ [ s:green,       s:black,  'bold' ] ]
"  --- errors ---        = [ [    fg             bg            ] ]
let s:p.normal.error     = [ [ s:foreground,  s:brightred      ] ]
let s:p.normal.warning   = [ [ s:foreground,  s:orange         ] ]

let g:lightline#colorscheme#boa#palette = lightline#colorscheme#flatten(s:p)
