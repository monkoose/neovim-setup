" Plugins without custom config
Plug 'monkoose/boa.vim'                              " adds colorscheme
Plug 'tpope/vim-repeat'                              " makes '.' command more usable
Plug 'tpope/vim-eunuch'                              " adds sugar common UNIX shell commands
Plug 'tpope/vim-surround'                            " makes manipulating with (),[],''... enjoyable
Plug 'tpope/vim-unimpaired'                          " adds common toggling options, new ] and [ commands, encoding/decoding
Plug 'Konfekt/FastFold'                              " makes non manual folds faster
Plug 'tomtom/tcomment_vim'                           " adds easy lines commenting
Plug 'zhimsel/vim-stay'                              " for remembering session/cursor position
Plug 'Shougo/context_filetype.vim'                   " adds better support for different languages in one file
Plug 'neovimhaskell/haskell-vim'                     " improves haskell syntax and indentation
Plug 'tbastos/vim-lua'                               " improves lua syntax highlighting and indentation
Plug 'Vimjas/vim-python-pep8-indent'                 " improves python indentation
Plug 'hail2u/vim-css3-syntax'                        " improves CSS syntax highlighting
Plug 'cakebaker/scss-syntax.vim'                     " add scss syntax highlighting
Plug 'othree/html5.vim'                              " improves HTML syntax highlighting
Plug 'pangloss/vim-javascript'                       " improves JavaScript syntax highlighting and indentation
Plug 'honza/vim-snippets'                            " adds snippets support
Plug 'monkoose/fzf-hoogle.vim'                       " adds hoogle preview

" Plugins with custom config
source $HOME/.config/nvim/plugins/coc.vim            " adds autocompletion and langserver
source $HOME/.config/nvim/plugins/delimitMate.vim    " adds auto pairs
source $HOME/.config/nvim/plugins/fzf.vim            " adds fuzzy finder for multiple sources
source $HOME/.config/nvim/plugins/gv.vim             " git log for vim
source $HOME/.config/nvim/plugins/neoterm.vim        " for better terminal experience
source $HOME/.config/nvim/plugins/nerdtree.vim       " adds sidebar file explorer
source $HOME/.config/nvim/plugins/open-browser.vim   " for better links opening with a browser
source $HOME/.config/nvim/plugins/python-syntax.vim  " improves python syntax highlighting
source $HOME/.config/nvim/plugins/targets.vim        " adds new targets like in( or 2alB
source $HOME/.config/nvim/plugins/undotree.vim       " for visualizing undo history
source $HOME/.config/nvim/plugins/vim-easy-align.vim " adds aligning of text
source $HOME/.config/nvim/plugins/vim-easymotion.vim " for easier jumps to any position on the screen
source $HOME/.config/nvim/plugins/vim-fugitive.vim   " adds git support inside vim
source $HOME/.config/nvim/plugins/vim-gista.vim      " adds gist support
source $HOME/.config/nvim/plugins/vim-grammarous.vim " adds grammar checking with languagetool
source $HOME/.config/nvim/plugins/vim-hexokinase.vim " show colors preview

" Plug 'othree/javascript-libraries-syntax.vim' " adds syntax highlighting of the popular js libraries
