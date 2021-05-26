" Plug 'mcchrish/nnn.vim'

if has("nvim")
  let g:nnn#layout = { 'window': { 'width': 0.45, 'height': 0.6, 'highlight': 'Debug', 'xoffset': 0.95, 'yoffset': 0.1 } }
endif

" Disable default mapping
let g:nnn#set_default_mappings = 0
" Start nnn in the current file's directory
nnoremap <silent> <leader>n :NnnPicker %:p:h<CR>

let g:nnn#statusline = 0
