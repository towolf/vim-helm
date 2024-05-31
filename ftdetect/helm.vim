function! s:isHelm()
  let filepath = expand("%:p")

  " yaml/yml/tpl/txt inside templates dir
  if filepath =~ '\v/(templates)/.*\.(ya?ml|tpl|txt)$' | return 1 | endif

  let filename = expand("%:t")

  " helmfile templated values
  if filename =~ '\v.*\.gotmpl$' | return 1 | endif

  " helmfile.yaml / helmfile-my.yaml / helmfile_my.yaml etc
  if filename =~ '\v(helmfile).*\.ya?ml$' | return 1 | endif

  return 0
endfunction

autocmd BufRead,BufNewFile * if s:isHelm() | set ft=helm | endif

" Use {{/* */}} as comments
autocmd FileType helm setlocal commentstring={{/*\ %s\ */}}
