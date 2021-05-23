" Plug 'reedes/vim-pencil'

let g:pencil#wrapModeDefault = 'soft'   " default is 'hard'
let g:pencil#textwidth = 74
let g:pencil#autoformat = 1

augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
  " autocmd FileType text         call pencil#init()
  autocmd FileType text         call pencil#init({'wrap': 'hard'})
augroup END
