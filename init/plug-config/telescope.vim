" Plug 'nvim-telescope/telescope.nvim'

" Find files using Telescope command-line sugar.
nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <C-t> <cmd>Telescope oldfiles<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <C-b> <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fk <cmd>Telescope keymaps<cr>
nnoremap <leader>fb <cmd>Telescope file_browser<cr>
nnoremap <leader>fs :Telescope grep_string search=
nnoremap <leader>fi <cmd>Telescope git_status<cr>

" Telescope-coc
nnoremap <leader>fd <cmd>Telescope coc document_symbols<cr>
nnoremap <leader>ff <cmd>Telescope coc definitions<cr>
nnoremap <leader>fw <cmd>Telescope coc workspace_symbols<cr>
nnoremap <leader>fr <cmd>Telescope coc references<cr>
nnoremap <leader>fa <cmd>Telescope coc file_code_actions<cr>

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

require('telescope').load_extension('coc')
require('telescope').load_extension('fzf')
EOF
