" Plug 'folke/todo-comments.nvim'

lua << EOF
  require("todo-comments").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
EOF

" mappings
" todos in curreent directory
nnoremap <leader>tt <cmd>TodoTelescope<cr>
" todos in Notes-Database
nnoremap <leader>tn <cmd>TodoTelescope cwd=~/Dropbox/Notes-Database<cr> 

