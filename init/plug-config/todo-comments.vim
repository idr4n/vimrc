" Plug 'folke/todo-comments.nvim'

lua << EOF
  require("todo-comments").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }

  require("trouble").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
EOF

" mappings
" todos in curreent directory
nnoremap <leader>tt <cmd>TodoTrouble<cr>
" todos in Notes-Database
nnoremap <leader>tn <cmd>TodoTrouble cwd=~/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/Notes-Database<cr>

