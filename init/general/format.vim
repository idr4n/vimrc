" " Highlight when one line is over 80 characters
" highlight ColorColumn guibg=magenta
" call matchadd('ColorColumn', '\%81v.', 100)
augroup hl_colorcolumn
  autocmd!
  au BufEnter,WinEnter * match ColorColumn '\%81v.'
  " au BufEnter,WinEnter * highlight ColorColumn guibg=magenta
augroup END

" Turnoff automatic new line comment
" set sh filetype to zsh theme files
augroup Format
  autocmd!
  " au FileType * set fo-=r fo-=o
  au FileType * set fo-=o
  au BufEnter *.zsh-theme set filetype=zsh
  " autocmd BufNewFile,BufRead * setlocal formatoptions-=r
augroup END

