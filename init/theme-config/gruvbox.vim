" Plug 'gruvbox-community/gruvbox'

"" Dark constrast (default = medium)
" let g:gruvbox_contrast_dark='soft'
let g:gruvbox_contrast_dark='hard'

"" For light version.
" set background=light

let g:gruvbox_italic='1'
let g:gruvbox_sign_column='bg0'
let g:gruvbox_invert_selection='0'

augroup on_change_colorscheme
  autocmd!
  autocmd ColorScheme * highlight CursorLine guibg=#303030
  " autocmd ColorScheme * highlight CursorLineNr guibg=bg0
  autocmd BufEnter,WinEnter,VimResized * highlight FoldColumn guifg=#1D2021
augroup END

colorscheme gruvbox

