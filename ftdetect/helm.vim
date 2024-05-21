function! s:isHelm()
  let filepath = expand("%:p")
  let filename = expand("%:t")
  if filepath =~ '\v/(templates)/.*\.(ya?ml|gotmpl|tpl|txt)$' | return 1 | en
  if filename =~ '\v(helmfile).ya?ml' | return 1 | en
  return 0
endfunction

autocmd BufRead,BufNewFile * if s:isHelm() | set ft=helm | en

" Use {{/* */}} as comments
autocmd FileType helm setlocal commentstring={{/*\ %s\ */}}
