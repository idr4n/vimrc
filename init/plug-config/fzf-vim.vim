" Settings for fzf.vim

if has('nvim')
  " Note: In neovim, no line numbers and foldcolumns are disabled
  " which are not automatically disabled by fzf in neovim
  augroup disable_in_Term
    au TermOpen * setlocal nonumber norelativenumber foldcolumn=0 signcolumn=no
    au TermOpen * call clearmatches() " clears ColorColum highlight
  augroup END
endif


" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

nmap ,<tab> <plug>(fzf-maps-n)
xmap ,<tab> <plug>(fzf-maps-xQwk)
nnoremap <silent> <expr> <C-P> (expand('%') =~ 'coc-explorer' ? "\<c-w>\<c-w>" : '').":Files\<cr>"
nnoremap <silent> <expr> <C-T> (expand('%') =~ 'coc-explorer' ? "\<c-w>\<c-w>" : '').":History\<cr>"
" nnoremap <silent> <expr> <C-P> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Files\<cr>"
" nnoremap <silent> <expr> <C-T> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":History\<cr>"
nnoremap <silent> <expr> <C-B> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Buffers\<cr>"
nnoremap <silent> <expr> <leader>bl (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Buffers\<cr>"
nnoremap <silent> <expr> <leader>fs (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":BLines\<cr>"
nnoremap <silent> <expr> <leader>r (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Rg\<cr>"
" nmap <C-P>          :Files<CR>
" nmap <C-T>          :History<CR>
" nmap <leader>bl     :Buffers<CR>
" nmap <leader>s      :BLines<CR>
" nmap <leader>r      :Rg<CR>

" Path completion with custom source command
inoremap <expr> <c-x><c-f> fzf#vim#complete#path('rg --files')

" Word completion with custom spec with popup layout option
inoremap <expr> <c-x><c-w> fzf#vim#complete#word({'window': { 'width': 0.2, 'height': 0.9, 'xoffset': 1 }})

" Window layout
" let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.9, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }

" No window layout , 50% of the screen instead of the default 40%
let g:fzf_layout = {'down':'50%'}

" Always enable preview window on the right with x% width
let g:fzf_preview_window = 'right:50%'

" let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'
let $FZF_DEFAULT_COMMAND="rg --files --hidden --follow --no-ignore -g '!.git/*' -g '!node_modules'"

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

