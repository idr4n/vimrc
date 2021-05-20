" Plug 'mhinz/vim-startify'

" Startify mappings
nnoremap <silent> <leader>kf :SClose<CR>
nnoremap <silent> <leader>gh :Startify<CR>

" Where startigy stores sessions
if has('nvim')
    let g:startify_session_dir = '~/.config/nvim/sessions'
else
    let g:startify_session_dir = '~/.vim/sessions'
endif

" " Some laft padding
let g:startify_padding_left = 10

" Startify lists
let g:startify_lists = [
    \ { 'type': 'sessions',  'header': ['          Sessions']       },
    \ { 'type': 'files',     'header': ['          MRU Files']          },
    \ { 'type': 'bookmarks', 'header': ['          Bookmarks']      },
    \ ]

let g:startify_bookmarks = [
    \ { 'i': '~/.config/nvim/init.vim' },
    \ { 'z': '~/pCloud/dotfiles/.zshrc' },
    \ '~/pCloud/Dev',
    \ ]


" Custom header
" let g:startify_custom_header = [
"       \ '      __   __                __ _     ',
"       \ '      \ \ / /   _ ___ _   _ / _( )___ ',
"       \ '       \ V / | | / __| | | | |_|// __|',
"       \ '        | || |_| \__ \ |_| |  _| \__ \',
"       \ '        |_| \__,_|___/\__,_|_|   |___/',
"       \]

" Let Startify take care of buffers
let g:startify_session_delete_buffers = 1

let g:startify_change_to_vcs_root = 1

" Automatically Update Sessions
let g:startify_session_persistence = 1

" Get rid of empy buffer on quit
let g:startify_enable_special = 1

" Close NerdTree before saving session
" Add \ 'silent! Defx -close' if Defx activated instead
let g:startify_session_before_save = [
      \ 'silent! NERDTreeClose',
      \ ]
