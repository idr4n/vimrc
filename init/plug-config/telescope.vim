" Plug 'nvim-telescope/telescope.nvim'

" Find files using Telescope command-line sugar.
nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <C-t> <cmd>Telescope oldfiles<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <C-b> <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

lua << EOF
local actions = require('telescope.actions')
require('telescope').setup({
  defaults = {
    -- layout_strategy = 'vertical',
    layout_strategy = 'horizontal',
    layout_config = {
      vertical = {
        preview_cutoff = 10,
        preview_height = 0.4
      },
      horizontal = { 
        width = .95,
        preview_width = 0.5,
        preview_cutoff = 60
      }
    },
    mappings = {
      i = {
        ["<esc>"] = actions.close,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      },
    },
  },
})
EOF
