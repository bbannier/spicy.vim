if has('autocmd')
  augroup hlt
  autocmd hlt BufNewFile,BufRead *.hlt setfiletype hlt
endif
