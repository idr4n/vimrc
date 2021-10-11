" Plug 'chriskempson/base16-vim'

set fillchars+=vert:│

" Notes: use the following so the themes use bold and italics in markdown
" https://github.com/chriskempson/base16-vim/issues/128
" cd base16-vim/colors
" gsed -ri '/Italic/ s/^([^,]*,){5} "(none)?/\1 "italic/' *vim
" gsed -ri '/Bold/ s/^([^,]*,){5} "(none)?/\1 "bold/' *vim

function! s:base16_customize_light() abort
  call Base16hi("Comment", "", "", "", "", "italic", "")
  call Base16hi("NonText", "5c5c5c", "", "", "", "none", "")
  call Base16hi("Error", "c8c8c8", "", "", "", "", "")
  call Base16hi("SpellBad",   "873936", "", "", "", "undercurl", "")
  call Base16hi("SpellLocal", "873936", "", "", "", "undercurl", "")
  call Base16hi("SpellCap",   "873936", "", "", "", "undercurl", "")
  call Base16hi("SpellRare",  "873936", "", "", "", "undercurl", "")
  call Base16hi("MatchParen", "E5C078", g:base16_gui00, "11", "none",  "bold", "")
endfunction

function! s:base16_customize_dark() abort
  call Base16hi("Normal", "", "1D1F21", "", "", "", "") " Backgorund color
  " call Base16hi("LineNr", "585858", "181818", "236", "232", "", "")
  " call Base16hi("LineNr", "484848", "1D1F21", "236", "0", "", "")
  " call Base16hi("LineNr", "484848", g:base16_gui00, "236", "0", "", "")
  " call Base16hi("CursorLineNr", "585858", "1D1F21", "", "", "none", "")
  " call Base16hi("CursorLineNr", "585858", g:base16_gui00, "", "", "none", "")
  " call Base16hi("CursorLine", "", "171717", "", "", "", "")
  call Base16hi("Comment", "", "", "", "", "italic", "")
  " call Base16hi("SignColumn", "", "1D1F21", "", "0", "", "")
  " call Base16hi("SignColumn", "", g:base16_gui00, "", "0", "", "")
  call Base16hi("NonText", "5c5c5c", "", "", "", "none", "")
  " call Base16hi("ColorColumn", "", "873936", "", "", "", "")
  call Base16hi("Error", "c8c8c8", "", "", "", "", "")
  call Base16hi("SpellBad",   "873936", "", "", "", "undercurl", "")
  call Base16hi("SpellLocal", "873936", "", "", "", "undercurl", "")
  call Base16hi("SpellCap",   "873936", "", "", "", "undercurl", "")
  call Base16hi("SpellRare",  "873936", "", "", "", "undercurl", "")
  call Base16hi("MatchParen", "E5C078", "1D1F21", "11", "none",  "bold", "")
endfunction

augroup on_change_colorschema
  autocmd!
  " autocmd ColorScheme * call s:base16_customize()
  autocmd ColorScheme * highlight VertSplit ctermbg=NONE guibg=NONE
augroup END
let base16colorspace=256
" colorscheme base16-default-dark
" colorscheme base16-gruvbox-dark-hard
" colorscheme base16-atelier-dune-light
" colorscheme base16-solarized-light
" colorscheme base16-github

if strftime("%H") >= 7 && strftime("%H") < 19 && $TERM_PROGRAM == 'iTerm.app'
  " set background=light
  " colorscheme base16-gruvbox-light-hard
  augroup on_change_color
    autocmd!
    autocmd ColorScheme * call s:base16_customize_light()
  augroup END
  " colorscheme base16-solarized-light
  colorscheme base16-one-light
  " colorscheme base16-atelier-dune-light
else
  " set background=dark
  augroup on_change_color
    autocmd!
    autocmd ColorScheme * call s:base16_customize_dark()
  augroup END
  colorscheme base16-default-dark
  " colorscheme base16-gruvbox-dark-hard
endif
