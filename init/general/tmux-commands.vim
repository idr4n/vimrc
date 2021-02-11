" Integrates some Tmux commands in Vim
" If not in Tmux session, use a Vim terminal buffer

function! s:PythonWatch()
  if exists('$TMUX')
    execute 'silent !tmux split-window -h -p 40 watch python %'
    execute 'silent !tmux last-pane'
  else
    rightb vertical terminal ++close ++norestore ++cols=67 watch python %
    " TODO: add command to switch to last windown (similar to last-pane)
  endif
endfunction

function! s:LazyGit()
  if exists('$TMUX')
    execute 'silent !tmux split-window -v -p 70 lazygit'
  else
    " echohl WarningMsg | echo 'Not running inside a TMUX sessions!' | echohl None
    bel terminal ++close ++norestore ++rows=20 lazygit
    doautocmd User TmuxCommands
  endif
endfunction

function! s:LazyGitWindow()
  if exists('$TMUX')
    execute '!tmux new-window lazygit'
  else
    echohl WarningMsg | echo 'Not running inside a TMUX sessions!' | echohl None
  endif
endfunction

" Hide status-line
autocmd! User TmuxCommands set laststatus=0 noshowmode noruler
      \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

" Custom status-line
" function! s:term_statusline()
"   " Override statusline as you like
"   highlight fzf1 ctermfg=161 ctermbg=251
"   highlight fzf2 ctermfg=23 ctermbg=251
"   highlight fzf3 ctermfg=237 ctermbg=251
"   setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
" endfunction

" autocmd! User TmuxCommands call <SID>term_statusline()

" Commands
command! PythonWatch call s:PythonWatch()
command! LazyGit call s:LazyGit()
command! LazyGitWindow call s:LazyGitWindow()

" mappings
" nmap <leader>wp :call <SID>PythonWatch()<CR>
nmap <leader>wp :PythonWatch<CR>
nmap <leader>lg :LazyGit<CR>
nmap <leader>lw :LazyGitWindow<CR>
