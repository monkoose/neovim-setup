let g:python3_host_prog = '/usr/bin/python'

call plug#begin('~/.local/share/nvim/plugged')

Plug 'kassio/neoterm'                         " for better terminal experience
Plug 'monkoose/gruvbox'                       " adds colorscheme
Plug 'tpope/vim-repeat'                       " makes '.' command more usable
Plug 'tpope/vim-eunuch'                       " adds sugar common UNIX shell commands
Plug 'tpope/vim-fugitive'                     " adds git support inside vim
Plug 'tpope/vim-surround'                     " makes manipulating with (),[],''... enjoyable
Plug 'tpope/vim-unimpaired'                   " adds common toggling options, new ] and [ commands, encoding/decoding
Plug 'tpope/vim-commentary'                   " for faster line commenting/uncommenting
Plug 'Konfekt/FastFold'                       " makes non manual folds faster
Plug 'junegunn/fzf.vim'                       " for fast searching of different sources
Plug 'eugen0329/vim-esearch'                  " for grepping results in treelike style
Plug 'junegunn/vim-easy-align'                " adds aligning of text
Plug 'jamessan/vim-gnupg'                     " for editing gpg files
Plug 'zhimsel/vim-stay'                       " for remembering session/cursor position
Plug 'mhinz/vim-startify'                     " adds welcome screen

Plug 'SirVer/ultisnips'                       " adds snippets support
Plug 'honza/vim-snippets'                     " adds snippets support

Plug 'wellle/targets.vim'                     " adds new targets like in( or 2alB
Plug 'airblade/vim-gitgutter'                 " makes vcs changes visible
Plug 'Raimondi/delimitMate'                   " adds auto pairs
Plug 'tyru/open-browser.vim'                  " for better links opening with a browser
Plug 'itchyny/lightline.vim'                  " adds configurable yet fast statusline
Plug 'skywind3000/asyncrun.vim'               " adds support to asynchronously run shell commands
Plug 'Shougo/context_filetype.vim'            " adds better support for different languages in one file
Plug 'easymotion/vim-easymotion'              " for easier jumps to any position on the screen
Plug 'Shougo/neco-vim'                        " adds completion for vim filetypes
Plug 'vimwiki/vimwiki'                        " adds wiki and ToDo in vim
Plug 'mbbill/undotree'                        " for visualizing undo history
Plug 'lambdalisue/vim-gista'                  " adds gist support
Plug 'Shougo/echodoc.vim'                     " adds parameters help for functions
Plug 'w0rp/ale'                               " adds asynchronous linting

Plug 'idanarye/vim-dutyl'                     " adds ide features for dlang
Plug 'monkoose/deoplete-d'                    " adds completion source for dlang

Plug 'neovimhaskell/haskell-vim'              " improves haskell syntax and indentation
Plug 'Twinside/vim-hoogle'                    " for hoogle searching inside vim

Plug 'tbastos/vim-lua'                        " improves lua syntax highlighting and indentation
Plug 'monkoose/luarefvim'                     " adds lua reference docs
Plug 'xolox/vim-misc'                         " required by vim-lua-ftplugin
Plug 'xolox/vim-lua-ftplugin'                 " adds completions for lua

Plug 'tweekmonster/django-plus.vim'           " makes working with django easier
Plug 'Glench/Vim-Jinja2-Syntax'               " adds jinja templates syntax highlighting
Plug 'zchee/deoplete-jedi'                    " adds completion source for python
Plug 'davidhalter/jedi-vim'                   " adds ide features for python
Plug 'vim-python/python-syntax'               " improves python syntax highlighting
Plug 'Vimjas/vim-python-pep8-indent'          " improves python indentation

Plug 'hail2u/vim-css3-syntax'                 " improves CSS syntax highlighting
Plug 'othree/html5.vim'                       " improves HTML syntax highlighting
Plug 'pangloss/vim-javascript'                " improves JavaScript syntax highlighting and indentation
Plug 'godlygeek/tabular', {'for': 'markdown'} " required by vim-markdown
Plug 'plasticboy/vim-markdown'                " improves markdown syntax highlighting
Plug 'othree/javascript-libraries-syntax.vim' " adds syntax highlighting of the popular js libraries

Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}            " adds sidebar file explorer
Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}     " adds autocompletion engine
Plug 'autozimu/LanguageClient-neovim', {
      \ 'branch': 'next',
      \ 'do': './install.sh'}                                   " adds lsp support
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'} " required by fzf.vim

call plug#end()
