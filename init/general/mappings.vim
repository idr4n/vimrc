" Rebind <Leader> key
" let mapleader = ","
let mapleader = "\<Space>"

" type leader+ev to edit the Vimrc
nnoremap <leader>v :e $MYVIMRC<CR>

" Quicker scaping
inoremap fd <ESC>
inoremap jk <ESC>

" Quicksave command
nnoremap <Leader>s :w<CR>

" " Move up and down with wrapped lines
nnoremap k gk
nnoremap j gj

" Implements typewriter mode (use scrollfix plugin instead!)
" nnoremap j gjzz
" nnoremap k gkzz
" inoremap <CR> <CR><C-O>zz

" Jump to start and end of line using the home row keys
map H ^
map L $

" Quit current window
noremap <Leader>e :quit<CR> 
" Quit all windows
noremap <Leader>E :qa!<CR> 

" close current buffer
" nmap <leader>q :bd<CR>
" nnoremap <expr> <silent> <leader>q g:NERDTree.IsOpen() ? ':NERDTreeClose<CR>:bd<CR>' : ':bd<CR>'

" Using Bbye plugin to close the current buffer
nnoremap <silent> <leader>q  :Bdelete<CR>
" wipeout current buffer
nnoremap <silent> <leader>w  :Bwipeout<CR>
nnoremap <leader>bd :bd<CR>

" Move around while in insert mode
inoremap <C-a> <C-O>0
inoremap <C-e> <C-O>$
inoremap <C-f> <right>

" swtich buffers with tab
nnoremap <silent> W           :bnext<CR>
nnoremap <silent> Q           :bprevious<CR>
nnoremap <silent> <leader>l   :b#<CR>

" easier indenting of code blocks
vnoremap < <gv 
vnoremap > >gv

" search for word under cursor and stays there
" searches exact word (* forward, # backwards)
nnoremap * *N
nnoremap # #N
" searches but not the exact word (* forward, # backwards)
nnoremap g* g*N
nnoremap g# g#N

" search for highlighted text
vnoremap ,/ y<C-O>/<C-R>"<CR>

" Duplicate line and comment old line out
nmap gcy gccyypgcc
" Duplicate and comment selection
vmap gy gcgvyPgvgc

" Add blank line up and down using unimpaired commands
nmap <silent> ,l ]<space>[<space>

" Insert semicolon at the end of line
nnoremap <C-c>; $a;<esc>
inoremap <C-c>; <esc>$a;

" Transfor selection to title case
vnoremap <silent> <c-u> :s/\<\(\w\)\(\w*\)\>/\u\1\L\2/g<CR>:nohls<CR>

"" Toggle spell checking
map      <F6> :setlocal spell! spelllang=en_us<CR>
inoremap <F6> <C-o>:setlocal spell! spelllang=en_us<CR>

" Removes highlight of last search
nnoremap <silent><leader>z :nohls<CR>
vnoremap <silent><leader>z :nohls<CR>

" Set current's file path as working directory
nnoremap <leader>dc :cd %:p:h<CR>
" Set pCloud as working directory
nnoremap <leader>dp :cd ~/pCloud<CR>
" Set Home as working directory
nnoremap <leader>dh :cd<CR>
" Set ~/.vim as working directory
nnoremap <leader>dv :cd ~/.vim/init<CR>
" Go up one directory
nnoremap <leader>up :cd ..<CR>


" Filetype specific mappings

" Markdown mappings
augroup mappings_md
  autocmd!
  au FileType markdown vmap ,b S*gvS*
  au FileType markdown vmap ,i S_
  au FileType markdown vmap ,m S$
augroup END


