" Plugins without custom config
Plug 'monkoose/gruvbox'                       " adds colorscheme
Plug 'tpope/vim-repeat'                       " makes '.' command more usable
Plug 'tpope/vim-eunuch'                       " adds sugar common UNIX shell commands
Plug 'tpope/vim-surround'                     " makes manipulating with (),[],''... enjoyable
Plug 'tpope/vim-unimpaired'                   " adds common toggling options, new ] and [ commands, encoding/decoding
Plug 'Konfekt/FastFold'                       " makes non manual folds faster
Plug 'tomtom/tcomment_vim'                    " adds easy lines commenting
Plug 'junegunn/gv.vim'                        " git log for vim
Plug 'junegunn/vim-slash'                     " enchance search expirience
Plug 'zhimsel/vim-stay'                       " for remembering session/cursor position
Plug 'wellle/targets.vim'                     " adds new targets like in( or 2alB
Plug 'airblade/vim-gitgutter'                 " makes vcs changes visible
Plug 'Shougo/context_filetype.vim'            " adds better support for different languages in one file
Plug 'neovimhaskell/haskell-vim'              " improves haskell syntax and indentation
Plug 'bitc/vim-hdevtools'                     " adds :type and :info for haskell files
Plug 'tbastos/vim-lua'                        " improves lua syntax highlighting and indentation
Plug 'Vimjas/vim-python-pep8-indent'          " improves python indentation
Plug 'hail2u/vim-css3-syntax'                 " improves CSS syntax highlighting
Plug 'cakebaker/scss-syntax.vim'              " add scss syntax highlighting
Plug 'othree/html5.vim'                       " improves HTML syntax highlighting
Plug 'pangloss/vim-javascript'                " improves JavaScript syntax highlighting and indentation

" Plugins with custom config
source $HOME/.config/nvim/plugins/ale.vim
source $HOME/.config/nvim/plugins/coc.vim
source $HOME/.config/nvim/plugins/delimitMate.vim
source $HOME/.config/nvim/plugins/neoterm.vim
source $HOME/.config/nvim/plugins/nerdtree.vim
source $HOME/.config/nvim/plugins/open-browser.vim
source $HOME/.config/nvim/plugins/python-syntax.vim
source $HOME/.config/nvim/plugins/ultisnips.vim
source $HOME/.config/nvim/plugins/undotree.vim
source $HOME/.config/nvim/plugins/vim-easy-align.vim
source $HOME/.config/nvim/plugins/vim-easymotion.vim
source $HOME/.config/nvim/plugins/vim-fugitive.vim
source $HOME/.config/nvim/plugins/vim-gista.vim
source $HOME/.config/nvim/plugins/vim-hoogle.vim
source $HOME/.config/nvim/plugins/vim-markdown.vim

" Plug 'othree/javascript-libraries-syntax.vim' " adds syntax highlighting of the popular js libraries
" Plug 'skywind3000/asyncrun.vim'               " adds support to asynchronously run shell commands
" Plug 'vimwiki/vimwiki'                        " adds wiki and ToDo in vim
" let g:vimwiki_list = [{'path': '~/.vimwiki/'}]
