if has('autocmd')
  augroup evt
  autocmd evt BufNewFile,BufRead *.evt setfiletype evt
endif
