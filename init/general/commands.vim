" General Commands definitions and corresponding mappings

command! EditDiary execute "e ~/Dropbox/Notes-Database/Daily-Notes/".strftime("%F").".md"

" Open markdown file in Marked 2
command! OpenMarked2 execute '!open -a Marked\ 2 "%"'

" Convert markdown file to pdf using pandoc
command! MdToPdf execute '!pandoc "%" -o "%:r.pdf"'

" Convert markdown file to Beamer presentation using pandoc
command! MdToBeamer execute '!pandoc "%" -t beamer -o "%:r.pdf"'

" Reveal file in finder without changing the working dir in vim
command! RevealInFinder execute '!open -R "%"'

" mappings
nmap <leader>di :EditDiary<CR>
nnoremap <leader>; :RevealInFinder<CR>

augroup Commands
  autocmd!
  autocmd FileType markdown nnoremap <buffer> <F5> :OpenMarked2<CR>
  autocmd FileType markdown nnoremap <buffer> <S-F5> :MdToPdf<CR>
  autocmd FileType markdown nnoremap <buffer> <leader>pb :MdToBeamer<CR>
augroup END
