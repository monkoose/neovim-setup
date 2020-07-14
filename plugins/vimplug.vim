" Plugins without custom config
Plug 'monkoose/boa.vim'                                   " adds colorscheme
Plug 'tpope/vim-repeat'                                   " makes '.' command more usable
Plug 'tpope/vim-surround'                                 " makes manipulating with (),[],''... enjoyable
Plug 'tpope/vim-unimpaired'                               " adds common toggling options, new ] and [ commands, encoding/decoding
Plug 'tpope/vim-scriptease'                               " adds help commands for vimscripting
Plug 'neovimhaskell/haskell-vim', {'for': ['haskell']}    " improves haskell syntax and indentation
Plug 'tbastos/vim-lua', {'for': ['lua']}                  " improves lua syntax highlighting and indentation
Plug 'Vimjas/vim-python-pep8-indent', {'for': ['python']} " improves python indentation
Plug 'hail2u/vim-css3-syntax'                             " improves CSS syntax highlighting
Plug 'cakebaker/scss-syntax.vim'                          " add scss syntax highlighting
Plug 'othree/html5.vim'                                   " improves HTML syntax highlighting
Plug 'pangloss/vim-javascript'                            " improves JavaScript syntax highlighting and indentation
Plug 'honza/vim-snippets'                                 " adds snippets support
Plug 'monkoose/fzf-hoogle.vim'                            " adds hoogle preview
Plug 'cespare/vim-toml', {'for': ['toml']}                " adds toml highlighting
Plug 'evanleck/vim-svelte', {'for': ['svelte']}           " adds svelte highlighting
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" Plugins with custom config
runtime plugins/coc.vim            " adds autocompletion and langserver
runtime plugins/delimitMate.vim    " adds auto pairs
runtime plugins/fzf.vim            " adds fuzzy finder for multiple sources
runtime plugins/nuake.vim          " for better terminal experience
runtime plugins/racket.vim         " adds racket plugins
runtime plugins/reply.vim          " adds repl
runtime plugins/rnvimr.vim         " adds ranger support in neovim
runtime plugins/targets.vim        " adds new targets like in( or 2alB
runtime plugins/tcomment.vim       " adds easy lines commenting
runtime plugins/undotree.vim       " for visualizing undo history
runtime plugins/vim-easy-align.vim " adds aligning of text
runtime plugins/vim-easymotion.vim " for easier jumps to any position on the screen
runtime plugins/vim-fugitive.vim   " adds git support inside vim
runtime plugins/vim-gista.vim      " adds gist support
runtime plugins/vim-gitgutter.vim  " adds git signs
runtime plugins/vim-grammarous.vim " adds grammar checking with languagetool
runtime plugins/vim-hexokinase.vim " show colors preview
