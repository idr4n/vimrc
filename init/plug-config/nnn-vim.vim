" Plug 'mcchrish/nnn.vim'

let g:nnn#layout = { 'window': { 'width': 0.45, 'height': 0.6, 'highlight': 'Debug', 'xoffset': 0.95, 'yoffset': 0.1 } }

" Disable default mapping
let g:nnn#set_default_mappings = 0
" Start nnn in the current file's directory
nnoremap <leader>n :NnnPicker %:p:h<CR>
