autocmd BufRead,BufNewFile */templates/*.{yaml,yml},*/templates/*.tpl,*.gotmpl,helmfile*.{yaml,yml} set ft=helm

" Use {{/* */}} as comments
autocmd FileType helm setlocal commentstring={{/*\ %s\ */}}
