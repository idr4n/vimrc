" Plug 'rrethy/vim-hexokinase'

if has('nvim')
  " let g:Hexokinase_highlighters = ['backgroundfull']
  let g:Hexokinase_highlighters = ['sign_column']
  set signcolumn=yes:2
else
  let g:Hexokinase_highlighters = ['backgroundfull']
endif
