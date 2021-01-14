"" Plug 'neoclide/coc.nvim', {'branch': 'release'}

" extensions automatically installed and updated by Coc
let g:coc_global_extensions = [
  \ 'coc-tsserver'
  \ ]

" TextEdit might fail if hidden is not set.
set hidden

" Give more space for displaying messages.
" set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

set signcolumn=yes

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <c-l> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <c-l> could be remapped by other vim plugin, try `:verbose imap <c-l>`.
if exists('*complete_info')
  inoremap <expr> <c-l> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" navigate diagnostics
" nmap <silent> <leader>l <Plug>(coc-diagnostic-next)
nmap <silent> ]g <Plug>(coc-diagnostic-next-error)
nmap <silent> [g <Plug>(coc-diagnostic-prev-error)
nmap <silent> ]G <Plug>(coc-diagnostic-next)
nmap <silent> [G <Plug>(coc-diagnostic-prev)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Multiple cursors
hi CocCursorRange guibg=#b16286 guifg=#ebdbb2

nmap <silent> <C-c> <Plug>(coc-cursors-position)
xmap <silent> <leader>m <Plug>(coc-cursors-range)

nmap <expr> <silent> <leader>m <SID>select_current_word()
function! s:select_current_word()
  if !get(g:, 'coc_cursors_activated', 0)
    return "\<Plug>(coc-cursors-word)"
  endif
  return "*\<Plug>(coc-cursors-word):nohlsearch\<CR>"
endfunc

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Symbol renaming.
" nmap <leader>rn <Plug>(coc-rename)
nmap <F2> <Plug>(coc-rename)
nmap ,d <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>F  <Plug>(coc-format-selected)
nmap <leader>F  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>af  <Plug>(coc-fix-current)

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> ,a  :<C-u>CocList diagnostics<cr>
" Show commands.
nnoremap <silent> ,c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> ,o  :<C-u>CocList outline<cr>
nnoremap <silent> <leader>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> ,s  :<C-u>CocList -I symbols<cr>
" Resume latest coc list.
" nnoremap <silent> ,p  :<C-u>CocListResume<CR>
" NOTE: Don't understand these mappings so commentings them out
" " Do default action for next item.
" nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" " Do default action for previous item.
" nnoremap <silent> <space>k  :<C-u>CocPrev<CR>

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

"" Functions
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" " CoC extensions settions

" coc-prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile
vmap <leader><s-f>  <Plug>(coc-format-selected)
nmap <leader><s-f>  <Plug>(coc-format-selected)

" coc-explorer
map <silent> <C-n> :CocCommand explorer<CR>
map <silent> <C-f> :CocCommand explorer --no-toggle<CR>

function! s:coc_explorer_leave()
  if winwidth(0) > 150
    setlocal numberwidth=20 foldcolumn=12
    highlight FoldColumn guibg=b:bg_color guifg=b:bg_color
  elseif winwidth(0) > 120
    setlocal numberwidth=10 foldcolumn=10
    highlight FoldColumn guibg=b:bg_color
  elseif winwidth(0) > 85
    setlocal numberwidth=4 foldcolumn=0
    highlight FoldColumn guibg=b:bg_color
  else
    setlocal numberwidth=3 foldcolumn=0
  endif
endfunction

autocmd! User CocExplorerQuitPost nested call <SID>coc_explorer_leave()
