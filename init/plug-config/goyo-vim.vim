" Toggles GoYo

let g:goyo_height = 100
let g:goyo_width = 75
let g:goyo_linenr = 0

" nmap <leader>c :Goyo<CR>:highlight LineNr ctermfg=240<CR>
nmap <leader>gg :Goyo<CR>

function! s:goyo_leave()
  syntax off
  syntax on
  " let b:bg_color = synIDattr(hlID("Normal"), 'bg', 'gui')
  " highlight FoldColumn guibg=b:bg_color
  exec printf('highlight FoldColumn guibg=%s', synIDattr(hlID("Normal"), 'bg', 'gui'))
  highlight GitGutterAdd ctermfg=22 guifg=#A9DC76 ctermbg=NONE guibg=NONE
  highlight GitGutterChange ctermfg=58 guifg=#FC9867 ctermbg=NONE guibg=NONE
  highlight GitGutterDelete ctermfg=52 guifg=#FF6188 ctermbg=NONE guibg=NONE
  highlight GitGutterChangeDelete ctermfg=52 guifg=#FF6188 ctermbg=NONE guibg=NONE
endfunction

autocmd! User GoyoLeave nested call <SID>goyo_leave()
