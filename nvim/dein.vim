set runtimepath+=$HOME/.local/share/nvim/site/dein/repos/github.com/Shougo/dein.vim

if dein#load_state(expand('$HOME/.local/share/nvim/site/dein'))
  call dein#begin(expand('$HOME/.local/share/nvim/site/dein'))

  call dein#add('rking/ag.vim')
  call dein#add('kassio/neoterm')
  call dein#add('Shougo/dein.vim')
  call dein#add('tpope/vim-repeat')
  call dein#add('tpope/vim-eunuch')
  call dein#add('monkoose/boa.vim')
  call dein#add('Konfekt/FastFold')
  call dein#add('SirVer/ultisnips')
  call dein#add('majutsushi/tagbar')
  call dein#add('ctrlpvim/ctrlp.vim')
  call dein#add('jamessan/vim-gnupg')
  call dein#add('kopischke/vim-stay')
  call dein#add('mhinz/vim-startify')
  call dein#add('tpope/vim-fugitive')
  call dein#add('tpope/vim-surround')
  call dein#add('honza/vim-snippets')
  call dein#add('wellle/targets.vim')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('tpope/vim-unimpaired')
  call dein#add('tpope/vim-commentary')
  call dein#add('jiangmiao/auto-pairs')
  call dein#add('itchyny/lightline.vim')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('skywind3000/asyncrun.vim')
  call dein#add('easymotion/vim-easymotion')
  call dein#add('Shougo/neco-vim', {'on_ft': 'vim'})
  call dein#add('Shougo/vimproc.vim', {'build': 'make'})
  call dein#add('vimwiki/vimwiki', {'on_map': '<Plug>'})
  call dein#add('mbbill/undotree', {'on_cmd': ':UndotreeToggle'})
  call dein#add('scrooloose/nerdtree', {'on_cmd': ':NERDTreeToggle'})
  call dein#add('mattn/webapi-vim')
  call dein#add('mattn/gist-vim', {'on_cmd': ':Gist', 'depends': 'webapi-vim'})
  " echodoc makes input in insert mode laggy - disabled for now
  " call dein#add('Shougo/echodoc.vim', {'on_ft': ['vim', 'python', 'lua', 'javascript']})
  call dein#add('w0rp/ale', {'on_ft': ['python', 'javascript', 'html', 'css', 'lua', 'd']})
  "-------------------- dlang
  call dein#add('idanarye/vim-dutyl', {'on_ft': 'd'})
  call dein#add('monkoose/deoplete-d', {'on_ft': 'd'})
  "-------------------- lua
  call dein#add('xolox/vim-misc')
  call dein#add('monkoose/luarefvim')
  call dein#add('xolox/vim-lua-ftplugin', {'on_ft': 'lua',
                                         \ 'depends': ['vim-misc', 'luarefvim']})
  "------------------- python
  call dein#add('tweekmonster/django-plus.vim')
  call dein#add('zchee/deoplete-jedi', {'on_ft': 'python'})
  call dein#add('davidhalter/jedi-vim', {'on_ft': 'python'})
  call dein#add('vim-python/python-syntax', {'on_ft': 'python'})
  call dein#add('Vimjas/vim-python-pep8-indent', {'on_ft': 'python'})
  "------------------- frontend
  call dein#add('groenewege/vim-less', {'on_ft': 'less'})
  call dein#add('hail2u/vim-css3-syntax', {'on_ft': ['css', 'less']})
  call dein#add('othree/html5.vim', {'on_ft': ['html', 'xhtml', 'css', 'htmldjango']})
  call dein#add('ternjs/tern_for_vim', {'on_ft': ['javascript', 'html', 'htmldjango']})
  call dein#add('pangloss/vim-javascript', {'on_ft': ['javascript', 'html', 'htmldjango']})
  call dein#add('carlitux/deoplete-ternjs', {'on_ft': ['javascript', 'html', 'htmldjango']})
  call dein#add('plasticboy/vim-markdown',
        \ {'on_ft': ['markdown', 'mdown', 'mkdn', 'mdwn', 'mkd', 'md']})
  " call dein#add('othree/javascript-libraries-syntax.vim',
  "       \ {'on_ft': ['javascript', 'html', 'htmldjango']})

  call dein#end()
  call dein#save_state()
endif
