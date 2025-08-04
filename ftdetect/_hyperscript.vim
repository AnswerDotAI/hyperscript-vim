" Detect *.hyperscript (or *.hyper) files
augroup hyperscript_detect
  autocmd!
  autocmd BufNewFile,BufRead *._hs,*.hyperscript,*.hyper setfiletype _hyperscript
augroup END
