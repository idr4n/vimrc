" Plug 'chriskempson/base16-vim'

set fillchars+=vert:│

" Notes: use the following so the themes use bold and italics in markdown
" https://github.com/chriskempson/base16-vim/issues/128
" cd base16-vim/colors
" gsed -ri '/Italic/ s/^([^,]*,){5} "(none)?/\1 "italic/' *vim
" gsed -ri '/Bold/ s/^([^,]*,){5} "(none)?/\1 "bold/' *vim

function! s:base16_customize() abort
  call Base16hi("Normal", "", "000000", "", "", "", "") " Backgorund color
  " call Base16hi("LineNr", "585858", "181818", "236", "232", "", "")
  call Base16hi("LineNr", "383838", "000000", "236", "0", "", "")
  call Base16hi("CursorLineNr", "585858", "000000", "", "", "none", "")
  call Base16hi("Comment", "", "", "", "", "italic", "")
  call Base16hi("SignColumn", "", "000000", "", "0", "", "")
  call Base16hi("NonText", "5c5c5c", "", "", "", "none", "")
  call Base16hi("ColorColumn", "", "873936", "", "", "", "")
  call Base16hi("SpellBad",   "873936", "", "", "", "undercurl", "")
  call Base16hi("SpellLocal", "873936", "", "", "", "undercurl", "")
  call Base16hi("SpellCap",   "873936", "", "", "", "undercurl", "")
  call Base16hi("SpellRare",  "873936", "", "", "", "undercurl", "")
endfunction

augroup on_change_colorschema
  autocmd!
  autocmd ColorScheme * call s:base16_customize()
  autocmd ColorScheme * highlight VertSplit ctermbg=NONE guibg=NONE
augroup END
let base16colorspace=256
colorscheme base16-default-dark

