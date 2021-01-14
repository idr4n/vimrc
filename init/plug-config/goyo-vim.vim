" Toggles GoYo

let g:goyo_height = 100
let g:goyo_linenr = 1

" nmap <leader>c :Goyo<CR>:highlight LineNr ctermfg=240<CR>
nmap <leader>gg :Goyo<CR>

function! s:goyo_leave()
  syntax off
  syntax on
  let b:bg_color = synIDattr(hlID("Normal"), 'bg', 'gui')
  highlight FoldColumn guibg=b:bg_color
endfunction

autocmd! User GoyoLeave nested call <SID>goyo_leave()
