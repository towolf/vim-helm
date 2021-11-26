autocmd BufRead,BufNewFile */templates/*.yaml,*/templates/*.tpl set ft=helm

" Use {{/* */}} as comments
autocmd FileType helm setlocal commentstring={{/*\ %s\ */}}
