" General Commands definitions and corresponding mappings

function! s:RunCommand()
  call inputsave()
  " let s:cmd = input('Enter your shell command: _❯ ')
  let s:cmd = input("_\u276f ", "", "shellcmd")
  call inputrestore()
  let s:cmd = trim(s:cmd)
  if len(s:cmd) == 0 || isdirectory(s:name)
    redraw
    echo 'No command entered!'
    return
  endif
  execute '!clear && '.s:cmd
endfunction

function! s:NewNote()
  call inputsave()
  let s:name = input("Enter note name: ", "", "dir")
  call inputrestore()
  let s:name = trim(s:name)
  if len(s:name) == 0 || isdirectory(s:name)
    redraw
    echo 'No name entered!'
    return
  endif
  execute "e ~/Library/Mobile\ Documents/iCloud\~md\~obsidian/Documents/Notes-Database/".s:name.".md"
endfunction

" Runs shell command
command! RunCommand call s:RunCommand()
command! RunShellCmd call feedkeys(':!clear &&<space>')

" Create/edit daily note
command! TodayNote execute "e ~/Library/Mobile\ Documents/iCloud\~md\~obsidian/Documents/Notes-Database/Daily-Notes/".strftime("%F").".md"

" Create a new note in the Notes-Dabase directory
command! NewNote call s:NewNote()

if has("nvim")
  " Open markdown file in Marked 2
  command! OpenMarked2 execute 'silent !open -a Marked\ 2 "%"'
  " Open markdown in Deckset
  command! OpenDeckset execute 'silent !open -a Deckset "%"'
  " Convert markdown file to pdf using pandoc
  command! MdToPdf execute 'silent !pandoc "%" -o "%:r.pdf"'
  " Convert markdown file to Beamer presentation using pandoc
  command! MdToBeamer execute 'silent !pandoc "%" -t beamer -o "%:r.pdf"'
  " Reveal file in finder without changing the working dir in vim
  command! RevealInFinder execute 'silent !open -R "%"'
  " Code Run Script
  command! CodeRun execute '!~/scripts/code_run "%"'
else
  command! OpenMarked2 execute '!clear && open -a Marked\ 2 "%"'
  command! MdToPdf execute '!clear && pandoc "%" -o "%:r.pdf"'
  command! MdToBeamer execute '!clear && pandoc "%" -t beamer -o "%:r.pdf"'
  command! RevealInFinder execute '!clear && open -R "%"'
  command! CodeRun execute '!clear && ~/scripts/code_run "%"'
endif

" mappings
nmap <leader>to :TodayNote<CR>
nnoremap <leader>; :RevealInFinder<CR>
nnoremap <leader><S-n> :NewNote<CR>
" nnoremap <leader>cc :RunCommand<CR>
" nnoremap <leader>cl :RunShellCmd<CR>
nnoremap <leader>cr :CodeRun<CR>

augroup Commands
  autocmd!
  autocmd FileType markdown nnoremap <buffer> <F5> :OpenMarked2<CR>
  autocmd FileType markdown nnoremap <buffer> <leader>D :OpenDeckset<CR>
  autocmd FileType markdown nnoremap <buffer> <S-F5> :MdToPdf<CR>
  autocmd FileType markdown nnoremap <buffer> <leader>pb :MdToBeamer<CR>
augroup END
