function! s:isHelm()
  let filepath = expand("%:p")

  " yaml/yml/tpl/txt inside templates or sub dirs
  " Chart.yaml exsists in partent of templates dir
  let templates_pos = stridx(filepath, '/templates/')
  if templates_pos != -1
    let chart_root = strpart(filepath, 0, templates_pos)
    if filereadable(chart_root . '/Chart.yaml') && filepath =~# '\v\.(ya?ml|tpl|txt)$'
      return 1
    endif
  endif

  let filename = expand("%:t")

  " helmfile templated values
  if filename =~ '\v.*\.gotmpl$' | return 1 | endif

  " helmfile.yaml / helmfile-my.yaml / helmfile_my.yaml etc
  if filename =~ '\v(helmfile).*\.ya?ml$' | return 1 | endif

  return 0
endfunction

" create helper function for neovim compatibility
function! s:CheckAndSetHelmFT()
  if s:isHelm()
    set ft=helm
  endif
endfunction

" wait until vim/neovim filetype detection is done
autocmd FileType yaml,text,gotmpl call s:CheckAndSetHelmFT()

autocmd BufRead,BufNewFile *.tpl call s:CheckAndSetHelmFT()
autocmd BufRead,BufNewFile values*.yaml setfiletype yaml.helm-values

" Use {{/* */}} as comments
autocmd FileType helm setlocal commentstring={{/*\ %s\ */}}
