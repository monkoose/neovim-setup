let s:config_dir = stdpath('config')
execute 'source ' .. s:config_dir .. '/plugins.vim'
execute 'source ' .. s:config_dir .. '/options.vim'
execute 'source ' .. s:config_dir .. '/maps.vim'
execute 'source ' .. s:config_dir .. '/statusline.vim'

" configure lua plugins
execute 'luafile ' .. s:config_dir .. '/luaconfig.lua'
