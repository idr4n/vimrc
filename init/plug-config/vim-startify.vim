" Plug 'mhinz/vim-startify'

" Startify mappings
nnoremap <silent> <leader>kf :SClose<CR>
nnoremap <silent> <leader>gh :Startify<CR>

" Where startigy stores sessions
let g:startify_session_dir = '~/.vim/sessions'

" " Some laft padding
let g:startify_padding_left = 10

" returns all modified files of the current git repo
" `2>/dev/null` makes the command fail quietly, so that when we are not
" in a git repo, the list will be empty
function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

" same as above, but show untracked files, honouring .gitignore
function! s:gitUntracked()
    let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

" Startify lists
let g:startify_lists = [
    \ { 'type': 'sessions',  'header': ['          Sessions']       },
    \ { 'type': 'files',     'header': ['          MRU Files']          },
    \ { 'type': 'bookmarks', 'header': ['          Bookmarks']      },
    \ { 'type': function('s:gitModified'),  'header': ['         git modified']},
    \ { 'type': function('s:gitUntracked'), 'header': ['         git untracked']},
    \ ]


let g:startify_bookmarks = [
    \ { 'i': '~/.config/nvim/init.vim' },
    \ { 't': '~/pCloud/dotfiles/.tmux.conf' },
    \ { 'z': '~/pCloud/dotfiles/.zshrc' },
    \ { 'n': '~/.config/nvim/init' },
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
