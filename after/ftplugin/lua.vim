setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
call deoplete#custom#source('omni', 'functions', {
    \ 'lua':  'xolox#lua#omnifunc',
    \})
call deoplete#custom#buffer_var('omni', 'input_patterns', {
    \ 'lua': ['\w+|[^. *\t][.:]\w*', 'require\s*\(?["'']\w*'],
    \})
